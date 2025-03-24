#include "philo.h"

static long	ft_atoi(t_table *table, char *str)
{
	long	res;

	if (!str || !*str)
		exit_error(table, "args error");
	while (*str && is_whitespace(*str))
		str += 1;
	if (*str && *str == '-')
		exit_error(table, "args error");
	else if (*str && *str == '+')
		str += 1;
	res = 0;
	while (*str && is_num(*str))
	{
		res = res * 10 + (*str - '0');
		if (res > INT_MAX)
			exit_error(table, "args error: >INT_MAX");
		str += 1;
	}
	if (res > INT_MAX)
		exit_error(table, "args error");
	return (res);
}
static void	init_setup(t_table *table)
{
	int	c_idx;

	c_idx = 0;
	while (c_idx < table->props[P_NUM])
	{
		table->philos[c_idx].id = c_idx + 1;
		table->philos[c_idx].table = table;
		table->philos[c_idx].meals = 0;
		mtx_op(table, &table->forks[c_idx], CRT);
		c_idx += 1;
	}
}

void	table_create(t_table *table, int argc, char **argv)
{
	int	c_arg;

	table->t_status = 0;
	if (argc < 5 || argc > 6)
		exit_error(NULL, "args error");
	c_arg = 1;
	while (c_arg < argc)
	{
		table->props[c_arg - 1] = ft_atoi(NULL, argv[c_arg]);
		c_arg += 1;
	}
	if (argc == 5)
		table->props[MEALS] = -1;
	table->props[TTT] = (table->props[TTD] - table->props[TTE] - table->props[TTS]) / 2;
	table->barier = 0;
	table->philos = malloc(table->props[P_NUM] * sizeof(t_philo));
	table->forks = malloc(table->props[P_NUM] * sizeof(t_mutex));
	init_setup(table);
	mtx_op(table, &table->table_mtx, CRT);
	mtx_op(table, &table->hb_mtx, CRT);
	mtx_op(table, &table->print_mtx, CRT);
	table->t_status = 1;
}
void	destroy_table(t_table *table)
{
	int	c_fork;

	threads_wait(table);
	c_fork = 0;
	while (c_fork < table->props[P_NUM])
	{
		mtx_op(table, &table->forks[c_fork], DST);
		c_fork += 1;
	}
	mtx_op(table, &table->hb_mtx, DST);
	mtx_op(table, &table->print_mtx, DST);
	mtx_op(table, &table->table_mtx, DST);
	free(table->philos);
	free(table->forks);
}
