#include "philo.h"

static int	ph_action(t_table *table, t_action a_type)
{
	long	time;

	if (a_type == EAT)
		time = table->props[TTE];
	else if (a_type == SLEEP)
		time = table->props[TTS];
	else if (a_type == THINK && table->props[P_NUM] % 2 != 0)
	{
		time = (table->props[TTE] * 2 - table->props[TTS]) / 2;
		if (time < 0)
			time = 0;
	}
	else
		time = 0;
	return (msleep(table, time));
}

static void def_forks(t_table *table, t_philo *philo, int *first, int *second)
{
	if (philo->id % 2 == 0)
	{
		*first = philo->id % table->props[P_NUM];
		*second = philo->id - 1;
	}
	else
	{
		*first = philo->id - 1;
		*second = philo->id % table->props[P_NUM];
	}
}

static int	eat(t_table *table, t_philo *philo)
{
	int	res;
	int	first;
	int	second;

	def_forks(table, philo, &first, &second);
	mtx_op(table, &table->forks[first], LK);
	print_status(table, philo->id, FORK);
	if (table->props[P_NUM] == 1)
	{
		msleep(table, table->props[TTD]);
		mtx_op(table, &table->forks[first], ULK);
		return (1);
	}
	mtx_op(table, &table->forks[second], LK);
	print_status(table, philo->id, FORK);
	mtx_op(table, &table->philo_mtx, LK);
	print_status(table, philo->id, EAT);
	philo->meal_stamp = gettime_ms();
	mtx_op(table, &table->philo_mtx, ULK);
	res = ph_action(table, EAT);
	philo->meals += 1;
	mtx_op(table, &table->forks[first], ULK);
	mtx_op(table, &table->forks[second], ULK);
	return (res);
}

void	*philo_routine(void *arg)
{
	t_philo	*philo;
	t_table	*table;

	philo = (t_philo *)arg;
	table = philo->table;
	while (!is_stopped(table))
	{
		if (eat(table, philo) != 0)
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
