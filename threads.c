#include "philo.h"

void	threads_wait(t_table *table)
{
	int	c_thread;

	c_thread = 0;
	if (table->t_status > 1)
	{
		while (c_thread < table->props[P_NUM])
		{
			pthread_join(table->philos[c_thread].thread, NULL);
			c_thread += 1;
		}
		pthread_join(table->heartbeat, NULL);
	}
}
