#include "philo.h"

static void	yoric(t_table *table, int c_philo)
{
	if (gettime_ms() - table->philos[c_philo].meal_stamp >= table->props[TTD])
	{
		mtx_setval(table, &table->table_mtx, &table->active, 0);
		print_status(table, c_philo + 1, DIE);
	}
}

static void	monitor_threads(t_table *table)
{
	int	c_philo;
	int	fed;

	while (1)
	{
		fed = 0;
		c_philo = 0;
		while (c_philo < table->props[P_NUM])
		{
			mtx_op(table, &table->philo_mtx, LK);
			fed += (table->props[MEALS] != -1 && table->philos[c_philo].meals >= table->props[MEALS]);
			yoric(table, c_philo);
			mtx_op(table, &table->philo_mtx, ULK);
			c_philo += 1;
		}
		if (is_stopped(table))
			break ;
		if (fed >= table->props[P_NUM])
		{
			mtx_setval(table, &table->table_mtx, &table->active, 0);
			break ;
		}
	}
}

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	table.start_stamp = gettime_ms();
	for (int i = 0; i < table.props[P_NUM]; i++)
	{
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
		mtx_op(&table, &table.philo_mtx, LK);
		table.philos[i].meal_stamp = gettime_ms();
		mtx_op(&table, &table.philo_mtx, ULK);
	}
	table.t_status = 2;
	monitor_threads(&table);
	destroy_table(&table);
	return (0);
}
