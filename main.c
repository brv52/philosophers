#include "philo.h"

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	gettimeofday(&table.start_stamp, NULL);
	for (int i = 0; i < table.props[P_NUM]; i++)
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
	pthread_create(&table.heartbeat, NULL, hb_routine, &table);
	table.t_status = 2;
	destroy_table(&table);
	return (0);
}
