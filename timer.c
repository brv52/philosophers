#include "philo.h"

long gettime_ms()
{
	t_timer	time;

	gettimeofday(&time, NULL);
	return (time.tv_sec * 1000 + time.tv_usec / 1000);
}

int	msleep(t_table *table, long ms)
{
	long	sleep_time;

	sleep_time = gettime_ms() + ms;
	while (gettime_ms() < sleep_time)
	{
		if (is_stopped(table))
			return (1);
		usleep(50);
	}
	return (0);
}
