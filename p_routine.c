#include "philo.h"

static void	philo_wait_start(t_table *table, t_philo *philo)
{
	mtx_op(table, &table->table_mtx, LK);
	table->barier += 1;
	mtx_op(table, &table->table_mtx, ULK);

	while (1)
	{
		mtx_op(table, &table->table_mtx, LK);
		if (table->barier >= table->props[P_NUM])
		{
			mtx_op(table, &table->hb_mtx, LK);
			philo->meal_stamp = table->start_stamp;
			mtx_op(table, &table->hb_mtx, ULK);
			mtx_op(table, &table->table_mtx, ULK);
			break;
		}
		mtx_op(table, &table->table_mtx, ULK);
	}
}

void	*hb_routine(void *arg)
{
	t_table	*table;
	int		c_philo;

	table = (t_table *)arg;
	while (1)
	{
		mtx_op(table, &table->table_mtx, LK);
		if (table->barier >= table->props[P_NUM])
		{
			mtx_op(table, &table->table_mtx, ULK);
			break;
		}
		mtx_op(table, &table->table_mtx, ULK);
	}
	while (1)
	{
		int	dead;
		int	fed;
		fed = 0;
		c_philo = 0;
		while (c_philo < table->props[P_NUM])
		{
			mtx_op(table, &table->hb_mtx, LK);
			dead = (get_time_diff(&table->philos[c_philo].meal_stamp, NULL) >= table->props[TTD]);
			fed += (table->props[MEALS] != -1 && table->philos[c_philo].meals >= table->props[MEALS]);
			mtx_op(table, &table->hb_mtx, ULK);
			if (dead)
			{
				mtx_setval(table, &table->table_mtx, &table->barier, 0);
				print_status(table, c_philo + 1, DIE);
				return (NULL);
			}
			c_philo += 1;
		}
		if (fed >= table->props[P_NUM])
		{
			mtx_setval(table, &table->table_mtx, &table->barier, 0);
			return (NULL);
		}
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
			break ;
	}
	return (NULL);
}

static int	ph_action(t_table *table, t_action a_type)
{
	long	time;

	if (a_type == EAT)
		time = table->props[TTE];
	else if (a_type == SLEEP)
		time = table->props[TTS];
	else if (a_type == THINK)
		time = table->props[TTT];
	else
		time = 0;
	return (precise_sleep(table, time));
}

static int	ph_eat(t_table *table, t_philo *philo)
{
	int	act_res;

	if (philo->id % 2 == 0)
	{
		mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], LK);
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
		{
			mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], ULK);
			return (1);
		}
		print_status(table, philo->id, FORK);
		mtx_op(table, &table->forks[philo->id - 1], LK);
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
		{
			mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], ULK);
			mtx_op(table, &table->forks[philo->id - 1], ULK);
			return (1);
		}
		print_status(table, philo->id, FORK);
	}
	else
	{
		mtx_op(table, &table->forks[philo->id - 1], LK);
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
		{
			mtx_op(table, &table->forks[philo->id - 1], ULK);
			return (1);
		}
		print_status(table, philo->id, FORK);
		if (table->props[P_NUM] == 1)
		{
			mtx_op(table, &table->forks[philo->id - 1], ULK);
			return (1);
		}
		mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], LK);
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
		{
			mtx_op(table, &table->forks[philo->id - 1], ULK);
			mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], ULK);
			return (1);
		}
		print_status(table, philo->id, FORK);
	}
	mtx_op(table, &table->hb_mtx, LK);
	gettimeofday(&philo->meal_stamp, NULL);
	philo->meals += 1;
	mtx_op(table, &table->hb_mtx, ULK);
	print_status(table, philo->id, EAT);
	act_res = ph_action(table, EAT);
	mtx_op(table, &table->forks[philo->id - 1], ULK);
	mtx_op(table, &table->forks[philo->id % table->props[P_NUM]], ULK);
	return (act_res);
}

void	*philo_routine(void *arg)
{
	t_philo	*philo;
	t_table	*table;

	philo = (t_philo *)arg;
	table = philo->table;
	philo_wait_start(table, philo);
	while (mtx_getval(table, &table->table_mtx, &table->barier) != 0)
	{
		if (ph_eat(table, philo) != 0)
			return (NULL);
		print_status(table, philo->id, SLEEP);
		if (ph_action(table, SLEEP) != 0)
			return (NULL);
		print_status(table, philo->id, THINK);
		if (ph_action(table, THINK) != 0)
			return (NULL);
	}
	return (NULL);
}
