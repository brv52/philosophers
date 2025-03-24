#include "philo.h"

void	mtx_op(t_table *table, t_mutex *mtx, t_op op)
{
	if (!table || !mtx)
		exit_error(table, "mtx_op error");
	if (op == CRT && pthread_mutex_init(mtx, NULL) != 0)
		exit_error(table, "mtx_init error");
	else if (op == DST && pthread_mutex_destroy(mtx) != 0)
		exit_error(table, "mtx_destroy error\n");
	else if (op == LK && pthread_mutex_lock(mtx) != 0)
		exit_error(table, "mtx_lock error\n");
	else if (op == ULK && pthread_mutex_unlock(mtx) != 0)
		exit_error(table, "mtx_unlock error\n");
}

void	mtx_setval(t_table *table, t_mutex *mtx, int *val, int n_val)
{
	mtx_op(table, mtx, LK);
	*val = n_val;
	mtx_op(table, mtx, ULK);
}
int	mtx_getval(t_table *table, t_mutex *mtx, int *val)
{
	int	res;

	mtx_op(table, mtx, LK);
	res = *val;
	mtx_op(table, mtx, ULK);
	return (res);
}
