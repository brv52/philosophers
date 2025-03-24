#include "philo.h"

long	get_time_diff(t_timer *beg, t_timer *end)
{
	t_timer	tmp;
	long	s_diff;
	long	us_diff;

	if (!end)
	{
		gettimeofday(&tmp, NULL);
		end = &tmp;
	}
	s_diff = end->tv_sec - beg->tv_sec;
	us_diff = end->tv_usec - beg->tv_usec;
	return (s_diff * 1000 + us_diff / 1000);
}

int	precise_sleep(t_table *table, long ms)
{
	t_timer	t;

	gettimeofday(&t, NULL);
	while (get_time_diff(&t, NULL) < ms)
	{
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
			return (1);
		usleep(50);
	}
	return (0);
}
