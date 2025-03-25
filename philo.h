/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   philo.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: borov <borov@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/27 19:13:27 by borov             #+#    #+#             */
/*   Updated: 2025/01/03 23:58:40 by borov            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PHILO_H
# define PHILO_H

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <sys/time.h>
# include <pthread.h>
# include <errno.h>
# include <limits.h>

#define P_NUM 0
#define TTD 1
#define TTE 2
#define TTS 3
#define MEALS 4
#define TTT 5

typedef pthread_t		t_thread;
typedef pthread_mutex_t	t_mutex;
typedef struct	table	t_table;
typedef struct timeval	t_timer;

typedef enum	op
{
	CRT,
	DST,
	LK,
	ULK
}	t_op;

typedef enum	action
{
	EAT,
	SLEEP,
	THINK,
	FORK,
	DIE
}	t_action;

typedef struct	philo
{
	int			id;
	int			meals;
	t_thread	thread;
	long		meal_stamp;
	t_table		*table;
}	t_philo;

typedef struct	table
{
	int			props[6];
	int			t_status;
	int			active;
	t_philo		*philos;
	t_mutex		*forks;
	t_mutex		table_mtx;
	t_mutex		philo_mtx;
	t_mutex		print_mtx;
	long		start_stamp;
}	t_table;

int		is_num(char c);
int		msleep(t_table *table, long ms);
int		is_whitespace(char c);
void	threads_wait(t_table *table);
void	destroy_table(t_table *table);
void	exit_error(t_table *table, char *msg);
void	mtx_op(t_table *table, t_mutex *mtx, t_op op);
void	destroy_table(t_table *table);
void	table_create(t_table *table, int argc, char **argv);
void	mtx_setval(t_table *table, t_mutex *mtx, int *val, int n_val);
int		mtx_getval(t_table *table, t_mutex *mtx, int *val);
void	*philo_routine(void *arg);
void	print_status(t_table *table, int idx, t_action action);
int		is_stopped(t_table *table);
long	gettime_ms();

#endif
