#include "philo.h"

int	is_num(char c)
{
	return (c >= '0' && c <= '9');
}

int	is_whitespace(char c)
{
	return (c == ' ' || (c >= 9 && c <= 13));
}

void	exit_error(t_table *table, char *msg)
{
	printf("error: %s\n", msg);
	if (table)
		destroy_table(table);
	exit(EXIT_FAILURE);
}

void	print_status(t_table *table, int idx, t_action action)
{
	if (!is_stopped(table) || action == DIE)
	{
		mtx_op(table, &table->print_mtx, LK);
		if (action == FORK)
			printf("%ld %d has taken a fork\n", gettime_ms() - table->start_stamp, idx);
		else if (action == EAT)
			printf("%ld %d is eating\n", gettime_ms() - table->start_stamp, idx);
		else if (action == SLEEP)
			printf("%ld %d is sleeping\n", gettime_ms() - table->start_stamp, idx);
		else if (action == THINK)
			printf("%ld %d is thinking\n", gettime_ms() - table->start_stamp, idx);
		else
			printf("%ld %d died\n", gettime_ms() - table->start_stamp, idx);
		mtx_op(table, &table->print_mtx, ULK);
	}
}

int	is_stopped(t_table *table)
{
	return (mtx_getval(table, &table->table_mtx, &table->active) == 0);
}
