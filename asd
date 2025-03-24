
Makefile
CC = cc
FLAGS = -Wall -Wextra -Werror
SAN = -fsanitize=thread -g

TARGET = philo
SRCS = $(shell ls *.c | tr '\n' ' ')
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(FLAGS) $(SAN) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(FLAGS) $(SAN) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(TARGET)

re: fclean all
asd
helpers.c
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
	mtx_op(table, &table->print_mtx, LK);
	if (action == FORK)
		printf("%ld %d has taken a fork\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == EAT)
		printf("%ld %d is eating\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == SLEEP)
		printf("%ld %d is sleeping\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == THINK)
		printf("%ld %d is thinking\n", get_time_diff(&table->start_stamp, NULL), idx);
	else
		printf("%ld %d died\n", get_time_diff(&table->start_stamp, NULL), idx);
	mtx_op(table, &table->print_mtx, ULK);
}
helpers.o
ELF          >                    P           @     @   ��UH����E��}�/~�}�9�   ��    ]���UH����E��}� t�}�~�}��   ��    ]���UH��H��H�}�H�u�H�EH���    H�E�H��H�    H�Ǹ    �    H�}� tH�E�H���    �   �    ��UH��H��H�}��u�U�H�EH���    H�E�H���   H�E��   H��H���    �}�u;H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    ��   �}� u;H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �   �}�u8H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �t�}�u8H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �6H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    H�E�H���   H�E��   H��H���    �    �����UH���    ]�error: %s
 %ld %d has taken a fork
 %ld %d is eating
 %ld %d is sleeping
 %ld %d is thinking
 %ld %d died
               �                           W                                  int         �_       �_   �       �   �           �       f        r            3�       5#�        6#�    �       7�       (y      X        5       X       5        X       "	Q       #	Q       $�        .   (C	�  	    E  	    F�  	    G_    �   �  .   '     H�      y       �      !�      �>�      @]       AX       BX       Cm       Dr  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�   op 5   $�  CRT  DST LK ULK      *�      5   ,�  EAT  
    
    
    DIE      3�      (5L  id 7X        8X       9�      :�      ;L    �      <�  X   m  .    Q  �      W_   �  �  �   �      R�  L  r  �       ��  X        S�  L       	kX   �  �                �      �3      L  �hidx 'X   �d    5�  �`             X       �l      L  �hmsg '~   �`     X           -       ��  c �   �l     X           '       �c �   �l   :;9I8   :;9I  $ >   I   !I  (   :;9   :!;9I  	 :!;9I  
(    :!;9I  I  ! I/  .?:!;9!'<  .?:!;9!'@|  %  $ >  & I  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  .?:;9'�<  .?:;9'I<     .?:;9'I@z  .?:;9'I@z   ,                     W                          ^   �                      
                                            	        � f fX .Y1� f f fX .Y1<��u��X��g �
�g �
�g �
�g �� ��$< t_table __data FORK tv_sec short int t_philo meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev table start_stamp __next t_op __kind long long int action t_timer long int props printf philo forks mtx_op hb_mtx exit barier unsigned char meals __size signed char long long unsigned int unsigned int SLEEP thread short unsigned int t_action char __nusers t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos exit_error THINK __owner t_thread table_mtx __suseconds_t print_status get_time_diff pthread_t __list is_num t_status /home/borov/projects/42_folder/circle_3/philosophers/philo helpers.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include helpers.c helpers.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h stdio.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0            GNU   �                 zR x�            '    E�C^      <       -    E�Cd      \       X    E�C      x       �   E�C�     �           E�CF                                   ��                                                                 H                                        
                                                                                                '       !     '       -       /     T       X       :                      L                      S                      �                      a     �       �      n                      u                      �                      �                       helpers.c _sub_I_00099_0 is_num is_whitespace exit_error __tsan_func_entry printf destroy_table print_status mtx_op get_time_diff __tsan_func_exit __tsan_init p             ��������~             ���������             ���������             ���������             ���������             ���������             ��������            ��������                   %            ��������G            ��������Y                    f            ���������            ���������            2       �            ���������            ���������            F       �            ���������            ��������            Z                   ��������<            ��������A            ��������Q            ��������              H             
                     
      �             
   	   ;              
   	                                *       
              1       
      p      8       
      k      ?       
      -      F       
      �      M       
      H      T       
             b       
      �       g       
      �      s       
      �      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      T      �       
      8       �       
      �       �       
      �       �       
      �            
      ^            
      W            
      t       +      
      �      8      
      �      E      
      �       R      
      |       _      
      �      l      
            z      
            �      
             �      
      A      �      
      �       �      
      d       �      
      �      �      
      �      �      
              �      
      �       �      
      �             
      *            
      &      %      
      �      2      
            ?      
      P       L      
      �      Y      
            f      
      Z       s      
      �       �      
      �       �      
      �       �      
      �       �      
      x      �      
      �      �      
             �      
      �      �      
                  
      ;      %      
      ~      2      
      -       ?      
      �       R      
      %       x      
            �      
            �      
      !      �      
      �       �      
             �      
      �      �            �       	      
      �       %      
      �       4      
      �      9            T       P      
      �       m      
      �       x            '       �      
      #      �                           
                                   "       
   	   E       &       
   	   �       *       
   	   �       .       
   	   �       8       
   	   �       =       
   	   �       B       
   	   �       G       
   	   �       L       
   	         Q       
   	         V       
   	   +      [       
   	   :      `       
   	   B      e       
   	   K      o                                           @             '       `             T       |             �       �             H       .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       W                                   @               0      X                          &                     �                                     ,                     �                                     1                     �      k                              >                                                        9      @               �                                 U                            �                             P      @               �      �                          a                      �      �                             t                      �	      0                              o      @               P      0                           �                      �	      !                             �      @               �      h                          �      0               �
      3                            �      0               '      S                            �      0               z      ,                             �                      �                                     �                     �                                     �                     �      �                              �      @               �      x                                                 �               
                 	                      �      �                                                    `      �                              logs.txt
./philo 4 410 200 200 died instantly 0 2 has taken a fork 0 2 has taken a fork 0 2 is eating 0 3 died
main.c
#include "philo.h"

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	for (int i = 0; i < table.props[P_NUM]; i++)
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
	pthread_create(&table.heartbeat, NULL, hb_routine, &table);
	table.t_status = 2;
	destroy_table(&table);
	return (0);
}
main.o
ELF          >                    �          @     @   ��UH��SH���   �����H�� ���dH�%(   H�E�1�H�EH���    H�� ��������H�� �����H���    ǅ���    �   H�� ���H�� H���    H��@��������Hc�H��H��H�H��H�H�� ���H�� H���    H��@��������Hc�H��H��H�H��H�H��H��H�    �    H���    �����H�� ���H���    �� ���9�����T���H�� ���H�� ���H�z0H��H�    H�¾    �    H�� ���H��H���    ǅ8���   H�� ���H���    �    �    ��H�U�dH+%(   t�    H�]�����UH���    ]�             W                           �                  <                   int         �f       �f   �               �       m        y            3�       5#�        6#�    �       7�       (v      _        5       _       5        _       "	X       #	X       $�        .       88�      :�      ;f    	�   �  
.   7     >�  �  (C	�      E       F�      Gf    	�     
.   '     H�  �       v             !7      �>�      @2       A_       B_       CB       DG  (    E  0    F  8    G  `    H  �    I�  �     "�       (5!  id 7_        8_       9      :�      ;!    +      <�  	_   B  
.    &        S\  !       X<   r  <        Y<   �  <        �_   �  �  �  �  >    v  �  �  �  �  <   �  <        T�  !  _          _           �      �    _   ��}      ��}    
+  ��~        �       i _   ��~    :;9I8   :;9I   I  $ >   !I  :;9   :!;9I  7 I  	I  
! I/  .?:;9'I<  .?:!;9!'<   :!;!9I  %     $ >  :;9  & I  :;9   :;9I8  'I  .?:;9'I@|  4 :;9I    4 :;9I   ,                     �                      �     Y   �                      	                                        	        ����FYM�@fJ��J+ e! t J�)�	��� t_table __data tv_sec short int meal_stamp __pthread_internal_list heartbeat main print_mtx pthread_mutex_t __count __spins __align destroy_table __prev table start_stamp __next __size __kind long long int pthread_create long int props t_status philo forks hb_mtx unsigned char hb_routine barier table_create meals argc signed char long long unsigned int unsigned int argv thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock philo_routine __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos __owner t_thread table_mtx __suseconds_t pthread_attr_t pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo main.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include main.c main.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0               GNU   �                 zR x�             �   E�CH�{      @           E�CF                                   ��                                           �                                        	                                                                                                �                            .                      ;                      H                      ^                      l                      {                      �                      �                      �                      �                      �                      �                       main.c _sub_I_00099_0 main __tsan_func_entry table_create __tsan_read8 _GLOBAL_OFFSET_TABLE_ philo_routine pthread_create __tsan_read4 hb_routine __tsan_write4 destroy_table __tsan_func_exit __stack_chk_fail __tsan_init    4          
   ��������R             ��������t             ���������             ���������       *      ���������             ���������             ��������)      *      ��������6            ��������I            ��������b            ��������l            ���������            ���������            ��������              �             
                     
      �             
      ;              
                                   *       
              1       
      t      8       
      c      F       
            M       
      |      T       
      @      [       
             i       
      �       n       
      �      z       
      �      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      L      �       
      +       �       
      �       �       
      �       �       
      �            
      b            
      M            
      l       (      
      �      5      
      �      B      
      �       O      
      t       \      
      �      i      
            w      
      �      �      
      �      �      
      �       �      
      |       �      
      �      �      
             �      
      �       �      
      |             
      \             
      �             
      �      ,      
              8      
      �       E      
      �       R      
      �       _      
      !      l      
      �      y      
      �       �      
      C       �      
      �      �      
            �      
      R       �      
      �       �      
      
      �      
      �       �      
      5      �      
      u            
                    
      �       '      
      �      M      
      �       ]      
            s      
      T      �      
      �       �      
      (      �      
      M       �                          
      ;            
      p      *      
      �       :            V              
                                   "       
      B       &       
      }       *       
      �       .       
      �       8       
      �       =       
      �       B       
      �       G       
      �       L       
      �       Q       
            V       
      "      [       
      1      `       
      9      j                                           D             �       .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                   @               �      P                          &                     �                                     ,                     �                                     6                     �                                   1      @                                                 M                      �      [                             H      @                                               Y                      C      f                             l                      �      0                              g      @                      0          
                 �                      �      �                              {      @               P      P                          �      0               �                                  �      0               �      C                            �      0               �      ,                             �                      #                                     �                     (                                     �                     H      `                              �      @               �      0                                                 �      (         	                 	                      �      �                                                    �      �                              mtx_op.c
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
mtx_op.o
ELF          >                    �          @     @   ��UH��H�� H�}�H�u��U�H�EH���    H�}� tH�}� uH�E�H�    H��H���    �}� u0H�E�    H���    ��tH�E�H�    H��H���    �   �}�u(H�E�H���    ��tH�E�H�    H��H���    �Z�}�u(H�E�H���    ��tH�E�H�    H��H���    �,�}�u&H�E�H���    ��tH�E�H�    H��H���    �    �����UH��H�� H�}�H�u�H�U�M�H�EH���    H�M�H�E��   H��H���    H�E�H���    H�E�U�H�M�H�E��   H��H���    �    �����UH��SH��8H�}�H�u�H�U�H�EH���    H�M�H�Eغ   H��H���    H�E�H���    H�Eȋ �E�H�M�H�Eغ   H��H���    �]��    ��H�]�����UH���    ]�mtx_op error mtx_init error mtx_destroy error
 mtx_lock error
 mtx_unlock error
              �                           
                                  int         �_       �_   �       �   �   .            �       f        r            3�       5#�        6#�    �       7�       (      X        5       X       5        X       "	Q       #	Q       $�        .    �      "�       #X        $�  �  (C�      E	      F�      G_    �   �  .   '     H�             �      !#      �>�      @S       AX       BX       Cc       Dh  (    E�  0    F  8    G  `    H  �    I�  �     "�   op 5   $�  	CRT  	DST 	LK 	ULK      *�      (5B  id 7X        8X       9�      :�      ;B          <�  X   c  .    G    
    CX   �  �   �  
    X   �  �   
    X   �  �   
    X   �  �  �   �      Q�  B  ~        X           z       �D      B  �Hmtx )h  �@val 3D  ��res X   �\ X               t       ��      B  �hmtx *h  �`val 4D  �X    =X   �T                   �    B  �hmtx &h  �`op 0�  �\   :;9I8   :;9I  $ >   !I   I   :!;9I  :;9   :!;9I  	(   
.?:!;9!'I<   :!;9I  I  ! I/  :!;9!	  %  $ >  & I  >I:;9   :;9I8  .?:;9'<  .?:;9'I@|  4 :;9I  .?:;9'@|  .?:;9'@|   ,                     
                          Y   �                      	                                        	        f� tuY f K
� f �K
u f �K
u f �K�?��uK�>��uK	u�f t_table __data tv_sec short int meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __prev __count __spins __align pthread_mutex_init table pthread_mutex_lock start_stamp __next t_op pthread_mutex_unlock __kind long long int long int props t_status philo forks pthread_mutexattr_t mtx_op hb_mtx barier unsigned char meals __size pthread_mutex_destroy signed char long long unsigned int unsigned int thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int philos __time_t __elision timeval __pthread_list_t tv_usec mtx_setval exit_error __owner mtx_getval n_val t_thread table_mtx __suseconds_t pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo mtx_op.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include mtx_op.c mtx_op.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0              GNU   �                 zR x�               E�C    <       t    E�Ck      \       z    E�CE�l       �           E�CF                                   ��                                                            
     �                                        
                                                                                                                             2                      =                      P                      f                      y                      �                      �           t       �                      �     �      z       �                      �                       mtx_op.c _sub_I_00099_0 mtx_op __tsan_func_entry exit_error pthread_mutex_init pthread_mutex_destroy pthread_mutex_lock pthread_mutex_unlock __tsan_func_exit mtx_setval __tsan_write4 mtx_getval __tsan_read4 __tsan_init                  ��������8             ��������C             ��������Z             ��������i             	       t             ���������             ���������                    �             ���������             ���������             +       �             ���������             ���������             ;                   ��������            ��������0            ��������H         
   ��������T            ��������u         
   ��������z            ���������            ���������         
   ���������            ���������         
   ���������            ��������            ��������              �             
                     
      �             
   	   ;              
   	                                *       
              1       
      �      8       
      �      ?       
      A      F       
      �      M       
      r      T       
             b       
      �       g       
      �      s       
      "      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      ~      �       
      +       �       
      g       �       
      �       �       
      �      
      
      �            
      z      $      
      n       1      
      �      >      
      �      K      
      �       X      
      v       e      
      �      r      
      :      �      
      0      �      
      U      �      
      ~       �      
            �      
             �      
      U      �      
      ~       �      
      W              
                  
      �            
              $      
      �       1      
      �       >      
            K      
      :      X      
      �      e      
            r      
      C             
            �      
      3      �      
      M       �      
      �       �      
      A      �      
      �       �      
                  
      O            
      �      (      
              5      
      �       H      
      �      n      
      �       �      
      �       �      
      \      �      
      �       �      
      �      �      
      �      �            �      
      
      �       J      
      �      Q                  h      
      �       �      
      	      �      
      ,      �                    �      
      �              
                                   "       
   	   D       &       
   	          *       
   	   �       .       
   	   �       8       
   	   �       =       
   	   �       B       
   	   �       G       
   	   �       L       
   	         Q       
   	         V       
   	   (      [       
   	   7      `       
   	   ?      j                                           @                   `             �      �             �       .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       
                                   @               �      �                          &                     J                                     ,                     J                                     1                     J      Q                              >                     �                                   9      @               `                                 U                      �      �                             P      @               x      h                          a                      �      �                             t                      	      0                              o      @               �      0                           �                      F	                                   �      @                     P                          �      0               N
      I                            �      0               �      I                            �      0               �      ,                             �                                                           �                                                          �                     0      �                              �      @               `      `                                                 �      (         
                 	                      �      �                                                    �      �                              out.txt

output.txt
=== Makefile ===
CC = cc
FLAGS = -Wall -Wextra -Werror
SAN = -fsanitize=thread -g

TARGET = philo
SRCS = $(shell ls *.c | tr '\n' ' ')
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(FLAGS) $(SAN) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(FLAGS) $(SAN) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(TARGET)

re: fclean all


=== asd ===
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
	mtx_op(table, &table->print_mtx, LK);
	if (action == FORK)
		printf("%ld %d has taken a fork\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == EAT)
		printf("%ld %d is eating\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == SLEEP)
		printf("%ld %d is sleeping\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == THINK)
		printf("%ld %d is thinking\n", get_time_diff(&table->start_stamp, NULL), idx);
	else
		printf("%ld %d died\n", get_time_diff(&table->start_stamp, NULL), idx);
	mtx_op(table, &table->print_mtx, ULK);
}

// long	get_ms(t_timer *time)
// {
// 	return (time->tv_sec * 1000 + time->tv_usec / 1000);
// }

// void	ft_usleep(int ms)
// {
// 	long	beg;
// 	t_timer	tmp;

// 	gettimeofday(&tmp, NULL);
// 	beg = get_ms(&tmp);

// }
#include "philo.h"

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	for (int i = 0; i < table.props[P_NUM]; i++)
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
	pthread_create(&table.heartbeat, NULL, hb_routine, &table);
	table.t_status = 2;
	destroy_table(&table);
}
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
#include "philo.h"

static void	philo_wait_start(t_table *table, t_philo *philo)
{
	mtx_op(table, &table->table_mtx, LK);
	table->barier += 1;
	if (table->barier >= table->props[P_NUM])
		gettimeofday(&table->start_stamp, NULL);
	mtx_op(table, &table->table_mtx, ULK);
	while (1)
	{
		mtx_op(table, &table->table_mtx, LK);
		if (table->barier >= table->props[P_NUM])
		{
			philo->meal_stamp = table->start_stamp;
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
	int	time;
	int	s_time;
	int	delta;

	if (a_type == EAT)
		time = table->props[TTE];
	else if (a_type == SLEEP)
		time = table->props[TTS];
	else if (a_type == THINK)
		time = table->props[TTT];
	else
		time = 0;
	s_time = 0;
	delta = 10;
	while (s_time < time)
	{
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
			return (1);
		usleep(delta * 1000);
		s_time += delta;
	}
	return (0);
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
	while (1)
	{
		if (ph_eat(table, philo) != 0)
			return (NULL);
		print_status(table, philo->id, SLEEP);
		if (ph_action(table, SLEEP) != 0)
			return (NULL);
		print_status(table, philo->id, THINK);
	}
	return (NULL);
}
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


=== helpers.c ===
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
	mtx_op(table, &table->print_mtx, LK);
	if (action == FORK)
		printf("%ld %d has taken a fork\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == EAT)
		printf("%ld %d is eating\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == SLEEP)
		printf("%ld %d is sleeping\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == THINK)
		printf("%ld %d is thinking\n", get_time_diff(&table->start_stamp, NULL), idx);
	else
		printf("%ld %d died\n", get_time_diff(&table->start_stamp, NULL), idx);
	mtx_op(table, &table->print_mtx, ULK);
}

// long	get_ms(t_timer *time)
// {
// 	return (time->tv_sec * 1000 + time->tv_usec / 1000);
// }

// void	ft_usleep(int ms)
// {
// 	long	beg;
// 	t_timer	tmp;

// 	gettimeofday(&tmp, NULL);
// 	beg = get_ms(&tmp);

// }


=== helpers.o ===
ELF          >                    P           @     @   ��UH����E��}�/~�}�9�   ��    ]���UH����E��}� t�}�~�}��   ��    ]���UH��H��H�}�H�u�H�EH���    H�E�H��H�    H�Ǹ    �    H�}� tH�E�H���    �   �    ��UH��H��H�}��u�U�H�EH���    H�E�H���   H�E��   H��H���    �}�u;H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    ��   �}� u;H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �   �}�u8H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �t�}�u8H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    �6H�E�H�   �    H���    H���E��H��H�    H�Ǹ    �    H�E�H���   H�E��   H��H���    �    �����UH���    ]�error: %s
 %ld %d has taken a fork
 %ld %d is eating
 %ld %d is sleeping
 %ld %d is thinking
 %ld %d died
               �                           W                                  int         �_       �_   �       �   �           �       f        r            3�       5#�        6#�    �       7�       (y      X        5       X       5        X       "	Q       #	Q       $�        .   (C	�  	    E  	    F�  	    G_    �   �  .   '     H�      y       �      !�      �>�      @]       AX       BX       Cm       Dr  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�   op 5   $�  CRT  DST LK ULK      *�      5   ,�  EAT  
    
    
    DIE      3�      (5L  id 7X        8X       9�      :�      ;L    �      <�  X   m  .    Q  �      V_   �  �  �   �      Q�  L  r  �       ��  X        R�  L       	kX   �  �                �      �3      L  �hidx 'X   �d    5�  �`             X       �l      L  �hmsg '~   �`     X           -       ��  c �   �l     X           '       �c �   �l   :;9I8   :;9I  $ >   I   !I  (   :;9   :!;9I  	 :!;9I  
(    :!;9I  I  ! I/  .?:!;9!'<  .?:!;9!'@|  %  $ >  & I  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  .?:;9'�<  .?:;9'I<     .?:;9'I@z  .?:;9'I@z   ,                     W                          ^   �                      
                                            	        � f fX .Y1� f f fX .Y1<��u��X��g �
�g �
�g �
�g �� ��$< t_table __data FORK tv_sec short int t_philo meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev table start_stamp __next t_op __kind long long int action t_timer long int props printf philo forks mtx_op hb_mtx exit barier unsigned char meals __size signed char long long unsigned int unsigned int SLEEP thread short unsigned int t_action char __nusers t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos exit_error THINK __owner t_thread table_mtx __suseconds_t print_status get_time_diff pthread_t __list is_num t_status /home/borov/projects/42_folder/circle_3/philosophers/philo helpers.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include helpers.c helpers.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h stdio.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0            GNU   �                 zR x�            '    E�C^      <       -    E�Cd      \       X    E�C      x       �   E�C�     �           E�CF                                   ��                                                                 H                                        
                                                                                                '       !     '       -       /     T       X       :                      L                      S                      �                      a     �       �      n                      u                      �                      �                       helpers.c _sub_I_00099_0 is_num is_whitespace exit_error __tsan_func_entry printf destroy_table print_status mtx_op get_time_diff __tsan_func_exit __tsan_init p             ��������~             ���������             ���������             ���������             ���������             ���������             ��������            ��������                   %            ��������G            ��������Y                    f            ���������            ���������            2       �            ���������            ���������            F       �            ���������            ��������            Z                   ��������<            ��������A            ��������Q            ��������              H             
                     
      �             
   	   ;              
   	                                *       
              1       
      p      8       
      k      ?       
      -      F       
      �      M       
      H      T       
             b       
      �       g       
      �      s       
      �      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      T      �       
      8       �       
      �       �       
      �       �       
      �            
      ^            
      W            
      t       +      
      �      8      
      �      E      
      �       R      
      |       _      
      �      l      
            z      
            �      
             �      
      A      �      
      �       �      
      d       �      
      �      �      
      �      �      
              �      
      �       �      
      �             
      *            
      &      %      
      �      2      
            ?      
      P       L      
      �      Y      
            f      
      Z       s      
      �       �      
      �       �      
      �       �      
      �       �      
      x      �      
      �      �      
             �      
      �      �      
                  
      ;      %      
      ~      2      
      -       ?      
      �       R      
      %       x      
            �      
            �      
      !      �      
      �       �      
             �      
      �      �            �       	      
      �       %      
      �       4      
      �      9            T       P      
      �       m      
      �       x            '       �      
      #      �                           
                                   "       
   	   E       &       
   	   �       *       
   	   �       .       
   	   �       8       
   	   �       =       
   	   �       B       
   	   �       G       
   	   �       L       
   	         Q       
   	         V       
   	   +      [       
   	   :      `       
   	   B      e       
   	   K      o                                           @             '       `             T       |             �       �             H       .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       W                                   @               0      X                          &                     �                                     ,                     �                                     1                     �      k                              >                                                        9      @               �                                 U                            �                             P      @               �      �                          a                      �      �                             t                      �	      0                              o      @               P      0                           �                      �	      !                             �      @               �      h                          �      0               �
      3                            �      0               '      S                            �      0               z      ,                             �                      �                                     �                     �                                     �                     �      �                              �      @               �      x                                                 �               
                 	                      �      �                                                    `      �                              

=== main.c ===
#include "philo.h"

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	for (int i = 0; i < table.props[P_NUM]; i++)
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
	pthread_create(&table.heartbeat, NULL, hb_routine, &table);
	table.t_status = 2;
	destroy_table(&table);
}


=== main.o ===
ELF          >                    �          @     @   ��UH��SH���   �����H�� ���dH�%(   H�E�1�H�EH���    H�� ��������H�� �����H���    ǅ���    �   H�� ���H�� H���    H��@��������Hc�H��H��H�H��H�H�� ���H�� H���    H��@��������Hc�H��H��H�H��H�H��H��H�    �    H���    �����H�� ���H���    �� ���9�����T���H�� ���H�� ���H�z0H��H�    H�¾    �    H�� ���H��H���    ǅ8���   H�� ���H���    �    �    ��H�U�dH+%(   t�    H�]�����UH���    ]�             W                           �                  <                   int         �f       �f   �               �       m        y            3�       5#�        6#�    �       7�       (v      _        5       _       5        _       "	X       #	X       $�        .       88�      :�      ;f    	�   �  
.   7     >�  �  (C	�      E       F�      Gf    	�     
.   '     H�  �       v             !7      �>�      @2       A_       B_       CB       DG  (    E  0    F  8    G  `    H  �    I�  �     "�       (5!  id 7_        8_       9      :�      ;!    +      <�  	_   B  
.    &        R\  !       W<   r  <        X<   �  <        �_   �  �  �  �  >    v  �  �  �  �  <   �  <        S�  !  _          _           �      �    _   ��}      ��}    
+  ��~        �       i _   ��~    :;9I8   :;9I   I  $ >   !I  :;9   :!;9I  7 I  	I  
! I/  .?:;9'I<  .?:!;9!'<   :!;!9I  %     $ >  :;9  & I  :;9   :;9I8  'I  .?:;9'I@|  4 :;9I    4 :;9I   ,                     �                      �     Y   �                      	                                        	        ����FYM�@fJ��J+ e! t J�)��� t_table __data tv_sec short int meal_stamp __pthread_internal_list heartbeat main print_mtx pthread_mutex_t __count __spins __align destroy_table __prev table start_stamp __next __size __kind long long int pthread_create long int props t_status philo forks hb_mtx unsigned char hb_routine barier table_create meals argc signed char long long unsigned int unsigned int argv thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock philo_routine __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos __owner t_thread table_mtx __suseconds_t pthread_attr_t pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo main.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include main.c main.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0                 GNU   �                 zR x�             �   E�CH�{      @           E�CF                                   ��                                           �                                        	                                                                                                �                            .                      ;                      H                      ^                      l                      {                      �                      �                      �                      �                      �                      �                       main.c _sub_I_00099_0 main __tsan_func_entry table_create __tsan_read8 _GLOBAL_OFFSET_TABLE_ philo_routine pthread_create __tsan_read4 hb_routine __tsan_write4 destroy_table __tsan_func_exit __stack_chk_fail __tsan_init    4          
   ��������R             ��������t             ���������             ���������       *      ���������             ���������             ��������)      *      ��������6            ��������I            ��������b            ��������l            ���������            ���������            ��������              �             
                     
      �             
      ;              
                                   *       
              1       
      t      8       
      c      F       
            M       
      |      T       
      @      [       
             i       
      �       n       
      �      z       
      �      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      L      �       
      +       �       
      �       �       
      �       �       
      �            
      b            
      M            
      l       (      
      �      5      
      �      B      
      �       O      
      t       \      
      �      i      
            w      
      �      �      
      �      �      
      �       �      
      |       �      
      �      �      
             �      
      �       �      
      |             
      \             
      �             
      �      ,      
              8      
      �       E      
      �       R      
      �       _      
      !      l      
      �      y      
      �       �      
      C       �      
      �      �      
            �      
      R       �      
      �       �      
      
      �      
      �       �      
      5      �      
      u            
                    
      �       '      
      �      M      
      �       ]      
            s      
      T      �      
      �       �      
      (      �      
      M       �                          
      ;            
      p      *      
      �       :            V              
                                   "       
      B       &       
      }       *       
      �       .       
      �       8       
      �       =       
      �       B       
      �       G       
      �       L       
      �       Q       
            V       
      "      [       
      1      `       
      9      j                                           D             �       .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                   @               �      P                          &                     �                                     ,                     �                                     6                     �                                   1      @                                                 M                      �      [                             H      @                                               Y                      C      f                             l                      �      0                              g      @                      0          
                 �                      �      �                              {      @               P      P                          �      0               �                                  �      0               �      C                            �      0               �      ,                             �                      !                                     �                     (                                     �                     H      `                              �      @               �      0                                                 �      (         	                 	                      �      �                                                    �      �                              

=== mtx_op.c ===
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


=== mtx_op.o ===
ELF          >                    �          @     @   ��UH��H�� H�}�H�u��U�H�EH���    H�}� tH�}� uH�E�H�    H��H���    �}� u0H�E�    H���    ��tH�E�H�    H��H���    �   �}�u(H�E�H���    ��tH�E�H�    H��H���    �Z�}�u(H�E�H���    ��tH�E�H�    H��H���    �,�}�u&H�E�H���    ��tH�E�H�    H��H���    �    �����UH��H�� H�}�H�u�H�U�M�H�EH���    H�M�H�E��   H��H���    H�E�H���    H�E�U�H�M�H�E��   H��H���    �    �����UH��SH��8H�}�H�u�H�U�H�EH���    H�M�H�Eغ   H��H���    H�E�H���    H�Eȋ �E�H�M�H�Eغ   H��H���    �]��    ��H�]�����UH���    ]�mtx_op error mtx_init error mtx_destroy error
 mtx_lock error
 mtx_unlock error
              �                           
                                  int         �_       �_   �       �   �   .            �       f        r            3�       5#�        6#�    �       7�       (      X        5       X       5        X       "	Q       #	Q       $�        .    �      "�       #X        $�  �  (C�      E	      F�      G_    �   �  .   '     H�             �      !#      �>�      @S       AX       BX       Cc       Dh  (    E�  0    F  8    G  `    H  �    I�  �     "�   op 5   $�  	CRT  	DST 	LK 	ULK      *�      (5B  id 7X        8X       9�      :�      ;B          <�  X   c  .    G    
    CX   �  �   �  
    X   �  �   
    X   �  �   
    X   �  �  �   �      P�  B  ~        X           z       �D      B  �Hmtx )h  �@val 3D  ��res X   �\ X               t       ��      B  �hmtx *h  �`val 4D  �X    =X   �T                   �    B  �hmtx &h  �`op 0�  �\   :;9I8   :;9I  $ >   !I   I   :!;9I  :;9   :!;9I  	(   
.?:!;9!'I<   :!;9I  I  ! I/  :!;9!	  %  $ >  & I  >I:;9   :;9I8  .?:;9'<  .?:;9'I@|  4 :;9I  .?:;9'@|  .?:;9'@|   ,                     
                          Y   �                      	                                        	        f� tuY f K
� f �K
u f �K
u f �K�?��uK�>��uK	u�f t_table __data tv_sec short int meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __prev __count __spins __align pthread_mutex_init table pthread_mutex_lock start_stamp __next t_op pthread_mutex_unlock __kind long long int long int props t_status philo forks pthread_mutexattr_t mtx_op hb_mtx barier unsigned char meals __size pthread_mutex_destroy signed char long long unsigned int unsigned int thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int philos __time_t __elision timeval __pthread_list_t tv_usec mtx_setval exit_error __owner mtx_getval n_val t_thread table_mtx __suseconds_t pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo mtx_op.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include mtx_op.c mtx_op.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0              GNU   �                 zR x�               E�C    <       t    E�Ck      \       z    E�CE�l       �           E�CF                                   ��                                                            
     �                                        
                                                                                                                             2                      =                      P                      f                      y                      �                      �           t       �                      �     �      z       �                      �                       mtx_op.c _sub_I_00099_0 mtx_op __tsan_func_entry exit_error pthread_mutex_init pthread_mutex_destroy pthread_mutex_lock pthread_mutex_unlock __tsan_func_exit mtx_setval __tsan_write4 mtx_getval __tsan_read4 __tsan_init                  ��������8             ��������C             ��������Z             ��������i             	       t             ���������             ���������                    �             ���������             ���������             +       �             ���������             ���������             ;                   ��������            ��������0            ��������H         
   ��������T            ��������u         
   ��������z            ���������            ���������         
   ���������            ���������         
   ���������            ��������            ��������              �             
                     
      �             
   	   ;              
   	                                *       
              1       
      �      8       
      �      ?       
      A      F       
      �      M       
      r      T       
             b       
      �       g       
      �      s       
      "      �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      ~      �       
      +       �       
      g       �       
      �       �       
      �      
      
      �            
      z      $      
      n       1      
      �      >      
      �      K      
      �       X      
      v       e      
      �      r      
      :      �      
      0      �      
      U      �      
      ~       �      
            �      
             �      
      U      �      
      ~       �      
      W              
                  
      �            
              $      
      �       1      
      �       >      
            K      
      :      X      
      �      e      
            r      
      C             
            �      
      3      �      
      M       �      
      �       �      
      A      �      
      �       �      
                  
      O            
      �      (      
              5      
      �       H      
      �      n      
      �       �      
      �       �      
      \      �      
      �       �      
      �      �      
      �      �            �      
      
      �       J      
      �      Q                  h      
      �       �      
      	      �      
      ,      �                    �      
      �              
                                   "       
   	   D       &       
   	          *       
   	   �       .       
   	   �       8       
   	   �       =       
   	   �       B       
   	   �       G       
   	   �       L       
   	         Q       
   	         V       
   	   (      [       
   	   7      `       
   	   ?      j                                           @                   `             �      �             �       .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       
                                   @               �      �                          &                     J                                     ,                     J                                     1                     J      Q                              >                     �                                   9      @               `                                 U                      �      �                             P      @               x      h                          a                      �      �                             t                      	      0                              o      @               �      0                           �                      F	                                   �      @                     P                          �      0               N
      I                            �      0               �      I                            �      0               �      ,                             �                                                           �                                                          �                     0      �                              �      @               `      `                                                 �      (         
                 	                      �      �                                                    �      �                              

=== output.txt ===


=== p_routine.c ===
#include "philo.h"

static void	philo_wait_start(t_table *table, t_philo *philo)
{
	mtx_op(table, &table->table_mtx, LK);
	table->barier += 1;
	if (table->barier >= table->props[P_NUM])
		gettimeofday(&table->start_stamp, NULL);
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
	int	time;
	int	s_time;
	int	delta;

	if (a_type == EAT)
		time = table->props[TTE];
	else if (a_type == SLEEP)
		time = table->props[TTS];
	else if (a_type == THINK)
		time = table->props[TTT];
	else
		time = 0;
	s_time = 0;
	delta = 10;
	while (s_time < time)
	{
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
			return (1);
		usleep(delta * 1000);
		s_time += delta;
	}
	return (0);
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
	while (1)
	{
		if (ph_eat(table, philo) != 0)
			return (NULL);
		print_status(table, philo->id, SLEEP);
		if (ph_action(table, SLEEP) != 0)
			return (NULL);
		print_status(table, philo->id, THINK);
	}
	return (NULL);
}


=== p_routine.o ===
ELF          >                    �;          @     @   ��UH��SH��H�}�H�u�H�EH���    H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�@�XH�E�H��H���    H�E�XH�E�H��H���    H�E�XH�E�H���    H�E� 9�|H�E�H�   �    H���    H�E�H�H8H�E�   H��H���    H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�XH�E�H���    H�E� 9���   H�E�H�H`H�E�   H��H���    H�E�H��H���    H�E�H�   H���    H�M�H�E�H���   H���   H�AH�QH�E�H�H`H�E�   H��H���    H�E�H�H8H�E�   H��H���    �!H�E�H�H8H�E�   H��H���    ������    �H�]�����UH��SH��8H�}�H�EH���    H�E�H�E�H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�XH�E�H���    H�E� 9�|H�E�H�H8H�E�   H��H���    �!H�E�H�H8H�E�   H��H���    �x����E�    �E�    �s  H�E�H�H`H�E�   H��H���    H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H���    H���    H��H�E�H��H���    H�E�@H�H9������E�H�E�H��H���    H�E�@���taH�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    �[H�E�H��H���    H�E�@9�|�   ��    E�H�E�H�H`H�E�   H��H���    �}� tDH�E�H�PH�E�H�p8H�E�    H���    �E܍HH�E�   ��H���    �    �   �E�H�E�H���    H�E� 9E��r���H�E�H���    H�E� 9E�|(H�E�H�PH�E�H�p8H�E�    H���    �    �.H�E�H�PH�E�H�H8H�E�H��H���    ��t�������    �    H��H�]�����UH��SH��(H�}؉u�H�EH���    �}� uH�E�H��H���    H�E؋@�E��K�}�uH�E�H��H���    H�E؋@�E��)�}�uH�E�H��H���    H�E؋@�E���E�    �E�    �E�
   �@H�E�H�PH�E�H�H8H�E�H��H���    ��u�   �#�E�i��  ���    �E�E�E�;E�|��    �    ��H�]�����UH��ATSH�� H�}�H�u�H�EH���    H�E�H���    H�EЋ ������  H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ��uxH�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ����   H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    �   �2  H�E�H���    H�EЋH�Eغ   ��H���    �  H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ��uaH�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    �   �-  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ����   H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H�H`H�Eغ   H��H���    H�E�H���    H���    H�E�H��H���    H�EЋ@�XH�E�H��H���    H�EЉXH�E�H�H`H�Eغ   H��H���    H�E�H���    H�EЋH�Eغ    ��H���    H�Eؾ    H��������E�H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �]��    ��H�� [A\]���UH��SH��(H�}�H�EH���    H�E�H�E�H�E�H�� H���    H�E�H�@ H�E�H�U�H�E�H��H������H�U�H�E�H��H��������t�    �kH�E�H���    H�E��H�E�   ��H���    H�E�   H���d�����t�    �*H�E�H���    H�E��H�E�   ��H���    �w����    H��H�]�����UH���    ]�           �                           �                  <                   int         �f       �5       �f           	    �       m        �        	    3�       5#�        6#�    �       7�   	    (}      _        5       _       5        _       "	X       #	X       $�        .   (C	�  
    E  
    F�  
    Gf    �   �  .   '     H�      }       �      !�  	    �>�      @a       A_       B_       Cq       Dv  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�   op 5   $�  CRT  DST LK ULK      *�      5   ,�  EAT              DIE      3�  	    (5P  id 7_        8_       9�      :�      ;P    �      <  _   q  .    U  �      �_   �  y        U_   �  P  v  �   _       Y�  P  _   �       T�  P  v  �  _        Vf          �      	C_   +  0  >    �   +      QO  P  v  �       �<           �       ��  arg �<   �H    �q  �P    �P  �X     b_           �      ��      bP  �H    b,q  �@    d_   �\     H_           �       �L      HP  �H    H/�  �D    J_   �T    K_   �X    L_   �\     <           �      ��  arg <   ��    P  �X    _   �L        +_   �Tfed ,_   �P              �      �    'P  �X    7q  �P   :;9I8   I   :;9I  $ >  4 :!;9I   !I  (    :!;9I  	:;9  
 :!;9I  (   .?:;9'I<  .?:!;9!'<  7 I  I  ! I/  .?:!;9!'I@|   :!;9I  .:!;9!'I@|  %     $ >  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  U  4 :;9I  .:;9'@|   ,                     �                               ��	�	�	 n    b   �                          
                                            	        J�$�"#.�K���$$.��$8��0w��w��$$.�L�0z�Xu	uZ $(�fS �D 	 f�&�. �6 �? �U .& � JX . X=�h��� t����Z�v �hJX	"��<��
=�
=�>	uuu0 �Ku�
ua	���f��<�$<7 )���u ��%<8 *���u�)$< u ��%<8 *����%< u�.$< u ��%< u�)$<7 )���u ��%< �%<8 *���u����K�����#< �#<6 (���	u����=1 .K�� K���� t_table __data usleep FORK tv_sec short int t_philo meal_stamp __pthread_internal_list delta heartbeat print_mtx pthread_mutex_t __suseconds_t __count __spins dead __align __prev s_time table start_stamp __next __size ph_eat t_op a_type long long int action long int props t_status philo forks mtx_op hb_mtx philo_wait_start ph_action hb_routine barier unsigned char act_res meals gettimeofday signed char long long unsigned int unsigned int time SLEEP thread short unsigned int t_action char __nusers __useconds_t t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock philo_routine __pthread_mutex_s long unsigned int philos __time_t __elision timeval __pthread_list_t tv_usec mtx_setval THINK __owner mtx_getval t_thread table_mtx c_philo __kind print_status get_time_diff pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo p_routine.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include /usr/include/x86_64-linux-gnu/sys p_routine.c p_routine.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h unistd.h time.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0                 GNU   �                 zR x�             �   E�CE��      @       �   E�CE��      d       �    E�CE��       �       �   E�CG���    �       �    E�CE��       �           E�CF                                   ��                                                   �           �      �       (     �      �      /     �                                        	                                                                                                         >                      P                      W                      d                      r                                            �                      �                      �     �      �      �                      �                      �                      �                      �                      �                      �     �      �                             p_routine.c philo_wait_start ph_action ph_eat _sub_I_00099_0 __tsan_func_entry mtx_op __tsan_read4 __tsan_write4 gettimeofday __tsan_write16 __tsan_read16 __tsan_func_exit hb_routine __tsan_read8 get_time_diff mtx_setval print_status mtx_getval usleep philo_routine __tsan_init               ��������9             ��������I             ��������c             ��������z             ���������             ���������             ���������             ���������             ���������             ��������	            ��������3            ��������C            ��������U            ���������            ���������            ���������            ���������            ���������            ��������            ��������+            ��������>            ��������d            ���������            ���������            ���������            ���������            ��������	            ��������.            ��������J            ��������v            ���������            ���������            ���������            ���������            ��������            ��������4            ��������`            ���������            ���������            ���������            ���������            ���������            ��������            ��������_            ��������z            ���������            ���������            ���������            ���������            ���������            ��������            ��������H            ��������g            ��������{            ���������            ���������            ���������            ���������            ��������            ��������            ��������,            ��������_            ��������~            ���������            ���������            ���������            ���������            ��������            ��������            ��������K            ��������a            ��������z            ���������            ���������            ���������            ���������            ��������		            ��������	            ��������P	            ��������f	            ��������	            ���������	            ���������	            ���������	            ���������	            ��������
            ��������$
            ��������8
            ��������k
            ��������{
            ���������
            ���������
            ���������
            ���������
            ��������            ��������$            ��������9            ��������I            ��������c            ���������            ���������            ���������            ���������            ���������            ��������            ��������&            ��������:            ��������L            ���������            ���������            ���������            ���������            ��������            ��������.            ��������V            ��������o            ��������y            ���������            ��������              �             
                     
                   
      ;              
                                   *       
   
           1       
      �      8       
      �      F       
      a      M       
      �      T       
      �      [       
      "       i       
            n       
      �      z       
      �      �       
      �       �       
      �      �       
      �       �       
      �      �       
             �       
            �       
      �      �       
      ?       �       
      �       �       
      �       �       
                  
      �            
      �      "      
      �       /      
      0      <      
      �      I      
      ^      V      
      �       c      
      �      p      
      �      ~      
      �      �      
             �      
      �       �      
      �       �      
      q       �      
      C      �      
            �      
              �      
      �             
                  
                  
      Z      )      
      �      6      
             C      
      ]       P      
      L      ]      
      -      j      
      g       w      
      �       �      
      �      �      
      �       �      
      �       �      
      �      �      
      *      �      
             �      
      �            
                  
      w      )      
      �      6      
      4       C      
      �       V      
      ,       |      
             �      
      8      �      
      e      �      
            �      
      r            
      }      6      
      &      P      
      �      Y            �      ~      
            �      
      �       �      
      �       �            �      �      
      �       �      
            �      
      o      �      
      E      �            �            
      �             
      �       "      
      �      0      
      �       >      
      W       M      
      O      V            �      |      
      �       �      
      V      �      
   	          �      
      �       �      
      4      �                    �      
      �       �      
                   
                                   "       
      G       &       
      �       *       
      �       .       
      �       2       
      �       <       
      �       A       
      	      F       
            K       
            P       
      .      U       
      D      Z       
      S      _       
      b      d       
      j      i       
      s      s                                           D             �      h             �      �             �      �             �      �             �       .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .debug_rnglists .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                   @               �#      (                          &                     �                                     ,                     �                                     6                     �                                   1      @               �.                                 M                      �      �                             H      @               �.      `	                          Y                      �      �                             l                      �      0                              g      @               H8      0          
                 {                      �                                    �                      �      r                             �      @               x8      �                          �      0               j      �                            �      0                     z                            �      0               }      ,                             �                      �                                     �                     �                                     �                     �      �                              �      @               �9      �                                                 �      �                          	                      �"                                                         �:      �                              

=== philo ===
ELF          >           @       �          @ 8  @ ' &       @       @       @       �      �                                                                                        �      �                                        =       =                     @       @       @      �      �                   �L      �\      �\      x      �                   �L      �\      �\                                 8      8      8      0       0                    h      h      h      D       D              S�td   8      8      8      0       0              P�td   �@      �@      �@      �       �              Q�td                                                  R�td   �L      �\      �\      h      h             /lib64/ld-linux-x86-64.so.2               GNU   �          � �                   GNU V�`����`�!8�D�z���0�         GNU                                 �            �e�m                            |                      .                                            �                      w                      5                                          F                                           R                      P                     �                                             ,                       �                      B                     �                      k                      �                      i                                           �                      W                     �                      d                      z                     \                     �  "                    __gmon_start__ _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable __tsan_init __tsan_func_entry printf __tsan_func_exit __tsan_read8 pthread_create __tsan_read4 __tsan_write4 pthread_mutex_init pthread_mutex_destroy pthread_mutex_lock pthread_mutex_unlock gettimeofday __tsan_write16 __tsan_read16 usleep __tsan_read1 __tsan_write8 malloc free pthread_join __stack_chk_fail __libc_start_main __cxa_finalize libtsan.so.2 libc.so.6 GLIBC_2.34 GLIBC_2.4 GLIBC_2.2.5                                    �         ���   �     ii   �     ui	   �      �\             Q      �\             �      �\             �      �\             �'      �\             .      �\             /      �\              0      �\                    �\             �      `             `      �\                    �_                    �_                    �_                    �_                    �_                     _                    (_                    0_                    8_                    @_                    H_                    P_                    X_         	           `_         
           h_                    p_                    x_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ��H��H��O  H��t��H���     �5�N  �%�N  @ ��h    �����f���h   �����f���h   �����f���h   ����f���h   ����f���h   ����f���h   ����f���h   �r���f���h   �b���f���h	   �R���f���h
   �B���f���h   �2���f���h   �"���f���h   ����f���h   ����f���h   �����f���h   �����f���h   �����f���h   �����f���h   ����f���h   ����f���h   ����f���h   ����f����%FN  fD  ���%fM  fD  ���%^M  fD  ���%VM  fD  ���%NM  fD  ���%FM  fD  ���%>M  fD  ���%6M  fD  ���%.M  fD  ���%&M  fD  ���%M  fD  ���%M  fD  ���%M  fD  ���%M  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ��1�I��^H��H���PTE1�1�H�=!  ��L  �f.�     H�=�L  H��L  H9�tH�vL  H��t	���    ��    H�=�L  H�5�L  H)�H��H��?H��H�H��tH�=L  H��t��fD  ��    ���=EL   u+UH�=L   H��tH�=&L  �����d����L  ]� ��    ���w�����UH����E��}�/~�}�9�   ��    ]���UH����E��}� t�}�~�}��   ��    ]���UH��H��H�}�H�u�H�EH������H�E�H��H�y+  H�Ǹ    �h���H�}� tH�E�H���=  �   �+�����UH��H��H�}��u�U�H�EH���Y���H�E�H���   H�E��   H��H���  �}�u;H�E�H�   �    H���   H���E��H��H��*  H�Ǹ    �������   �}� u;H�E�H�   �    H���  H���E��H��H��*  H�Ǹ    �����   �}�u8H�E�H�   �    H���~  H���E��H��H��*  H�Ǹ    �L����t�}�u8H�E�H�   �    H���@  H���E��H��H�i*  H�Ǹ    �����6H�E�H�   �    H���  H���E��H��H�E*  H�Ǹ    �����H�E�H���   H�E��   H��H���  �B��������UH������]���UH��SH���   �����H�� ���dH�%(   H�E�1�H�EH������H�� ��������H�� �����H���	  ǅ���    �   H�� ���H�� H�������H��@��������Hc�H��H��H�H��H�H�� ���H�� H������H��@��������Hc�H��H��H�H��H�H��H��H�d  �    H���W��������H�� ���H�������� ���9�����T���H�� ���H�� ���H�z0H��H�V  H�¾    ����H�� ���H��H�������ǅ8���   H�� ���H���"  �    �������H�U�dH+%(   t�����H�]�����UH������]���UH��H�� H�}�H�u��U�H�EH������H�}� tH�}� uH�E�H�8(  H��H�������}� u0H�E�    H���w�����tH�E�H�(  H��H��������   �}�u(H�E�H���������tH�E�H��'  H��H�������Z�}�u(H�E�H��������tH�E�H��'  H��H�������,�}�u&H�E�H���������tH�E�H��'  H��H���]������������UH��H�� H�}�H�u�H�U�M�H�EH������H�M�H�E��   H��H������H�E�H���-���H�E�U�H�M�H�E��   H��H���������������UH��SH��8H�}�H�u�H�U�H�EH������H�M�H�Eغ   H��H���B���H�E�H���+���H�Eȋ �E�H�M�H�Eغ   H��H�������]�������H�]�����UH������]���UH��SH��H�}�H�u�H�EH���
���H�E�H�H8H�E�   H��H������H�E�H��H������H�E�@�XH�E�H��H������H�E�XH�E�H��H���m���H�E�XH�E�H���Z���H�E� 9�|H�E�H�   �    H���I���H�E�H�H8H�E�   H��H���(���H�E�H�H8H�E�   H��H������H�E�H��H�������H�E�XH�E�H�������H�E� 9���   H�E�H�H`H�E�   H��H������H�E�H��H�������H�E�H�   H���b���H�M�H�E�H���   H���   H�AH�QH�E�H�H`H�E�   H��H���c���H�E�H�H8H�E�   H��H���G����!H�E�H�H8H�E�   H��H���)�������������H�]�����UH��SH��8H�}�H�EH���0���H�E�H�E�H�E�H�H8H�E�   H��H�������H�E�H��H������H�E�XH�E�H������H�E� 9�|H�E�H�H8H�E�   H��H�������!H�E�H�H8H�E�   H��H���p����x����E�    �E�    �s  H�E�H�H`H�E�   H��H���<���H�E�H�� H�������H�E�H�H �E�Hc�H��H��H�H��H�H���    H���  H��H�E�H��H�������H�E�@H�H9������E�H�E�H��H������H�E�@���taH�E�H�� H���]���H�E�H�H �E�Hc�H��H��H�H��H�H�CH���q����[H�E�H��H���^���H�E�@9�|�   ��    E�H�E�H�H`H�E�   H��H���3����}� tDH�E�H�PH�E�H�p8H�E�    H�������E܍HH�E�   ��H�������    �   �E�H�E�H�������H�E� 9E��r���H�E�H������H�E� 9E�|(H�E�H�PH�E�H�p8H�E�    H�������    �.H�E�H�PH�E�H�H8H�E�H��H���������t�������    �����H��H�]�����UH��SH��(H�}؉u�H�EH���d����}� uH�E�H��H������H�E؋@�E��K�}�uH�E�H��H�������H�E؋@�E��)�}�uH�E�H��H�������H�E؋@�E���E�    �E�    �E�
   �@H�E�H�PH�E�H�H8H�E�H��H��������u�   �#�E�i��  ���=����E�E�E�;E�|��    �������H�]�����UH��ATSH�� H�}�H�u�H�EH���j���H�E�H������H�EЋ ������  H�E�H��(H������H�E�L�`(H�E�H�������H�EЋH�E�H�������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H������H�E�H�PH�E�H�H8H�E�H��H��������uxH�E�H��(H���,���H�E�L�`(H�E�H���X���H�EЋH�E�H���F���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H�������   �  H�E�H�������H�EЋH�Eغ   ��H������H�E�H��(H������H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H������H�E�H�PH�E�H�H8H�E�H��H�����������   H�E�H��(H������H�E�L�`(H�E�H���=���H�EЋH�E�H���+���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H�������H�E�H��(H������H�E�H�X(H�E�H�������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H�������   �2  H�E�H������H�EЋH�Eغ   ��H���2����  H�E�H��(H������H�E�H�X(H�E�H���D���H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H������H�E�H�PH�E�H�H8H�E�H��H���~�����uaH�E�H��(H������H�E�H�X(H�E�H�������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H�������   �-  H�E�H������H�EЋH�Eغ   ��H���-���H�E�H��(H������H�E�L�`(H�E�H���D���H�EЋH�E�H���2���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H������H�E�H�PH�E�H�H8H�E�H��H���g�������   H�E�H��(H������H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H������H�E�H��(H���,���H�E�L�`(H�E�H���X���H�EЋH�E�H���F���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H�������   �  H�E�H�������H�EЋH�Eغ   ��H������H�E�H�H`H�Eغ   H��H�������H�E�H���    H������H�E�H��H������H�EЋ@�XH�E�H��H������H�EЉXH�E�H�H`H�Eغ   H��H���l���H�E�H���U���H�EЋH�Eغ    ��H������H�Eؾ    H��������E�H�E�H��(H�������H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H�������H�E�H��(H������H�E�L�`(H�E�H������H�EЋH�E�H������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���n����]��������H�� [A\]���UH��SH��(H�}�H�EH���s���H�E�H�E�H�E�H�� H�������H�E�H�@ H�E�H�U�H�E�H��H������H�U�H�E�H��H��������t�    �kH�E�H�������H�E��H�E�   ��H���~���H�E�   H���d�����t�    �*H�E�H������H�E��H�E�   ��H���=����w�������H��H�]�����UH���x���]���UH��SH��(H�}�H�u�H�EH���u���H�}� tH�E�H���"���H�E�� ��uH�E�H��  H��H���n����H�E�H�E�H�������H�E�� ��t!H�E�H�������H�E�� ����������u�H�E�H������H�E�� ��t/H�E�H������H�E�� <-uH�E�H�Y  H��H��������3H�E�H���p���H�E�� ��tH�E�H���Y���H�E�� <+uH�E�H�E�    �;H�U�H��H��H�H�H��H�E�H������H�E�� ����0H�H�H�E�H�E�H�E�H�������H�E�� ��t!H�E�H�������H�E�� �����������u��   �H9E�|H�E�H��  H��H������H�]��B���H��H�]�����UH��ATSH�� H�}�H�EH�������E�    �  H�E�H�� H������H�E�H�H �E�Hc�H��H��H�H��H��E�D�`H��H������D�#H�E�H�� H�������H�E�H�H �E�Hc�H��H��H�H��H�H�C H���m���H�E�H�C H�E�H�� H������H�E�H�H �E�Hc�H��H��H�H��H�H�CH���9����C    H�E�H��(H���R���H�E�H�H(�E�Hc�H��H��H�H��H�H�Eغ    H��H���j����E�H�E�H���O���H�E؋ 9E������������H�� [A\]���UH��ATSH��0H�}؉u�H�U�H�EH���K���H�E�H��H������H�E��@    �}�~�}�~H��  H�ƿ    �=����E�   �b�E�H�H��    H�E�H�H���j���H�H�ƿ    �D���H�E�X�A��Hc�H��    H�E�H�H������H�E�Hc�D�$��E��E�;E�|��}�uH�E�H��H�������H�E��@����H�E�H��H������H�E��@    H�E�H������H�E؋ Hc�H��H��H�H��H���F���H��H�E�H�� H���c���H�E�H�X H�E�H�������H�E؋ Hc�H��H��H�H��H��� ���H��H�E�H��(H������H�E�H�X(H�E�H�������H�E�H�H8H�Eغ    H��H���x���H�E�H�H`H�Eغ    H��H���\���H�E�H���   H�Eغ    H��H���=���H�E�H��H������H�E��@   �����H��0[A\]���UH��H�� H�}�H�EH���,���H�E�H���  �E�    �GH�E�H��(H������H�E�H�H(�E�Hc�H��H��H�H��H�H�E�   H��H�������E�H�E�H������H�E� 9E�|�H�E�H�H`H�E�   H��H���h���H�E�H���   H�E�   H��H���I���H�E�H�H8H�E�   H��H���-���H�E�H�� H�������H�E�H�@ H�������H�E�H��(H������H�E�H�@(H��������}��������UH�������]���UH��SH��(H�}�H�EH��������E�    H�E�H��H������H�E؋@����   �QH�E�H�� H���5���H�E�H�H �E�Hc�H��H��H�H��H�H�CH���	���H�C�    H���X����E�H�E�H���(���H�E؋ 9E�|�H�E�H��0H�������H�E�H�@0�    H�����������H�]�����UH�������]���UH��SH��HH�}�H�u�dH�%(   H�E�1�H�EH�������H�}� uH�Eо    H������H�E�H�E�H�E�H���A���H�E�H�H�E�H���.���H�E�H� H)�H��H�U�H�E�H��H������H�E�H�XH�E�H��H�������H�E�H�@H)�H��H�U�H�E�Hi��  H�M�H���S㥛� H��H��H��H��H��?H)�H�����H��H�U�dH+%(   t����H�]�����UH�������]� ��H��H���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     error: %s
 %ld %d has taken a fork
 %ld %d is eating
 %ld %d is sleeping
 %ld %d is thinking
 %ld %d died
 mtx_op error mtx_init error mtx_destroy error
 mtx_lock error
 mtx_unlock error
 args error  ;�      T���,  ����T  ����l  T���  =����  d����  �����  �����  ����   ����$   ���H  /���l  <����  �����  *����  9����  ���  ����<  ����`  �����  �����  �����  �����  ����  ���8  J���X  Y���|  8����  G����  T����         zR x�        8���&    D    $   4    ����   FJw� ?9*3$"       \   x���              t   p���p             �   ����'    E�C^      �   ����-    E�Cd      �   ����X    E�C      �   ����   E�C�       }���    E�CF           ,  h����   E�CH�{      P  ����    E�CF          t  ����   E�C    �  ����t    E�Ck      �  ����z    E�CE�l       �  R���    E�CF           �  =����   E�CE��         �����   E�CE��      D  �����    E�CE��       h  o����   E�CG���    �  H����    E�CE��       �  ���    E�CF           �  �����   E�CE��      �  ����h   E�CG��X      ����)   E�CG��   @  ����.   E�C%     `  ����    E�CF           �  �����    E�CE��       �  ����    E�CF           �  {���   E�CE��      �  d���    E�CF                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Q      �      �      �'      .      /       0             �             �             �                           00              �\      !                     �\             @              �\                    ���o    �             �             �      
       �                                          _             (                           `
             �             �      	                            ���o          ���o    �      ���o           ���o    d      ���o    
                                                                                       �\                      0      @      P      `      p      �      �      �      �      �      �      �      �                          0      @      P      `      p      �      �                                                      `      GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0                              ,    �       	      W                      ,    �       `      �                      ,           �      
                      ,    �             �                      ,    �       �'      �                      ,    �       %.      �                       ,           /                            �       	\   !L           
�  ��   Tid �<   *   u32 ��   �  �7   ����   �7    �  �<   f   �  �s    �  ��  	   ��   u64 ��   H   G   X   x   �  ��   �    '   ��   �    .   ��   �    �  �	  �    U   �  �        �6  �   �    �  �I  �    s  �\  �    6   �o  �    �  ��  �       ��  �    �  ��  �    C   �   >   �   �  �  	�\      �  {  !$ �     N  5  �   	      W      H   C   H      !    
  int �    �_   n  �_   �   	  �   �   �    �     f    3  r    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (y  �  X    c  5   S  X   =  5   �   X   k  "	Q     #	Q   �  $�    �  .   (C	�  	�  E  	  F�  	s  G_    �   �  .   ' S  H�  [  y  F   �  �  !�  �  �>�  �  @]   �  AX   �  BX   ;  Cm   �  Dr  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   op 5   $�  CRT  DST LK ULK  �  *�  �  5   ,�  EAT  
  
M  
�  DIE  4  3�  �  (5L  id 7X      8X   D  9�    :�  �  ;L    �    <�  X   m  .    Q  �  �  V_   �  �  �   �  �  Q�  L  r  �   �  ��  X    {  R�  L   �  	kX   �  �    |  �      �      �3  �  L  �hidx 'X   �d�  5�  �` B  ]      X       �l  �  L  �hmsg '~   �` �  X   0      -       ��  c �   �l �  X   	      '       �c �   �l  W   �  N  �  �   `      �      i  C   H   <      !    
  int �    �f   n  �f   �   	  �    �     m    3  y    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (v  �  _    c  5   S  _   =  5   �   _   k  "	X     #	X   �  $�    �  .   �  88�    :�  s  ;f    	�   �  
.   7 �  >�  �  (C	�  �  E     F�  s  Gf    	�     
.   ' S  H�  �   [  v  F     �  !7  �  �>�  �  @2   �  A_   �  B_   ;  CB   �  DG  (?  E  0d  F  8�  G  `I  H  ��  I�  � �  "�   �  (5!  id 7_      8_   D  9    :�  �  ;!    +    <�  	_   B  
.    &    {  R\  !   �  W<   r  <    �  X<   �  <    �  �_   �  �  �  �  >    v  �  �  �  �  <   �  <    �  S�  !  _      �  _   `      �      ��  _   ��}�    ��}�  
+  ��~�      �       i _   ��~   �   G  N    �   �      
      0  C   H      !    
  int �    �_   n  �_   �   	  �   �   .    �    �     f    3  r    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (  �  X    c  5   S  X   =  5   �   X   k  "	Q     #	Q   �  $�    �  .    �    "�   s  #X    =  $�  �  (C�  �  E	    F�  s  G_    �   �  .   ' S  H�  [    F   �  �  !#  �  �>�  �  @S   �  AX   �  BX   ;  Cc   �  Dh  (?  E�  0d  F  8�  G  `I  H  ��  I�  � �  "�   op 5   $�  	CRT  	DST 	LK 	ULK  �  *�  �  (5B  id 7X      8X   D  9�    :�  �  ;B        <�  X   c  .    G    
(  CX   �  �   �  
  X   �  �   
Q  X   �  �   
  X   �  �  �   �  B  P�  B  ~    r  X   |      z       �D  �  B  �Hmtx )h  �@val 3D  ��res X   �\ X   g        t       ��  �  B  �hmtx *h  �`val 4D  �X}  =X   �T �  �            ��  B  �hmtx &h  �`op 0�  �\  �   �  N    �         �      8  C   H   <      !    
  int �    �f   �  �5   n  �f   	  �  	  �     m    3  �    >   	'  3�   �  5#�    �  6#�    �   "  7�   	�  (}  �  _    c  5   S  _   =  5   �   _   k  "	X     #	X   �  $�    �  .   (C	�  
�  E  
  F�  
s  Gf    �   �  .   ' S  H�  [  }  F   �  �  !�  	�  �>�  �  @a   �  A_   �  B_   ;  Cq   �  Dv  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   op 5   $�  CRT  DST LK ULK  �  *�  �  5   ,�  EAT    M  �  DIE  4  3�  	�  (5P  id 7_      8_   D  9�    :�  �  ;P    �    <  _   q  .    U  �  �  �_   �  y    r  U_   �  P  v  �   _   |  Y�  P  _   �   g  T�  P  v  �  _    �  Vf          �  �  	C_   +  0  >    �   +  �  QO  P  v  �   �  �<   �&      �       ��  arg �<   �H�  �q  �P�  �P  �X �  b_   �      �      ��  �  bP  �H�  b,q  �@�  d_   �\ �  H_   �      �       �L  �  HP  �H�  H/�  �D�  J_   �T�  K_   �X�  L_   �\ �  <   �      �      ��  arg <   ���  P  �X�  _   �L   �  +_   �Tfed ,_   �P  �        �      ��  'P  �X�  7q  �P  �   �  N  N  �   �'      �      �  �  �:   C   H      !    
  int �    �m   n  �m   �   	  �    �     t    3  �    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (}  �  f    c  A   S  f   =  A   �   f   k  "	_     #	_   �  $�    �  :   (C	�  	�  E  	  F�  	s  Gm    �   �  :   ' S  H�  �   [  }  F   �  �  !�  �  �>�  �  @)   �  Af   �  Bf   ;  C9   �  D>  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   op A   $�  CRT  DST LK ULK  �  *�  �  (5  id 7f      8f   D  9�    :�  �  ;    �    <�  f   9  :      �    	�V  H    

  Nf     �  	�H   }  .    
�  Q�    >  �   �  Lf   �  �    �  Mf   �  �    
B  P�    �    {  @�,      .      �  �  @  �X(  Bf   �l �  (�*      )      �a  �  (  �H�  ('f   �D�  (4�  ��/  *f   �\   W)      h      ��  �  !  �H  f   �\ �  m   �'      �      ��    �Hstr +�   �@res m   �X  N   s	  
N  �  �   %.      �       �  C   H      !    
  int �    �a   n  �a   	  �    �     h    3  t    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (l  �  Z    c  5   S  Z   =  5   �   Z   k  "	S     #	S   �  $�    �  .   (C	�  �  E�     F�  s  Ga    �   �  .   ' S  Hx  [  l  F   �  �  !�  �  �>s  �  @�   �  AZ   �  BZ   ;  C�   �  D�  (?  E�  0d  F�  8�  G�  `I  H�  ��  Is  � �  "�   �  (5�  id 7Z      8Z   D  9�    :s  �  ;�    �    <  Z   �  .    �  �  5  �Z     	l  	   <   
  %.      �       ��  �  �HB  Z   �\  ]   z
  	N  �  �   /            f	  C   H   
<      !    
  int �    �f   n  �f   	  �    �     m    3  y    >   �  "�   �  C_   �   �   >    �   �   �  f   /            �[  beg [  ��end +[  ��tmp 
�   �@L  f   ��K  f   �� �    : :!;9!  9:!;9!  $ >!  4 G  & I   :!;9I   :!;9I   :!;9!  	%  
9:;9   :;9I  4 :;9I<l  4 :;9I<l   :;9I  4 :;9I<     4 :;9I?   I  . ?:;9<    :;9I8   :;9I  $ >   I   !I  (   :;9   :!;9I  	 :!;9I  
(    :!;9I  I  ! I/  .?:!;9!'<  .?:!;9!'@|  %  $ >  & I  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  .?:;9'�<  .?:;9'I<     .?:;9'I@z  .?:;9'I@z    :;9I8   :;9I   I  $ >   !I  :;9   :!;9I  7 I  	I  
! I/  .?:;9'I<  .?:!;9!'<   :!;!9I  %     $ >  :;9  & I  :;9   :;9I8  'I  .?:;9'I@|  4 :;9I    4 :;9I    :;9I8   :;9I  $ >   !I   I   :!;9I  :;9   :!;9I  	(   
.?:!;9!'I<   :!;9I  I  ! I/  :!;9!	  %  $ >  & I  >I:;9   :;9I8  .?:;9'<  .?:;9'I@|  4 :;9I  .?:;9'@|  .?:;9'@|    :;9I8   I   :;9I  $ >  4 :!;9I   !I  (    :!;9I  	:;9  
 :!;9I  (   .?:;9'I<  .?:!;9!'<  7 I  I  ! I/  .?:!;9!'I@|   :!;9I  .:!;9!'I@|  %     $ >  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  U  4 :;9I  .:;9'@|    :;9I8   :;9I  $ >   I   !I   :!;9I  :;9  (   	 :!;9I  
.?:!;9!'<  4 :!;9!I  I  ! I/  .?:!;9!'I<  .?:!;9!'@|  %     $ >  :;9  >I:;9   :;9I8  .?:;9'<  .?:;9'I<  .:;9'@|  .:;9'I@|   :;9I  4 :;9I    :;9I8  $ >   :;9I  :;9   !I   :!;9I  I  ! I/  	 I  
%     $ >  :;9   :;9I8  .?:;9'I<  .?:;9'@|   :;9I  4 :;9I   $ >   :;9I  7 I   :!;9I8   I   !I   :!;!9I  4 :!;9!I  	%  
   $ >  :;9  .?:;9'I<  .?:;9'I@|  4 :;9I   D     <   �             �   n   �   �   n       ^   �      �   ?  b  �  
5   5   �  �  �  �  �  �   �  �   		      � f fX .Y1� f f fX .Y1<��u��X��g �
�g �
�g �
�g �� ��$< �     Y   �      �   ?  b  �  	�   �   �  �  �  �  �  �   �   	`      ����FYM�@fJ��J+ e! t J�)���     Y   �      �   ?  b  �  	      �  �  �  �  �  �   �   	�      f� tuY f K
� f �K
u f �K
u f �K�?��uK�>��uK	u�f n    b   �      �   ?  b  �    
      �  �  �  �  �  �   >  G   	      J�$�"#.�K���$$.��$8��0w��w��$$.�L�0z�Xu	uZ $(�fS �D 	 f�&�. �6 �? �U .& � JX . X=�h��� t����Z�v �hJX	"��<��
=�
=�>	uuu0 �Ku�
ua	���f��<�$<7 )���u ��%<8 *���u�)$< u ��%<8 *����%< u�.$< u ��%< u�)$<7 )���u ��%< �%<8 *���u����K�����#< �#<6 (���	u����=1 .K�� K����     b   �      �   V  ?  b  �  
N   N     �  �  �  �  �  �   �   	�'      J� t .KY/	W. J . �L. J .Ku
. J .KY�0<XXu	U. J . �O�	Y�h.�u��#t�/��u��g�<	gz��ޡ�?/ fg=u/0J � f	(G���%g �$= ����'u���	�u��<
g�]��$����< �     Y   �      �   ?  b  �  	�   �   �  �  �  �  �  �   �   	%.      ���	�����!��"t �     J   �      �   ?  b    �   �   �  �  �   G   	/      J�v�.	�!t
��"�"�� __hwasan tid_t __interception kMainTid __dsan __dfsan __ubsan long long unsigned int __msan GNU C++14 13.3.0 -mshstk -mtune=generic -march=x86-64 -g -O2 -std=gnu++14 -fPIC -fno-builtin -fno-exceptions -fno-rtti -funwind-tables -fvisibility=hidden -fcf-protection=full -fno-omit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection __scudo __tsan_init __sanitizer __lsan __asan __memprof __local_tsan_preinit kInvalidStackID kInvalidTid __tsan uptr __xray t_table __data FORK tv_sec short int t_philo meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev start_stamp __next t_op __kind long long int t_timer props printf forks mtx_op hb_mtx exit barier unsigned char meals __size SLEEP short unsigned int t_action __nusers t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s __time_t __elision timeval __pthread_list_t tv_usec philos exit_error THINK __owner t_thread table_mtx __suseconds_t print_status get_time_diff pthread_t __list is_num main pthread_create hb_routine table_create argc argv philo_routine pthread_attr_t pthread_mutex_init pthread_mutex_lock pthread_mutex_unlock pthread_mutexattr_t pthread_mutex_destroy mtx_setval mtx_getval n_val usleep delta dead s_time ph_eat a_type philo_wait_start ph_action act_res gettimeofday __useconds_t c_philo size_t malloc ft_atoi free threads_wait c_idx init_setup c_fork c_arg pthread_join c_thread us_diff /build/gcc-13-fG75Ri/gcc-13-13.3.0/build/x86_64-linux-gnu/libsanitizer/tsan ../../../../src/libsanitizer/tsan/tsan_preinit.cpp ../../../../src/libsanitizer/tsan ../../../../src/libsanitizer/sanitizer_common sanitizer_internal_defs.h tsan_interface.h /home/borov/projects/42_folder/circle_3/philosophers/philo helpers.c /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h stdio.h main.c pthread.h mtx_op.c p_routine.c /usr/include/x86_64-linux-gnu/sys unistd.h time.h table.c /usr/lib/gcc/x86_64-linux-gnu/13/include stddef.h threads.c timer.c          ��	�	�	                                   ��                	     �                  ��                     P                    �              3     �              I     `             U     �\              |                    �     �\              �    ��                �    ��                �     Q             �    ��                �     �             �    ��                �     �             �    ��                �           �      �     �      �           �      �      �     �'                ��                    �'      �          W)      h      �     .             *   ��                �     /             4   ��                �      0                 ��                <    �E                   ��                J     �@              ]    _              s    �\              �      `              |                     �           &       �    �&      �       �                     �                      �    %.      �       �                     �          t       �                     �                     �   00              �                     	                                          $                     6                     =    �      �      J                     ]                      y    0      -       �     @             �                      �     `              �    �            �    �      �      �                     �  "                                                                                   -   �\             B    /            P                     _   `              k   `              x    �*      )      �    ]      X       �    	      '       �    `              �                     �                     �    �,      .      �    |      z       �    `              �                     �                                              `                                                        <    `      �                        A                      Scrt1.o __abi_tag crtstuff.c deregister_tm_clones __do_global_dtors_aux completed.0 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry tsan_preinit.cpp helpers.c _sub_I_00099_0 main.c mtx_op.c p_routine.c philo_wait_start ph_action ph_eat table.c ft_atoi init_setup threads.c timer.c __FRAME_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ _DYNAMIC __tsan_read8 philo_routine usleep __gmon_start__ threads_wait pthread_mutex_init mtx_setval exit@GLIBC_2.2.5 __tsan_read1 _fini gettimeofday __tsan_init __tsan_write16 __tsan_func_entry malloc print_status pthread_mutex_lock _ITM_deregisterTMCloneTable is_whitespace _IO_stdin_used _ITM_registerTMCloneTable __data_start mtx_op hb_routine pthread_mutex_destroy __cxa_finalize@GLIBC_2.2.5 __tsan_write8 __tsan_write4 __tsan_func_exit __local_tsan_preinit get_time_diff pthread_create __TMC_END__ __dso_handle table_create exit_error is_num __bss_start __stack_chk_fail@GLIBC_2.4 __tsan_read16 destroy_table mtx_getval _end pthread_mutex_unlock free __tsan_read4 _edata printf __libc_start_main@GLIBC_2.34 main pthread_join  .symtab .strtab .shstrtab .interp .note.gnu.property .note.gnu.build-id .note.ABI-tag .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rela.dyn .rela.plt .init .plt.got .plt.sec .text .fini .rodata .eh_frame_hdr .eh_frame .preinit_array .init_array .fini_array .dynamic .data .bss .comment .debug_aranges .debug_info .debug_abbrev .debug_line .debug_str .debug_line_str .debug_rnglists                                                                                                                         #             8      8      0                              6             h      h      $                              I             �      �                                     W   ���o       �      �      $                             a             �      �      �                          i             �      �      �                             q   ���o       d      d      :                            ~   ���o       �      �      @                            �             �      �      �                           �      B       `
      `
      (                          �                                                         �                           �                            �             �      �                                   �             �      �      p                            �                                                        �             00      00                                    �              @       @      �                              �             �@      �@      �                              �             �A      �A                                   �             �\      �L                                   �             �\      �L      @                                          �\      �L                                               �\      �L                                  �             _      O      �                                          `       P                                                `      P                                          0               P      +                             )                     ;P      p                             8                     �Q      z                             D                     %q      `                             R                     �|      
                             ^     0               ��      S                            i     0               ٌ      �                            y                     s�                                                          ��      �      %   %                 	                      �      N                                                   f�      �                             

=== philo.h ===
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
	t_timer		meal_stamp;
	t_table		*table;
}	t_philo;

typedef struct	table
{
	int			props[6];
	int			t_status;
	int			barier;
	t_philo		*philos;
	t_mutex		*forks;
	t_thread	heartbeat;
	t_mutex		table_mtx;
	t_mutex		hb_mtx;
	t_mutex		print_mtx;
	t_timer		start_stamp;
}	t_table;

int		is_num(char c);
int		is_whitespace(char c);
void	threads_wait(t_table *table);
void	destroy_table(t_table *table);
void	exit_error(t_table *table, char *msg);
void	mtx_op(t_table *table, t_mutex *mtx, t_op op);
void	destroy_table(t_table *table);
void	table_create(t_table *table, int argc, char **argv);
void	mtx_setval(t_table *table, t_mutex *mtx, int *val, int n_val);
int	mtx_getval(t_table *table, t_mutex *mtx, int *val);
long	get_time_diff(t_timer *beg, t_timer *end);
void	*hb_routine(void *arg);
void	*philo_routine(void *arg);
void	print_status(t_table *table, int idx, t_action action);

#endif


=== table.c ===
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


=== table.o ===
ELF          >                    �*          @     @   ��UH��SH��(H�}�H�u�H�EH���    H�}� tH�E�H���    H�E�� ��uH�E�H�    H��H���    �H�E�H�E�H���    H�E�� ��t!H�E�H���    H�E�� �����    ��u�H�E�H���    H�E�� ��t/H�E�H���    H�E�� <-uH�E�H�    H��H���    �3H�E�H���    H�E�� ��tH�E�H���    H�E�� <+uH�E�H�E�    �;H�U�H��H��H�H�H��H�E�H���    H�E�� ����0H�H�H�E�H�E�H�E�H���    H�E�� ��t!H�E�H���    H�E�� �����    ��u��   �H9E�|H�E�H�    H��H���    H�]��    H��H�]�����UH��ATSH�� H�}�H�EH���    �E�    �  H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H��E�D�`H��H���    D�#H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�C H���    H�E�H�C H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    �C    H�E�H��(H���    H�E�H�H(�E�Hc�H��H��H�H��H�H�Eغ    H��H���    �E�H�E�H���    H�E؋ 9E�������    �H�� [A\]���UH��ATSH��0H�}؉u�H�U�H�EH���    H�E�H��H���    H�E��@    �}�~�}�~H�    H�ƿ    �    �E�   �b�E�H�H��    H�E�H�H���    H�H�ƿ    �D���H�E�X�A��Hc�H��    H�E�H�H���    H�E�Hc�D�$��E��E�;E�|��}�uH�E�H��H���    H�E��@����H�E�H��H���    H�E��@    H�E�H���    H�E؋ Hc�H��H��H�H��H���    H��H�E�H�� H���    H�E�H�X H�E�H���    H�E؋ Hc�H��H��H�H��H���    H��H�E�H��(H���    H�E�H�X(H�E�H�������H�E�H�H8H�Eغ    H��H���    H�E�H�H`H�Eغ    H��H���    H�E�H���   H�Eغ    H��H���    H�E�H��H���    H�E��@   �    �H��0[A\]���UH��H�� H�}�H�EH���    H�E�H���    �E�    �GH�E�H��(H���    H�E�H�H(�E�Hc�H��H��H�H��H�H�E�   H��H���    �E�H�E�H���    H�E� 9E�|�H�E�H�H`H�E�   H��H���    H�E�H���   H�E�   H��H���    H�E�H�H8H�E�   H��H���    H�E�H�� H���    H�E�H�@ H���    H�E�H��(H���    H�E�H�@(H���    �    �����UH���    ]�args error           �                           �              �:                           int         �m       �m   �               �       t        �            3�       5#�        6#�    �       7�       (}      f        A       f       A        f       "	_       #	_       $�        :   (C	�  	    E  	    F�  	    Gm    �   �  :   '     H�  �       }       �      !�      �>�      @)       Af       Bf       C9       D>  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�   op A   $�  CRT  DST LK ULK      *�      (5  id 7f        8f       9�      :�      ;    �      <�  f   9  :      �      	�V  H    
    Nf         	�H   }  .    
    Q�    >  �       Lf   �  �        Mf   �  �    
    P�    �        @        .      �      @  �X    Bf   �l     (        )      �a      (  �H    ('f   �D    (4�  ��    *f   �\             h      ��      !  �H    f   �\     m           �      �      �Hstr +�   �@res m   �X   :;9I8   :;9I  $ >   I   !I   :!;9I  :;9  (   	 :!;9I  
.?:!;9!'<  4 :!;9!I  I  ! I/  .?:!;9!'I<  .?:!;9!'@|  %     $ >  :;9  >I:;9   :;9I8  .?:;9'<  .?:;9'I<  .:;9'@|  .:;9'I@|   :;9I  4 :;9I   ,                     �                          b   �                          
                                            	        J� t .KY/	W. J . �L. J .Ku
. J .KY�0<XXu	U. J . �O�	Y�h.�u��#t�/��u��g�<	gz��ޡ�?/ fg=u/0J � f	(G���%g �$= ����'u���	�u��<
g�]��$����< t_table __data tv_sec short int size_t malloc meal_stamp __pthread_internal_list ft_atoi heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev table free start_stamp __next __size t_op __kind long long int threads_wait t_timer long int props t_status philo c_idx forks mtx_op hb_mtx unsigned char barier table_create meals argc signed char long long unsigned int unsigned int argv thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos exit_error init_setup __owner c_fork t_thread table_mtx __suseconds_t pthread_t __list is_num c_arg /home/borov/projects/42_folder/circle_3/philosophers/philo table.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/lib/gcc/x86_64-linux-gnu/13/include /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include table.c table.c stddef.h types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0                GNU   �                 zR x�             �   E�CE��      @       h   E�CG��X    d       )   E�CG��   �       .   E�C%     �           E�CF                                   ��                                                            	             �           �      h           |                                        
                                                                                   +                      =                      J                      U                      c                      j                      {                      �                      �                      �                      �                      �     %      )      �                      �     N      .      �                      �                      �                       table.c ft_atoi init_setup _sub_I_00099_0 __tsan_func_entry __tsan_read1 exit_error is_whitespace is_num __tsan_func_exit __tsan_read8 __tsan_write4 __tsan_write8 mtx_op __tsan_read4 table_create malloc destroy_table threads_wait free __tsan_init              ��������0             ��������F             ��������Q             ��������d             ��������{             ���������             ���������             ���������             ���������             ���������             ���������             ���������             ��������3            ��������Z            ��������q            ���������            ���������            ���������            ���������            ���������            ���������            ��������&            ��������9            ��������e            ��������}            ���������            ���������            ���������            ��������            ��������            ��������G            ��������W            ��������u            ���������            ���������            ���������            ��������            ��������&            ��������=            ��������\            ��������o            ���������            ���������            ���������            ���������            ��������            ��������             ��������0            ��������@            ��������f            ��������r            ���������            ���������            ���������            ���������            ��������            ��������0            ��������@            ��������P            ��������`            ��������p            ��������u            ���������            ��������              |             
                     
   
   �             
      ;              
                                   *       
   	           /       
   
           =       
   
   �      D       
   
   �      M       
   
   D      T       
   
   �      [       
   
   q      b       
   
          p       
   
         u       
   
   �      �       
   
         �       
   
   �      �       
   
   �       �       
   
   �      �       
   
          �       
   
   �      �       
   
   }      �       
   
   9       �       
   
   �       �       
   
   �       �       
   
   �            
   
   �            
   
   ~      "      
   
   }       /      
   
   �      <      
   
   �      I      
   
   �       V      
   
   �       c      
   
   �      p      
   
   4      ~      
   
   *      �      
   
          �      
   
   �       �      
   
   �       �      
   
   m       �      
   
   	      �      
   
   �      �      
   
           �      
   
   �             
   
               
   
         !      
   
   R      .      
   
   �      ;      
   
   0      H      
   
   Y       U      
   
         b      
   
   =      o      
   
   c       |      
   
   �       �      
   
         �      
   
   �       �      
   
   $      �      
   
   f      �      
   
   �      �      
   
   .             
   
   �             
   
   �      D      
   
   �       W      
   
   �       g      
   
   '       ~      
   
   6      �      
   
   ;      �      
   
   �       �      
   
   �      �      
   
   �       �            N      �      
   
   �       �      
   
               
   
   Y                  %      )      
   
   �       7      
   
   l      E      
   
   �      T      
   
   B      b      
   
   �      i            �      �      
   
   �       �      
   
   *      �      
   
   Q       �                    �      
   
   �              
                                   "       
      C       &       
      ~       *       
      �       .       
      �       2       
      �       <       
             A       
            F       
            K       
            P       
      !      U       
      2      Z       
      H      _       
      W      d       
      f      i       
      n      s                                           D             �      h             %      �             N      �             |       .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                   @               `                                 &                     �                                     ,                     �                                     1                     �                                    >                     �                                   9      @               `                                 U                      �      �                             P      @               x                                a                      �      �                             t                      �      0                              o      @               �'      0                           �                      �                                   �      @               �'      �                          �      0               �      H                            �      0                     w                            �      0               �      ,                             �                      �                                     �                     �                                     �                     �      �                              �      @               8)      x                                                 �      �                          	                      h      �                                                    �)      �                              

=== threads.c ===
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


=== threads.o ===
ELF          >                    �          @     @   ��UH��SH��(H�}�H�EH���    �E�    H�E�H��H���    H�E؋@����   �QH�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    H�C�    H���    �E�H�E�H���    H�E؋ 9E�|�H�E�H��0H���    H�E�H�@0�    H���    �    �H�]�����UH���    ]�          N       
                    �                                   int         �a       �a               �       h        t            3�       5#�        6#�    �       7�       (l      Z        5       Z       5        Z       "	S       #	S       $�        .   (C	�      E�       F�      Ga    �   �  .   '     Hx      l       �      !�      �>s      @�       AZ       BZ       C�       D�  (    E�  0    F�  8    G�  `    H�  �    Is  �     "�       (5�  id 7Z        8Z       9�      :s      ;�    �      <  Z   �  .    �  �      �Z     	l  	   <               �       �    �  �H    Z   �\   :;9I8  $ >   :;9I  :;9   !I   :!;9I  I  ! I/  	 I  
%     $ >  :;9   :;9I8  .?:;9'I<  .?:;9'@|   :;9I  4 :;9I   ,                     �                       �     Y   �                      	                                        	        ���	�����!��"t print_mtx t_table t_philo philos t_status __data t_thread short int threads_wait forks __suseconds_t __owner __kind pthread_mutex_t __lock pthread_join pthread_t t_mutex unsigned char __size __pthread_mutex_s c_thread meal_stamp short unsigned int thread table __time_t meals __nusers long unsigned int GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __pthread_internal_list __elision barier philo timeval unsigned int long long unsigned int __spins tv_usec start_stamp tv_sec long long int char __align __count heartbeat __prev __pthread_list_t table_mtx long int __list props __next signed char hb_mtx t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo threads.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include threads.c threads.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0            GNU   �                 zR x�             �    E�CE��       @           E�CF                                   ��                                           �                                         	                                                                                                �       '                      9                      F                      S                      `                      q                       threads.c _sub_I_00099_0 threads_wait __tsan_func_entry __tsan_read4 __tsan_read8 pthread_join __tsan_func_exit __tsan_init              
   ��������0             ��������R             ��������~             ���������             ���������             ���������             ���������             ���������             ���������             ��������              �              
                     
      /             
      ;              
                                   *       
              1       
            8       
            A       
      �       H       
      �       O       
      �      V       
      :       d       
      �      i       
            u       
      W       �       
      [      �       
      M      �       
      �      �       
      F      �       
      2      �       
            �       
      �      �       
      z      �       
      �      �       
      �      �       
      �             
      �             
      h            
      e       +      
            8      
      m       E      
      *      R      
      �      _      
      �      m      
      �       �      
      *       �      
      �       �      
      `      �      
      t       �      
      1       �      
      �       �      
      
       �      
      �       �      
      �      �      
      !             
      �            
             %      
      Q       2      
      p      ?      
      �      L      
      �      Y      
              f      
      :      t      
      �      �      
      �      �      
            �      
      �       �      
      �       �      
      �       �      
             �      
      �             
      D                            3      
      �       B      
      �              
                                   "       
      E       &       
      �       *       
      �       .       
      �       8       
      �       =       
      �       B       
      �       G       
      �       L       
            Q       
            V       
      +      [       
      :      `       
      B      j                                           D             �        .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                    @               0      �                           &                     .                                     ,                     .                                     6                     0                                   1      @                                                 M                      8      R                             H      @               8                                Y                      �                                   l                      �      0                              g      @               P      0          
                 �                      �      �                              {      @               �      P                          �      0               b      �                            �      0               6	      L                            �      0               �
      ,                             �                      �
                                     �                     �
                                     �                     �
      `                              �      @               �      0                                                 0      �         	                 	                      �      }                                                           �                              

=== timer.c ===
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


=== timer.o ===
ELF          >                    �          @     @   ��UH��SH��HH�}�H�u�dH�%(   H�E�1�H�EH���    H�}� uH�Eо    H���    H�E�H�E�H�E�H���    H�E�H�H�E�H���    H�E�H� H)�H��H�U�H�E�H��H���    H�E�H�XH�E�H��H���    H�E�H�@H)�H��H�U�H�E�Hi��  H�M�H���S㥛� H��H��H��H��H��?H)�H��    H��H�U�dH+%(   t�    H�]�����UH���    ]�            ]       	                                      
<                   int         �f       �f               �       m        y            "�       C_   �   �   >    �   �       f                 �[  beg [  ��end +[  ��tmp 
�   �@    f   ��    f   �� �    $ >   :;9I  7 I   :!;9I8   I   !I   :!;!9I  4 :!;9!I  	%  
   $ >  :;9  .?:;9'I<  .?:;9'I@|  4 :;9I   ,                                           �     J   �                                                  	        J�v�.	�!t
��"�"�� long long int unsigned int timeval long unsigned int long long unsigned int us_diff unsigned char char s_diff get_time_diff gettimeofday t_timer tv_usec __time_t tv_sec short unsigned int signed char long int short int __suseconds_t GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection /home/borov/projects/42_folder/circle_3/philosophers/philo timer.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include/x86_64-linux-gnu/sys timer.c timer.c types.h struct_timeval.h philo.h time.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0               GNU   �                 zR x�                E�CE��       @           E�CF                                   ��                                      	                                             	                                                                                                      &                      8                      E                      R                      c                      t                       timer.c _sub_I_00099_0 get_time_diff __tsan_func_entry gettimeofday __tsan_read8 __tsan_func_exit __stack_chk_fail __tsan_init ,          
   ��������D             ��������X             ��������k             ���������             ���������             ���������             ��������            ��������            ��������                           
                     
      �              
      ;              
                                   *       
              1       
      #       8       
             F       
      T       M       
      �       T       
      �       [       
      �       i       
      �       n       
      �       z       
      �       �       
      b       �       
              �       
             �       
      �       �       
      �       �       
      5       �       
      �       �       
      |       �       
      n       �                     ?      
      g       M      
      L              
                                   "       
      C       &       
      ~       *       
      �       .       
      �       8       
      �       =       
      �       B       
      �       G       
            L       
            Q       
            [                                           D                    .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @                                          @               �	      �                           &                     \                                     ,                     \                                     6                     `                                   1      @               �
                                 M                      h      a                             H      @               �
      �                          Y                      �      �                              l                      �      0                              g      @               P      0          
                 �                      �      �                              {      @               �                                �      0               z      �                            �      0                     $                            �      0               '      ,                             �                      S                                     �                     X                                     �                     x      `                              �      @               �      0                                                 �      �         	                 	                      X	      �                                                    �      �                              

=== helpers.c ===
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
	mtx_op(table, &table->print_mtx, LK);
	if (action == FORK)
		printf("%ld %d has taken a fork\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == EAT)
		printf("%ld %d is eating\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == SLEEP)
		printf("%ld %d is sleeping\n", get_time_diff(&table->start_stamp, NULL), idx);
	else if (action == THINK)
		printf("%ld %d is thinking\n", get_time_diff(&table->start_stamp, NULL), idx);
	else
		printf("%ld %d died\n", get_time_diff(&table->start_stamp, NULL), idx);
	mtx_op(table, &table->print_mtx, ULK);
}

// long	get_ms(t_timer *time)
// {
// 	return (time->tv_sec * 1000 + time->tv_usec / 1000);
// }

// void	ft_usleep(int ms)
// {
// 	long	beg;
// 	t_timer	tmp;

// 	gettimeofday(&tmp, NULL);
// 	beg = get_ms(&tmp);

// }


=== main.c ===
#include "philo.h"

int	main(int argc, char **argv)
{
	t_table	table;

	table_create(&table, argc, argv);
	for (int i = 0; i < table.props[P_NUM]; i++)
		pthread_create(&table.philos[i].thread, NULL, philo_routine, &table.philos[i]);
	pthread_create(&table.heartbeat, NULL, hb_routine, &table);
	table.t_status = 2;
	destroy_table(&table);
}


=== mtx_op.c ===
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


=== p_routine.c ===
#include "philo.h"

static void	philo_wait_start(t_table *table, t_philo *philo)
{
	mtx_op(table, &table->table_mtx, LK);
	table->barier += 1;
	if (table->barier >= table->props[P_NUM])
		gettimeofday(&table->start_stamp, NULL);
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
	int	time;
	int	s_time;
	int	delta;

	if (a_type == EAT)
		time = table->props[TTE];
	else if (a_type == SLEEP)
		time = table->props[TTS];
	else if (a_type == THINK)
		time = table->props[TTT];
	else
		time = 0;
	s_time = 0;
	delta = 10;
	while (s_time < time)
	{
		if (mtx_getval(table, &table->table_mtx, &table->barier) == 0)
			return (1);
		usleep(delta * 1000);
		s_time += delta;
	}
	return (0);
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
	while (1)
	{
		if (ph_eat(table, philo) != 0)
			return (NULL);
		print_status(table, philo->id, SLEEP);
		if (ph_action(table, SLEEP) != 0)
			return (NULL);
		print_status(table, philo->id, THINK);
	}
	return (NULL);
}


=== table.c ===
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


=== threads.c ===
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


=== timer.c ===
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


p_routine.c
#include "philo.h"

static void	philo_wait_start(t_table *table, t_philo *philo)
{
	mtx_op(table, &table->table_mtx, LK);
	table->barier += 1;
	if (table->barier >= table->props[P_NUM])
		gettimeofday(&table->start_stamp, NULL);
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
p_routine.o
ELF          >                    �;          @     @   ��UH��SH��H�}�H�u�H�EH���    H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�@�XH�E�H��H���    H�E�XH�E�H��H���    H�E�XH�E�H���    H�E� 9�|H�E�H�   �    H���    H�E�H�H8H�E�   H��H���    H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�XH�E�H���    H�E� 9���   H�E�H�H`H�E�   H��H���    H�E�H��H���    H�E�H�   H���    H�M�H�E�H���   H���   H�AH�QH�E�H�H`H�E�   H��H���    H�E�H�H8H�E�   H��H���    �!H�E�H�H8H�E�   H��H���    ������    �H�]�����UH��SH��8H�}�H�EH���    H�E�H�E�H�E�H�H8H�E�   H��H���    H�E�H��H���    H�E�XH�E�H���    H�E� 9�|H�E�H�H8H�E�   H��H���    �!H�E�H�H8H�E�   H��H���    �x����E�    �E�    �s  H�E�H�H`H�E�   H��H���    H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H���    H���    H��H�E�H��H���    H�E�@H�H9������E�H�E�H��H���    H�E�@���taH�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    �[H�E�H��H���    H�E�@9�|�   ��    E�H�E�H�H`H�E�   H��H���    �}� tDH�E�H�PH�E�H�p8H�E�    H���    �E܍HH�E�   ��H���    �    �   �E�H�E�H���    H�E� 9E��r���H�E�H���    H�E� 9E�|(H�E�H�PH�E�H�p8H�E�    H���    �    �.H�E�H�PH�E�H�H8H�E�H��H���    ��t�������    �    H��H�]�����UH��SH��(H�}؉u�H�EH���    �}� uH�E�H��H���    H�E؋@H�H�E��R�}�uH�E�H��H���    H�E؋@H�H�E��-�}�uH�E�H��H���    H�E؋@H�H�E��H�E�    H�U�H�E�H��H���    ���    ��H�]�����UH��ATSH�� H�}�H�u�H�EH���    H�E�H���    H�EЋ ������  H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ��uxH�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ����   H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    �  H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ��uaH�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H���    H�E؋ ��uaH�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    �   �  H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    H�E�H�PH�E�H�H8H�E�H��H���    ����   H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �   �  H�E�H���    H�EЋH�Eغ   ��H���    H�E�H�H`H�Eغ   H��H���    H�E�H���    H���    H�E�H��H���    H�EЋ@�XH�E�H��H���    H�EЉXH�E�H�H`H�Eغ   H��H���    H�E�H���    H�EЋH�Eغ    ��H���    H�Eؾ    H�������E�H�E�H��(H���    H�E�H�X(H�E�H���    H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���    H�E�H��(H���    H�E�L�`(H�E�H���    H�EЋH�E�H���    H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���    �]��    ��H�� [A\]���UH��SH��(H�}�H�EH���    H�E�H�E�H�E�H�� H���    H�E�H�@ H�E�H�U�H�E�H��H��������   H�U�H�E�H��H��������t
�    �   H�E�H���    H�E��H�E�   ��H���    H�E�   H���"�����t�    �mH�E�H���    H�E��H�E�   ��H���    H�E�   H���������t�    �,H�E�H�PH�E�H�H8H�E�H��H���    ���6����    �    H��H�]�����UH���    ]�              �                                             <                   int         �f       �f           	    �       m        y        	    3�       5#�        6#�    �       7�   	    (q      _        5       _       5        _       "	X       #	X       $�        .   (C	�      E�       F�      Gf    �   �  .   '     H}      q       �      !�  	    �>x      @U       A_       B_       Ce       Dj  (    E�  0    F�  8    G�  `    H�  �    Ix  �     "�   op 5   $�  CRT  DST LK ULK      *�      5   ,�  EAT              DIE      3�  	    (5D  id 7_        8_       9�      :x      ;D    �      <�  _   e  .    I  �  
    M_   �  D  f    
    V_   �  D  j  �   _       Z�  D  _   �       U�  D  j  �  _    
    Wf          x  
    C_   #  (  >    �   #      RG  D  j  �       �<           6      ��  arg �<   �H    �e  �P    �D  �X     W_           u      ��      WD  �H    W,e  �@    Y_   �\     H_           �       �(      HD  �H    H/�  �D    Jf   �X     <           �      ��  arg <   ��    D  �X    _   �L        +_   �Tfed ,_   �P              �      �    'D  �X    7e  �P   :;9I8   I   :;9I  $ >   !I  4 :!;9I  (    :!;9I  	:;9  
.?:;9'I<   :!;9I  (   .?:!;9!'<  7 I  I  ! I/  .?:!;9!'I@|   :!;9I  .:!;9!'I@|  %     $ >  :;9  >I:;9  >I:;9   :;9I8  U  4 :;9I  .:;9'@|   ,                                                    ��	�	�	 �    Y   �                      	                                        	        J�$�"#.�K���$$.��$8��0w��w��$$.�L�0z�Xu	uZ $(�fS �D 	 f�&�. �6 �? �U .& � JX . X=�h��� t����Z�v �hJX	"��<���
���
���
��if��<�$<7 )���u ��%<8 *���u�)$< u ��%<8 *����%< u�.$< u ��%< u�%��%< u"$<7 )���u ��%< �%<8 *���u����K�����#< �#<6 (���	u����=/Z .K�� K�� K	wt> �	��� t_table __data FORK tv_sec short int t_philo meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __suseconds_t __count __spins dead __align __prev table start_stamp __next __size ph_eat t_op a_type long long int action long int props t_status philo forks mtx_op hb_mtx philo_wait_start ph_action hb_routine barier unsigned char act_res meals gettimeofday signed char long long unsigned int unsigned int time SLEEP thread short unsigned int t_action char __nusers t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock philo_routine __pthread_mutex_s long unsigned int philos __time_t __elision timeval __pthread_list_t tv_usec mtx_setval THINK __owner precise_sleep mtx_getval t_thread table_mtx c_philo __kind print_status get_time_diff pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo p_routine.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include/x86_64-linux-gnu/sys p_routine.c p_routine.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h time.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0              GNU   �                 zR x�             �   E�CE��      @       �   E�CE��      d       �    E�CE��       �       u   E�CG��e    �       6   E�CE�(      �           E�CF                                   ��                                                   �           �      �       (     `      u      /                                             	                                                                                                         >                      P                      W                      d                      r                                            �                      �                      �     �      �      �                      �                      �                      �                      �                      �                          �      6                            p_routine.c philo_wait_start ph_action ph_eat _sub_I_00099_0 __tsan_func_entry mtx_op __tsan_read4 __tsan_write4 gettimeofday __tsan_write16 __tsan_read16 __tsan_func_exit hb_routine __tsan_read8 get_time_diff mtx_setval print_status mtx_getval precise_sleep philo_routine __tsan_init                ��������9             ��������I             ��������c             ��������z             ���������             ���������             ���������             ���������             ���������             ��������	            ��������3            ��������C            ��������U            ���������            ���������            ���������            ���������            ���������            ��������            ��������+            ��������>            ��������d            ���������            ���������            ���������            ���������            ��������	            ��������.            ��������J            ��������v            ���������            ���������            ���������            ���������            ��������            ��������4            ��������`            ���������            ���������            ���������            ���������            ���������            ��������#            ��������M            ��������T            ��������            ���������            ���������            ���������            ���������            ��������
            ��������)            ��������=            ��������Q            ��������c            ���������            ���������            ���������            ���������            ���������            ��������!            ��������@            ��������X            ��������l            ��������~            ���������            ���������            ���������            ��������            ��������#            ��������<            ��������Q            ��������e            ���������            ���������            ���������            ���������            ��������	            ��������(	            ��������A	            ��������M	            ��������h	            ��������|	            ���������	            ���������	            ���������	            ���������	            ��������'
            ��������F
            ��������^
            ��������r
            ���������
            ���������
            ���������
            ���������
            ��������            ��������)            ��������B            ��������^            ��������s            ���������            ���������            ���������            ���������            ���������            ��������	            ��������            ��������P            ��������`            ��������t            ���������            ���������            ���������            ���������            ��������            ��������W            ��������p            ���������            ���������            ���������            ���������            ��������            ��������                           
                     
      �             
      ;              
                                   *       
   
           1       
      �      8       
      �      F       
      M      M       
      �      T       
      v      [       
             i       
      �       n       
      �      z       
      t       �       
      �      �       
      �       �       
      �      �       
             �       
      �      �       
      �      �       
      8       �       
      �       �       
      �       �       
      �      �       
      �      	      
      �            
      �       #      
            0      
      �      =      
      K      J      
      �       W      
      �      d      
      w      r      
      m      �      
             �      
      �       �      
      �       �      
      d       �      
      0      �      
      �      �      
              �      
      �       �      
      �             
      �             
      F            
      �      *      
            7      
      P       D      
      9      Q      
            ^      
      Z       k      
      �       y      
      ~      �      
      �       �      
      �       �      
      �      �      
      	      �      
             �      
      �      �      
                  
      c            
      �      *      
      -       7      
      �       J      
      %       p      
            �      
      %      �      
      R      �      
      �      �      
      _      	      
      i      .      
            H      
      �      Q            �      v      
            �      
      �       �      
      �       �            `      �      
      �       �      
            �      
      [      �      
      1      �            �      �      
      �             
      �             
      �      )      
      ;      2            �      X      
      �       f      
      C      t      
   	          y      
      �       �      
             �                    �      
      �       �      
                   
                                   "       
      G       &       
      �       *       
      �       .       
      �       8       
      �       =       
      �       B       
            G       
            L       
      !      Q       
      7      V       
      F      [       
      U      `       
      ]      j                                           D             �      h             �      �             `      �             �      �                    .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .debug_rnglists .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @                                          @               �#      �                          &                     Z                                     ,                     Z                                     6                     `                                   1      @               p/                                 M                      h      �                             H      @               �/      	                          Y                      7      �                             l                      �      0                              g      @               �8      0          
                 {                      .                                    �                      E      �                             �      @               �8      P                          �      0               �      �                            �      0               T      d                            �      0               �      ,                             �                      �                                     �                     �                                     �                           �                              �      @                :      �                                                 �      �                          	                      �"                                                         �:      �                              philo
ELF          >           @       ��          @ 8  @ ' &       @       @       @       �      �                                                                                        �      �                                        	"      	"                    @       @       @                               �L      �\      �\      x      �                   �L      �\      �\                                 8      8      8      0       0                    h      h      h      D       D              S�td   8      8      8      0       0              P�td   �@      �@      �@                         Q�td                                                  R�td   �L      �\      �\      h      h             /lib64/ld-linux-x86-64.so.2               GNU   �          � �                   GNU �M�������d�
F���^         GNU                                 �            �e�m                            |                      b                                            �                      w                      .                                          F                                           R                      I                     �                                             ,                       �                      ;                     �                      k                      �                      i                                           �                      P                     �                      d                      z                     U                     �  "                    __gmon_start__ _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable __tsan_init __tsan_func_entry printf __tsan_func_exit __tsan_read8 pthread_create __tsan_read4 __tsan_write4 pthread_mutex_init pthread_mutex_destroy pthread_mutex_lock pthread_mutex_unlock gettimeofday __tsan_write16 __tsan_read16 __tsan_read1 __tsan_write8 malloc free pthread_join usleep __stack_chk_fail __libc_start_main __cxa_finalize libtsan.so.2 libc.so.6 GLIBC_2.34 GLIBC_2.4 GLIBC_2.2.5                                    �         ���   �     ii   �     ui	   �      �\             Q      �\             �      �\             �      �\             (      �\             -/      �\             0      �\             �1      �\                    �\             �      `             `      �\                    �_                    �_                    �_                    �_                    �_                     _                    (_                    0_                    8_                    @_                    H_                    P_                    X_         	           `_         
           h_                    p_                    x_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                    �_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ��H��H��O  H��t��H���     �5�N  �%�N  @ ��h    �����f���h   �����f���h   �����f���h   ����f���h   ����f���h   ����f���h   ����f���h   �r���f���h   �b���f���h	   �R���f���h
   �B���f���h   �2���f���h   �"���f���h   ����f���h   ����f���h   �����f���h   �����f���h   �����f���h   �����f���h   ����f���h   ����f���h   ����f���h   ����f����%FN  fD  ���%fM  fD  ���%^M  fD  ���%VM  fD  ���%NM  fD  ���%FM  fD  ���%>M  fD  ���%6M  fD  ���%.M  fD  ���%&M  fD  ���%M  fD  ���%M  fD  ���%M  fD  ���%M  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ���%�L  fD  ��1�I��^H��H���PTE1�1�H�=!  ��L  �f.�     H�=�L  H��L  H9�tH�vL  H��t	���    ��    H�=�L  H�5�L  H)�H��H��?H��H�H��tH�=L  H��t��fD  ��    ���=EL   u+UH�=L   H��tH�=&L  �����d����L  ]� ��    ���w�����UH����E��}�/~�}�9�   ��    ]���UH����E��}� t�}�~�}��   ��    ]���UH��H��H�}�H�u�H�EH������H�E�H��H�y+  H�Ǹ    �h���H�}� tH�E�H���T  �   �+�����UH��H��H�}��u�U�H�EH���Y���H�E�H���   H�E��   H��H���  �}�u;H�E�H�   �    H���  H���E��H��H��*  H�Ǹ    �������   �}� u;H�E�H�   �    H����  H���E��H��H��*  H�Ǹ    �����   �}�u8H�E�H�   �    H���  H���E��H��H��*  H�Ǹ    �L����t�}�u8H�E�H�   �    H���W  H���E��H��H�i*  H�Ǹ    �����6H�E�H�   �    H���  H���E��H��H�E*  H�Ǹ    �����H�E�H���   H�E��   H��H���  �B��������UH������]���UH��SH���   �����H�� ���dH�%(   H�E�1�H�EH������H�� ��������H�� �����H���  ǅ���    �   H�� ���H�� H�������H��@��������Hc�H��H��H�H��H�H�� ���H�� H������H��@��������Hc�H��H��H�H��H�H��H��H��  �    H���W��������H�� ���H�������� ���9�����T���H�� ���H�� ���H�z0H��H�V  H�¾    ����H�� ���H��H�������ǅ8���   H�� ���H���9  �    �������H�U�dH+%(   t�����H�]�����UH������]���UH��H�� H�}�H�u��U�H�EH������H�}� tH�}� uH�E�H�8(  H��H�������}� u0H�E�    H���w�����tH�E�H�(  H��H��������   �}�u(H�E�H���������tH�E�H��'  H��H�������Z�}�u(H�E�H��������tH�E�H��'  H��H�������,�}�u&H�E�H���������tH�E�H��'  H��H���]������������UH��H�� H�}�H�u�H�U�M�H�EH������H�M�H�E��   H��H������H�E�H���-���H�E�U�H�M�H�E��   H��H���������������UH��SH��8H�}�H�u�H�U�H�EH������H�M�H�Eغ   H��H���B���H�E�H���+���H�Eȋ �E�H�M�H�Eغ   H��H�������]�������H�]�����UH������]���UH��SH��H�}�H�u�H�EH���
���H�E�H�H8H�E�   H��H������H�E�H��H������H�E�@�XH�E�H��H������H�E�XH�E�H��H���m���H�E�XH�E�H���Z���H�E� 9�|H�E�H�   �    H���I���H�E�H�H8H�E�   H��H���(���H�E�H�H8H�E�   H��H������H�E�H��H�������H�E�XH�E�H�������H�E� 9���   H�E�H�H`H�E�   H��H������H�E�H��H�������H�E�H�   H���b���H�M�H�E�H���   H���   H�AH�QH�E�H�H`H�E�   H��H���c���H�E�H�H8H�E�   H��H���G����!H�E�H�H8H�E�   H��H���)�������������H�]�����UH��SH��8H�}�H�EH���0���H�E�H�E�H�E�H�H8H�E�   H��H�������H�E�H��H������H�E�XH�E�H������H�E� 9�|H�E�H�H8H�E�   H��H�������!H�E�H�H8H�E�   H��H���p����x����E�    �E�    �s  H�E�H�H`H�E�   H��H���<���H�E�H�� H�������H�E�H�H �E�Hc�H��H��H�H��H�H���    H���+  H��H�E�H��H�������H�E�@H�H9������E�H�E�H��H������H�E�@���taH�E�H�� H���]���H�E�H�H �E�Hc�H��H��H�H��H�H�CH���q����[H�E�H��H���^���H�E�@9�|�   ��    E�H�E�H�H`H�E�   H��H���3����}� tDH�E�H�PH�E�H�p8H�E�    H�������E܍HH�E�   ��H�������    �   �E�H�E�H�������H�E� 9E��r���H�E�H������H�E� 9E�|(H�E�H�PH�E�H�p8H�E�    H�������    �.H�E�H�PH�E�H�H8H�E�H��H���������t�������    �����H��H�]�����UH��SH��(H�}؉u�H�EH���d����}� uH�E�H��H������H�E؋@H�H�E��R�}�uH�E�H��H�������H�E؋@H�H�E��-�}�uH�E�H��H�������H�E؋@H�H�E��H�E�    H�U�H�E�H��H����  ���3�����H�]�����UH��ATSH�� H�}�H�u�H�EH������H�E�H���\���H�EЋ ������  H�E�H��(H�������H�E�L�`(H�E�H���'���H�EЋH�E�H������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H�������H�E�H�PH�E�H�H8H�E�H��H���J�����uxH�E�H��(H���j���H�E�L�`(H�E�H������H�EЋH�E�H������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���W����   �  H�E�H���6���H�EЋH�Eغ   ��H�������H�E�H��(H�������H�E�H�X(H�E�H�������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H�������H�E�H�PH�E�H�H8H�E�H��H���3�������   H�E�H��(H���O���H�E�L�`(H�E�H���{���H�EЋH�E�H���i���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���<���H�E�H��(H�������H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H��������   �  H�E�H�������H�EЋH�Eغ   ��H���p����  H�E�H��(H���V���H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���Z���H�E�H�PH�E�H�H8H�E�H��H��������uaH�E�H��(H�������H�E�H�X(H�E�H������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H��������   �  H�E�H������H�EЋH�Eغ   ��H���k���H�E�H������H�E؋ ��uaH�E�H��(H���?���H�E�H�X(H�E�H���k���H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���C����   �  H�E�H��(H�������H�E�L�`(H�E�H���
���H�EЋH�E�H�������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H�������H�E�H�PH�E�H�H8H�E�H��H���-�������   H�E�H��(H���I���H�E�H�X(H�E�H���u���H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H���M���H�E�H��(H�������H�E�L�`(H�E�H������H�EЋH�E�H������H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H��������   �  H�E�H������H�EЋH�Eغ   ��H���j���H�E�H�H`H�Eغ   H��H������H�E�H���    H������H�E�H��H���d���H�EЋ@�XH�E�H��H�������H�EЉXH�E�H�H`H�Eغ   H��H���2���H�E�H������H�EЋH�Eغ    ��H�������H�Eؾ    H�������E�H�E�H��(H������H�E�H�X(H�E�H�������H�EЋ Hc�H��H��H�H��H��(H�H�Eغ   H��H������H�E�H��(H���G���H�E�L�`(H�E�H���s���H�EЋH�E�H���a���H�E؋0�ؙ���щ�Hc�H��H��H�H��I�H�Eغ   H��H���4����]��������H�� [A\]���UH��SH��(H�}�H�EH���9���H�E�H�E�H�E�H�� H������H�E�H�@ H�E�H�U�H�E�H��H��������   H�U�H�E�H��H��������t
�    �   H�E�H������H�E��H�E�   ��H���<���H�E�   H���"�����t�    �mH�E�H���O���H�E��H�E�   ��H�������H�E�   H���������t�    �,H�E�H�PH�E�H�H8H�E�H��H���������6����    ����H��H�]�����UH�������]���UH��SH��(H�}�H�u�H�EH�������H�}� tH�E�H������H�E�� ��uH�E�H�W  H��H��������H�E�H�E�H���i���H�E�� ��t!H�E�H���R���H�E�� ����������u�H�E�H���1���H�E�� ��t/H�E�H������H�E�� <-uH�E�H��  H��H���f����3H�E�H�������H�E�� ��tH�E�H�������H�E�� <+uH�E�H�E�    �\H�U�H��H��H�H�H��H�E�H������H�E�� ����0H�H�H�E�   �H9E�|H�E�H�I  H��H�������H�E�H�E�H���R���H�E�� ��t%H�E�H���;���H�E�� �����C������h����   �H9E�|H�E�H��  H��H���n���H�]�����H��H�]�����UH��ATSH�� H�}�H�EH�������E�    �  H�E�H�� H���t���H�E�H�H �E�Hc�H��H��H�H��H��E�D�`H��H������D�#H�E�H�� H���/���H�E�H�H �E�Hc�H��H��H�H��H�H�C H�������H�E�H�C H�E�H�� H�������H�E�H�H �E�Hc�H��H��H�H��H�H�CH�������C    H�E�H��(H������H�E�H�H(�E�Hc�H��H��H�H��H�H�Eغ    H��H��������E�H�E�H������H�E؋ 9E�������1����H�� [A\]���UH��ATSH��0H�}؉u�H�U�H�EH������H�E�H��H�������H�E��@    �}�~�}�~H�  H�ƿ    �����E�   �b�E�H�H��    H�E�H�H�������H�H�ƿ    ����H�E�X�A��Hc�H��    H�E�H�H���Z���H�E�Hc�D�$��E��E�;E�|��}�uH�E�H��H���-���H�E��@����H�E�H��H������H�E؋XH�E�H��H���k���H�E؋@)�H�E�H��H���R���H�E؋P��)Љ��������H�E�H��H������H�E؉XH�E�H��H������H�E��@    H�E�H�������H�E؋ Hc�H��H��H�H��H���/���H��H�E�H�� H���L���H�E�H�X H�E�H������H�E؋ Hc�H��H��H�H��H�������H��H�E�H��(H������H�E�H�X(H�E�H������H�E�H�H8H�Eغ    H��H���a���H�E�H�H`H�Eغ    H��H���E���H�E�H���   H�Eغ    H��H���&���H�E�H��H������H�E��@   �����H��0[A\]���UH��H�� H�}�H�EH������H�E�H���  �E�    �GH�E�H��(H���p���H�E�H�H(�E�Hc�H��H��H�H��H�H�E�   H��H�������E�H�E�H���m���H�E� 9E�|�H�E�H�H`H�E�   H��H���Q���H�E�H���   H�E�   H��H���2���H�E�H�H8H�E�   H��H������H�E�H�� H������H�E�H�@ H�������H�E�H��(H������H�E�H�@(H�������f��������UH�������]���UH��SH��(H�}�H�EH��������E�    H�E�H��H������H�E؋@����   �QH�E�H�� H������H�E�H�H �E�Hc�H��H��H�H��H�H�CH�������H�C�    H���A����E�H�E�H������H�E؋ 9E�|�H�E�H��0H������H�E�H�@0�    H�������|����H�]�����UH�������]���UH��SH��HH�}�H�u�dH�%(   H�E�1�H�EH�������H�}� uH�Eо    H������H�E�H�E�H�E�H���*���H�E�H�H�E�H������H�E�H� H)�H��H�U�H�E�H��H�������H�E�H�XH�E�H��H�������H�E�H�@H)�H��H�U�H�E�Hi��  H�M�H���S㥛� H��H��H��H��H��?H)�H��v���H��H�U�dH+%(   t����H�]�����UH��SH��8H�}�H�u�dH�%(   H�E�1�H�EH�������H�Eо    H�������4H�E�H�PH�E�H�H8H�E�H��H���������u�   �&�2   ����H�Eо    H���k���H9E���    �������H�U�dH+%(   t�����H�]�����UH������]�  ��H��H���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         error: %s
 %ld %d has taken a fork
 %ld %d is eating
 %ld %d is sleeping
 %ld %d is thinking
 %ld %d died
 mtx_op error mtx_init error mtx_destroy error
 mtx_lock error
 mtx_unlock error
 args error args error: >INT_MAX ;     @���8  ����`  ����x  @���   )����  P����  }����  �����  q���  ����0  ���T  ���x  (����  �����  ����  %���   ���$  ����H  ����l  �����  0����  ?����  !����  ����   ���D  M���d  \����  ;����  J����  W����  ���             zR x�        ���&    D    $   4    ����   FJw� ?9*3$"       \   X���              t   P���p             �   ����'    E�C^      �   ����-    E�Cd      �   ����X    E�C      �   �����   E�C�       ]���    E�CF           ,  H����   E�CH�{      P  ����    E�CF          t  ����   E�C    �  ����t    E�Ck      �  ����z    E�CE�l       �  2���    E�CF           �  ����   E�CE��         �����   E�CE��      D  |����    E�CE��       h  ���u   E�CG��e    �  b���6   E�CE�(      �  t���    E�CF           �  _����   E�CE��      �  ���h   E�CG��X      a����   E�CG���   @  ����.   E�C%     `  ����    E�CF           �  �����    E�CE��       �  ����    E�CF           �  r���   E�CE��       �  [����    E�CE��        ����    E�CF                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Q      �      �      (      -/      0      �1             �             �             �                           �1              �\      !                     �\             @              �\                    ���o    �             �             �      
       �                                          _             (                           `
             �             �      	                            ���o          ���o    �      ���o           ���o    d      ���o    
                                                                                       �\                      0      @      P      `      p      �      �      �      �      �      �      �      �                          0      @      P      `      p      �      �                                                      `      GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0                              ,    �       	      W                      ,    �       `      �                      ,           �      
                      ,    �                                   ,    �       (                            ,    �       </      �                       ,    �       *0      �                      �       	\   !L           
�  ��   Tid �<   *   u32 ��   �  �7   ����   �7    �  �<   f   �  �s    �  ��  	   ��   u64 ��   H   G   X   x   �  ��   �    '   ��   �    .   ��   �    �  �	  �    U   �  �        �6  �   �    �  �I  �    s  �\  �    6   �o  �    �  ��  �       ��  �    �  ��  �    C   �   >   �   �  �  	�\      �  {  !$ �     N  5  �   	      W      H   C   H      !    
  int �    �_   n  �_   �   	  �   �   �    �     f    3  r    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (y  �  X    c  5   S  X   =  5   �   X   k  "	Q     #	Q   �  $�    �  .   (C	�  	�  E  	  F�  	s  G_    �   �  .   ' S  H�  [  y  F   �  �  !�  �  �>�  �  @]   �  AX   �  BX   ;  Cm   �  Dr  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   op 5   $�  CRT  DST LK ULK  �  *�  �  5   ,�  EAT  
  
M  
�  DIE  4  3�  �  (5L  id 7X      8X   6  9�    :�  �  ;L    �    <�  X   m  .    Q  �  �  W_   �  �  �   �  �  R�  L  r  �   �  ��  X    {  S�  L   �  	kX   �  �    |  �      �      �3  �  L  �hidx 'X   �d�  5�  �` B  ]      X       �l  �  L  �hmsg '~   �` �  X   0      -       ��  c �   �l �  X   	      '       �c �   �l  W   �  N  �  �   `      �      i  C   H   <      !    
  int �    �f   n  �f   �   	  �    �     m    3  y    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (v  �  _    c  5   S  _   =  5   �   _   k  "	X     #	X   �  $�    �  .   �  88�    :�  s  ;f    	�   �  
.   7 �  >�  �  (C	�  �  E     F�  s  Gf    	�     
.   ' S  H�  �   [  v  F     �  !7  �  �>�  �  @2   �  A_   �  B_   ;  CB   �  DG  (?  E  0d  F  8�  G  `I  H  ��  I�  � �  "�   �  (5!  id 7_      8_   6  9    :�  �  ;!    +    <�  	_   B  
.    &    {  S\  !   �  X<   r  <    �  Y<   �  <    �  �_   �  �  �  �  >    v  �  �  �  �  <   �  <    �  T�  !  _      �  _   `      �      ��  _   ��}�    ��}�  
+  ��~�      �       i _   ��~   �   G  N    �   �      
      2  C   H      !    
  int �    �_   n  �_   �   	  �   �   .    �    �     f    3  r    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (  �  X    c  5   S  X   =  5   �   X   k  "	Q     #	Q   �  $�    �  .    �    "�   s  #X    =  $�  �  (C�  �  E	    F�  s  G_    �   �  .   ' S  H�  [    F   �  �  !#  �  �>�  �  @S   �  AX   �  BX   ;  Cc   �  Dh  (?  E�  0d  F  8�  G  `I  H  ��  I�  � �  "�   op 5   $�  	CRT  	DST 	LK 	ULK  �  *�  �  (5B  id 7X      8X   6  9�    :�  �  ;B        <�  X   c  .    G    
(  CX   �  �   �  
  X   �  �   
Q  X   �  �   
  X   �  �  �   �  B  Q�  B  ~    r  X   |      z       �D  �  B  �Hmtx )h  �@val 3D  ��res X   �\ X   g        t       ��  �  B  �hmtx *h  �`val 4D  �X}  =X   �T �  �            ��  B  �hmtx &h  �`op 0�  �\  �   �  N    �               :  C   H   <      !    
  int �    �f   n  �f   	  �  	  �     m    3  y    >   	'  3�   �  5#�    �  6#�    �   "  7�   	�  (q  �  _    c  5   S  _   =  5   �   _   k  "	X     #	X   �  $�    �  .   (C	�  �  E�     F�  s  Gf    �   �  .   ' S  H}  [  q  F   �  �  !�  	�  �>x  �  @U   �  A_   �  B_   ;  Ce   �  Dj  (?  E�  0d  F�  8�  G�  `I  H�  ��  Ix  � �  "�   op 5   $�  CRT  DST LK ULK  �  *�  �  5   ,�  EAT    M  �  DIE  4  3�  	�  (5D  id 7_      8_   6  9�    :x  �  ;D    �    <�  _   e  .    I  �  
�  M_   �  D  f    
r  V_   �  D  j  �   _   |  Z�  D  _   �   g  U�  D  j  �  _    
�  Wf          x  
�  C_   #  (  >    �   #  �  RG  D  j  �   �  �<   �&      6      ��  arg �<   �H�  �e  �P�  �D  �X �  W_   e      u      ��  �  WD  �H�  W,e  �@�  Y_   �\ �  H_   �      �       �(  �  HD  �H�  H/�  �D�  Jf   �X �  <   �      �      ��  arg <   ���  D  �X�  _   �L   �  +_   �Tfed ,_   �P  �        �      ��  'D  �X�  7e  �P  �   �  N  E  �   (            �  �  �:   C   H      !    
  int �    �m   n  �m   �   	  �    �     t    3  �    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (}  �  f    c  A   S  f   =  A   �   f   k  "	_     #	_   �  $�    �  :   (C	�  	�  E  	  F�  	s  Gm    �   �  :   ' S  H�  �   [  }  F   �  �  !�  �  �>�  �  @)   �  Af   �  Bf   ;  C9   �  D>  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   op A   $�  CRT  DST LK ULK  �  *�  �  (5  id 7f      8f   6  9�    :�  �  ;    �    <�  f   9  :      �  �  	�V  H    
�  Of     �  	�H   }  .    
�  R�    >  �   �  Lf   �  �    �  Nf   �  �    
B  Q�    �    {  C�-      .      �  �  C  �X  Ef   �l �  *i+      �      �a  �  *  �H�  *'f   �D�  *4�  ��!  ,f   �\   *      h      ��  �  !  �H	  f   �\ �  m   (      �      ��    �Hstr +�   �@res m   �X  N   \	  
N    �   </      �       �  C   H      !    
  int �    �a   n  �a   	  �    �     h    3  t    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (l  �  Z    c  5   S  Z   =  5   �   Z   k  "	S     #	S   �  $�    �  .   (C	�  �  E�     F�  s  Ga    �   �  .   ' S  Hx  [  l  F   �  �  !�  �  �>s  �  @�   �  AZ   �  BZ   ;  C�   �  D�  (?  E�  0d  F�  8�  G�  `I  H�  ��  Is  � �  "�   �  (5�  id 7Z      8Z   6  9�    :s  �  ;�    �    <  Z   �  .    �  �  '  �Z     	l  	   <   �  </      �       ��  �  �H4  Z   �\      c
  N  �  �   *0      �      �	  C   H   	<      !    
  int �    �f   L  �5   n  �f   	  �    �     m    3  �    >   '  3�   �  5#�    �  6#�    �   "  7�   �  (}  �  _    c  5   S  _   =  5   �   _   k  "	X     #	X   �  $�    �  .   (C	�  �  E    F�  s  Gf    
�   �  .   ' S  H�  [  }  F   �  �  !�  �  �>�  �  @�   �  A_   �  B_   ;  C�   �  D  (?  E�  0d  F�  8�  G�  `I  H�  ��  I�  � �  "�   �  (5�  id 7_      8_   6  9�    :�  �  ;�    �    <�  
_   �  .    �  �  =  �_      y    r  V_   @  �    @   _   �  	C_   `  e  >    �   	`  �  _   71      �       ��  �  �  ��ms (f   ��t �  �@ �  f   *0            �  beg   ��end +  ��tmp �  �@E  f   ��D  f   �� �   : :!;9!  9:!;9!  $ >!  4 G  & I   :!;9I   :!;9I   :!;9!  	%  
9:;9   :;9I  4 :;9I<l  4 :;9I<l   :;9I  4 :;9I<     4 :;9I?   I  . ?:;9<    :;9I8   :;9I  $ >   I   !I  (   :;9   :!;9I  	 :!;9I  
(    :!;9I  I  ! I/  .?:!;9!'<  .?:!;9!'@|  %  $ >  & I  :;9  >I:;9  >I:;9   :;9I8  .?:;9'I<  .?:;9'�<  .?:;9'I<     .?:;9'I@z  .?:;9'I@z    :;9I8   :;9I   I  $ >   !I  :;9   :!;9I  7 I  	I  
! I/  .?:;9'I<  .?:!;9!'<   :!;!9I  %     $ >  :;9  & I  :;9   :;9I8  'I  .?:;9'I@|  4 :;9I    4 :;9I    :;9I8   :;9I  $ >   !I   I   :!;9I  :;9   :!;9I  	(   
.?:!;9!'I<   :!;9I  I  ! I/  :!;9!	  %  $ >  & I  >I:;9   :;9I8  .?:;9'<  .?:;9'I@|  4 :;9I  .?:;9'@|  .?:;9'@|    :;9I8   I   :;9I  $ >   !I  4 :!;9I  (    :!;9I  	:;9  
.?:;9'I<   :!;9I  (   .?:!;9!'<  7 I  I  ! I/  .?:!;9!'I@|   :!;9I  .:!;9!'I@|  %     $ >  :;9  >I:;9  >I:;9   :;9I8  U  4 :;9I  .:;9'@|    :;9I8   :;9I  $ >   I   !I   :!;9I  :;9  (   	 :!;9I  
.?:!;9!'<  4 :!;9!I  I  ! I/  .?:!;9!'I<  .?:!;9!'@|  %     $ >  :;9  >I:;9   :;9I8  .?:;9'<  .?:;9'I<  .:;9'@|  .:;9'I@|   :;9I  4 :;9I    :;9I8  $ >   :;9I  :;9   !I   :!;9I  I  ! I/  	 I  
%     $ >  :;9   :;9I8  .?:;9'I<  .?:;9'@|   :;9I  4 :;9I    :;9I8   :;9I  $ >   !I   I  :;9   :!;9I   :!;9I  	7 I  
I  ! I/  .?:;9'I<  .?:!;9'I@|  4 :!;9!
I  4 :!;9!I  %     $ >  :;9   :;9I8  .?:;9'I<   :;9I   D     <   �             �   n   �   �   n       ^   �      �   ?  b  �  
5   5   �  �  �  �  �  �   �  �   		      � f fX .Y1� f f fX .Y1<��u��X��g �
�g �
�g �
�g �� ��$< �     Y   �      �   ?  b  �  	�   �   �  �  �  �  �  �   �   	`      ����FYM�@fJ��J+ e! t J�)�	���     Y   �      �   ?  b  �  	      �  �  �  �  �  �   �   	�      f� tuY f K
� f �K
u f �K
u f �K�?��uK�>��uK	u�f �    Y   �      �   ?  b    	      �  �  �  �  �  �   >   	      J�$�"#.�K���$$.��$8��0w��w��$$.�L�0z�Xu	uZ $(�fS �D 	 f�&�. �6 �? �U .& � JX . X=�h��� t����Z�v �hJX	"��<���
���
���
��if��<�$<7 )���u ��%<8 *���u�)$< u ��%<8 *����%< u�.$< u ��%< u�%��%< u"$<7 )���u ��%< �%<8 *���u����K�����#< �#<6 (���	u����=/Z .K�� K�� K	wt> �	��� 8    b   �      �   M  ?  b  �  
E   E   v  �  �  �  �  �  �   �   	(      J� t .KY/	W. J . �L. J .Ku
. J .KY�0<XXu�Y	S. J . ���	Y�h.�u��#t�/��u��g�<	gz��ޡ�?/ fg=u/0J � f	(G��#�7f)�K�=�RJ.g%g �$= ����'u���	�u��<
g�]��$����< �     Y   �      �   ?  b  �  	      �  �  �  �  �  �   �   	</      ���	�����!��"t �     b   �      �   ?  b  �    
�   �   �  �  �  �  �  �   �  >   	*0      J�v�.	�!t
��"�"��J�0 �Ku	�! 	l�� __hwasan tid_t __interception kMainTid __dsan __dfsan __ubsan long long unsigned int __msan GNU C++14 13.3.0 -mshstk -mtune=generic -march=x86-64 -g -O2 -std=gnu++14 -fPIC -fno-builtin -fno-exceptions -fno-rtti -funwind-tables -fvisibility=hidden -fcf-protection=full -fno-omit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection __scudo __tsan_init __sanitizer __lsan __asan __memprof __local_tsan_preinit kInvalidStackID kInvalidTid __tsan uptr __xray t_table __data FORK tv_sec short int t_philo meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev start_stamp __next t_op __kind long long int t_timer props printf forks mtx_op hb_mtx exit barier unsigned char meals __size SLEEP short unsigned int t_action __nusers t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s __time_t __elision timeval __pthread_list_t tv_usec philos exit_error THINK __owner t_thread table_mtx __suseconds_t print_status get_time_diff pthread_t __list is_num main pthread_create hb_routine table_create argc argv philo_routine pthread_attr_t pthread_mutex_init pthread_mutex_lock pthread_mutex_unlock pthread_mutexattr_t pthread_mutex_destroy mtx_setval mtx_getval n_val dead ph_eat a_type philo_wait_start ph_action act_res gettimeofday time precise_sleep c_philo size_t malloc ft_atoi free threads_wait c_idx init_setup c_fork c_arg pthread_join c_thread usleep us_diff __useconds_t /build/gcc-13-fG75Ri/gcc-13-13.3.0/build/x86_64-linux-gnu/libsanitizer/tsan ../../../../src/libsanitizer/tsan/tsan_preinit.cpp ../../../../src/libsanitizer/tsan ../../../../src/libsanitizer/sanitizer_common sanitizer_internal_defs.h tsan_interface.h /home/borov/projects/42_folder/circle_3/philosophers/philo helpers.c /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h stdio.h main.c pthread.h mtx_op.c p_routine.c /usr/include/x86_64-linux-gnu/sys time.h table.c /usr/lib/gcc/x86_64-linux-gnu/13/include stddef.h threads.c timer.c unistd.h          ��	�	�	                                  ��                	     �                  ��                     P                    �              3     �              I     `             U     �\              |                    �     �\              �    ��                �    ��                �     Q             �    ��                �     �             �    ��                �     �             �    ��                �           �      �     �      �           e      u      �     (                ��                    (      �          *      h      �     -/             *   ��                �     0             4   ��                �     �1                 ��                <    F                   ��                J     �@              ]    _              s    �\              �      `              |                     �           &       �    �&      6      �                     �                      �    </      �       �                     �          t       �                     �                     �   �1              �                     	                                          $                     6                     =    �      �      J                     ]                      y    0      -       �     @             �    71      �       �                      �     `              �    �            �    �      �      �                     �  "                                                             *                     ;   �\             P    *0            ^                     m   `              y   `              �    i+      �      �    ]      X       �    	      '       �    `              �                     �                     �    �-      .      �    |      z       �    `              �                                                                   `              &                     -                     J    `      �                        O                      Scrt1.o __abi_tag crtstuff.c deregister_tm_clones __do_global_dtors_aux completed.0 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry tsan_preinit.cpp helpers.c _sub_I_00099_0 main.c mtx_op.c p_routine.c philo_wait_start ph_action ph_eat table.c ft_atoi init_setup threads.c timer.c __FRAME_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ _DYNAMIC __tsan_read8 philo_routine usleep __gmon_start__ threads_wait pthread_mutex_init mtx_setval exit@GLIBC_2.2.5 __tsan_read1 _fini gettimeofday __tsan_init __tsan_write16 __tsan_func_entry malloc print_status pthread_mutex_lock _ITM_deregisterTMCloneTable is_whitespace _IO_stdin_used precise_sleep _ITM_registerTMCloneTable __data_start mtx_op hb_routine pthread_mutex_destroy __cxa_finalize@GLIBC_2.2.5 __tsan_write8 __tsan_write4 __tsan_func_exit __local_tsan_preinit get_time_diff pthread_create __TMC_END__ __dso_handle table_create exit_error is_num __bss_start __stack_chk_fail@GLIBC_2.4 __tsan_read16 destroy_table mtx_getval _end pthread_mutex_unlock free __tsan_read4 _edata printf __libc_start_main@GLIBC_2.34 main pthread_join  .symtab .strtab .shstrtab .interp .note.gnu.property .note.gnu.build-id .note.ABI-tag .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rela.dyn .rela.plt .init .plt.got .plt.sec .text .fini .rodata .eh_frame_hdr .eh_frame .preinit_array .init_array .fini_array .dynamic .data .bss .comment .debug_aranges .debug_info .debug_abbrev .debug_line .debug_str .debug_line_str .debug_rnglists                                                                                                                           #             8      8      0                              6             h      h      $                              I             �      �                                     W   ���o       �      �      $                             a             �      �      �                          i             �      �      �                             q   ���o       d      d      :                            ~   ���o       �      �      @                            �             �      �      �                           �      B       `
      `
      (                          �                                                         �                           �                            �             �      �                                   �             �      �      p                            �                           �                             �             �1      �1                                    �              @       @      �                              �             �@      �@                                   �             �A      �A      4                             �             �\      �L                                   �             �\      �L      @                                          �\      �L                                               �\      �L                                  �             _      O      �                                          `       P                                                `      P                                          0               P      +                             )                     ;P      p                             8                     �Q      "                             D                     �s      �                             R                     x      �
                             ^     0               ��      Y                            i     0               R�      �                            y                     �                                                          �      �      %   %                 	                      ��      \                                                   �      �                             philo.h
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
	t_timer		meal_stamp;
	t_table		*table;
}	t_philo;

typedef struct	table
{
	int			props[6];
	int			t_status;
	int			barier;
	t_philo		*philos;
	t_mutex		*forks;
	t_thread	heartbeat;
	t_mutex		table_mtx;
	t_mutex		hb_mtx;
	t_mutex		print_mtx;
	t_timer		start_stamp;
}	t_table;

int		is_num(char c);
int	precise_sleep(t_table *table, long ms);
int		is_whitespace(char c);
void	threads_wait(t_table *table);
void	destroy_table(t_table *table);
void	exit_error(t_table *table, char *msg);
void	mtx_op(t_table *table, t_mutex *mtx, t_op op);
void	destroy_table(t_table *table);
void	table_create(t_table *table, int argc, char **argv);
void	mtx_setval(t_table *table, t_mutex *mtx, int *val, int n_val);
int	mtx_getval(t_table *table, t_mutex *mtx, int *val);
long	get_time_diff(t_timer *beg, t_timer *end);
void	*hb_routine(void *arg);
void	*philo_routine(void *arg);
void	print_status(t_table *table, int idx, t_action action);

#endif
table.c
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
table.o
ELF          >                    �+          @     @   ��UH��SH��(H�}�H�u�H�EH���    H�}� tH�E�H���    H�E�� ��uH�E�H�    H��H���    �H�E�H�E�H���    H�E�� ��t!H�E�H���    H�E�� �����    ��u�H�E�H���    H�E�� ��t/H�E�H���    H�E�� <-uH�E�H�    H��H���    �3H�E�H���    H�E�� ��tH�E�H���    H�E�� <+uH�E�H�E�    �\H�U�H��H��H�H�H��H�E�H���    H�E�� ����0H�H�H�E�   �H9E�|H�E�H�    H��H���    H�E�H�E�H���    H�E�� ��t%H�E�H���    H�E�� �����    ���h����   �H9E�|H�E�H�    H��H���    H�]��    H��H�]�����UH��ATSH�� H�}�H�EH���    �E�    �  H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H��E�D�`H��H���    D�#H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�C H���    H�E�H�C H�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    �C    H�E�H��(H���    H�E�H�H(�E�Hc�H��H��H�H��H�H�Eغ    H��H���    �E�H�E�H���    H�E؋ 9E�������    �H�� [A\]���UH��ATSH��0H�}؉u�H�U�H�EH���    H�E�H��H���    H�E��@    �}�~�}�~H�    H�ƿ    �    �E�   �b�E�H�H��    H�E�H�H���    H�H�ƿ    ����H�E�X�A��Hc�H��    H�E�H�H���    H�E�Hc�D�$��E��E�;E�|��}�uH�E�H��H���    H�E��@����H�E�H��H���    H�E؋XH�E�H��H���    H�E؋@)�H�E�H��H���    H�E؋P��)Љ��������H�E�H��H���    H�E؉XH�E�H��H���    H�E��@    H�E�H���    H�E؋ Hc�H��H��H�H��H���    H��H�E�H�� H���    H�E�H�X H�E�H���    H�E؋ Hc�H��H��H�H��H���    H��H�E�H��(H���    H�E�H�X(H�E�H������H�E�H�H8H�Eغ    H��H���    H�E�H�H`H�Eغ    H��H���    H�E�H���   H�Eغ    H��H���    H�E�H��H���    H�E��@   �    �H��0[A\]���UH��H�� H�}�H�EH���    H�E�H���    �E�    �GH�E�H��(H���    H�E�H�H(�E�Hc�H��H��H�H��H�H�E�   H��H���    �E�H�E�H���    H�E� 9E�|�H�E�H�H`H�E�   H��H���    H�E�H���   H�E�   H��H���    H�E�H�H8H�E�   H��H���    H�E�H�� H���    H�E�H�@ H���    H�E�H��(H���    H�E�H�@(H���    �    �����UH���    ]�args error args error: >INT_MAX            �                                         �:                           int         �m       �m   �               �       t        �            3�       5#�        6#�    �       7�       (}      f        A       f       A        f       "	_       #	_       $�        :   (C	�  	    E  	    F�  	    Gm    �   �  :   '     H�  �       }       �      !�      �>�      @)       Af       Bf       C9       D>  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�   op A   $�  CRT  DST LK ULK      *�      (5  id 7f        8f       9�      :�      ;    �      <�  f   9  :      �      	�V  H    
    Of         	�H   }  .    
    R�    >  �       Lf   �  �        Nf   �  �    
    Q�    �        C        .      �      C  �X    Ef   �l     *        �      �a      *  �H    *'f   �D    *4�  ��    ,f   �\             h      ��      !  �H    f   �\     m           �      �      �Hstr +�   �@res m   �X   :;9I8   :;9I  $ >   I   !I   :!;9I  :;9  (   	 :!;9I  
.?:!;9!'<  4 :!;9!I  I  ! I/  .?:!;9!'I<  .?:!;9!'@|  %     $ >  :;9  >I:;9   :;9I8  .?:;9'<  .?:;9'I<  .:;9'@|  .:;9'I@|   :;9I  4 :;9I   ,                                           8    b   �                          
                                            	        J� t .KY/	W. J . �L. J .Ku
. J .KY�0<XXu�Y	S. J . ���	Y�h.�u��#t�/��u��g�<	gz��ޡ�?/ fg=u/0J � f	(G��#�7f)�K�=�RJ.g%g �$= ����'u���	�u��<
g�]��$����< t_table __data tv_sec short int size_t malloc meal_stamp __pthread_internal_list ft_atoi heartbeat print_mtx pthread_mutex_t __count __spins __align destroy_table is_whitespace __prev table free start_stamp __next __size t_op __kind long long int threads_wait t_timer long int props t_status philo c_idx forks mtx_op hb_mtx unsigned char barier table_create meals argc signed char long long unsigned int unsigned int argv thread short unsigned int char __nusers t_philo t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos exit_error init_setup __owner c_fork t_thread table_mtx __suseconds_t pthread_t __list is_num c_arg /home/borov/projects/42_folder/circle_3/philosophers/philo table.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/lib/gcc/x86_64-linux-gnu/13/include /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include table.c table.c stddef.h types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h stdlib.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0               GNU   �                 zR x�             �   E�CE��      @       h   E�CG��X    d       �   E�CG���   �       .   E�C%     �           E�CF                                   ��                                                            	             �           �      h                                                   
                                                                                   +                      =                      J                      U                      c                      j                      {                      �                      �                      �                      �                      �     J      �      �                      �     �      .      �                      �                      �                       table.c ft_atoi init_setup _sub_I_00099_0 __tsan_func_entry __tsan_read1 exit_error is_whitespace is_num __tsan_func_exit __tsan_read8 __tsan_write4 __tsan_write8 mtx_op __tsan_read4 table_create malloc destroy_table threads_wait free __tsan_init              ��������0             ��������F             ��������Q             ��������d             ��������{             ���������             ���������             ���������             ���������             ���������             ���������             ���������             ��������3            ��������_                   j            ��������{            ���������            ���������            ���������            ���������            ���������            ���������            ��������            ��������K            ��������^            ���������            ���������            ���������            ���������            ��������            ��������(            ��������<            ��������l            ��������|            ���������            ���������            ���������            ��������            ��������0            ��������K            ��������b            ��������{            ���������            ���������            ���������            ���������            ��������            ��������            ��������4            ��������G            ��������w            ���������            ���������            ���������            ���������            ���������            ��������            ��������            ��������P            ��������`            ���������            ���������            ���������            ���������            ���������            ���������            ��������            ��������            ��������            ��������                           
                     
   
   �             
      ;              
                                   *       
   	           /       
   
           =       
   
   �      D       
   
   �      M       
   
   D      T       
   
   �      [       
   
   q      b       
   
          p       
   
         u       
   
   �      �       
   
         �       
   
   �      �       
   
   �       �       
   
   �      �       
   
          �       
   
   �      �       
   
   }      �       
   
   9       �       
   
   �       �       
   
   �       �       
   
   �            
   
   �            
   
   ~      "      
   
   }       /      
   
   �      <      
   
   �      I      
   
   �       V      
   
   �       c      
   
   �      p      
   
   4      ~      
   
   *      �      
   
          �      
   
   �       �      
   
   �       �      
   
   m       �      
   
   	      �      
   
   �      �      
   
           �      
   
   �             
   
               
   
         !      
   
   R      .      
   
   �      ;      
   
   0      H      
   
   Y       U      
   
         b      
   
   =      o      
   
   c       |      
   
   �       �      
   
         �      
   
   �       �      
   
   $      �      
   
   f      �      
   
   �      �      
   
   .             
   
   �             
   
   �      D      
   
   �       W      
   
   �       g      
   
   '       ~      
   
   6      �      
   
   ;      �      
   
   �       �      
   
   �      �      
   
   �       �            �      �      
   
   �       �      
   
               
   
   Y                  J      )      
   
   �       7      
   
   l      E      
   
   �      T      
   
   B      b      
   
   �      i            �      �      
   
   �       �      
   
   *      �      
   
   Q       �                    �      
   
   �              
                                   "       
      C       &       
      ~       *       
      �       .       
      �       2       
      �       <       
             A       
            F       
            K       
            P       
      !      U       
      2      Z       
      H      _       
      W      d       
      f      i       
      n      s                                           D             �      h             J      �             �      �                    .symtab .strtab .shstrtab .rela.text .data .bss .rodata .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @                                          @               (      �                          &                     ]                                     ,                     ]                                     1                     ]                                     >                     �                                   9      @               �                                  U                      �      �                             P      @               �                                 a                      o      �                             t                      4      0                              o      @               �(      0                           �                      d      <                             �      @               )      �                          �      0               �      H                            �      0               �      w                            �      0               _      ,                             �                      �                                     �                     �                                     �                     �      �                              �      @               �*      x                                                 x      �                          	                      0      �                                                    +      �                              threads.c
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
threads.o
ELF          >                    �          @     @   ��UH��SH��(H�}�H�EH���    �E�    H�E�H��H���    H�E؋@����   �QH�E�H�� H���    H�E�H�H �E�Hc�H��H��H�H��H�H�CH���    H�C�    H���    �E�H�E�H���    H�E؋ 9E�|�H�E�H��0H���    H�E�H�@0�    H���    �    �H�]�����UH���    ]�          N       
                    �                                   int         �a       �a               �       h        t            3�       5#�        6#�    �       7�       (l      Z        5       Z       5        Z       "	S       #	S       $�        .   (C	�      E�       F�      Ga    �   �  .   '     Hx      l       �      !�      �>s      @�       AZ       BZ       C�       D�  (    E�  0    F�  8    G�  `    H�  �    Is  �     "�       (5�  id 7Z        8Z       9�      :s      ;�    �      <  Z   �  .    �  �      �Z     	l  	   <               �       �    �  �H    Z   �\   :;9I8  $ >   :;9I  :;9   !I   :!;9I  I  ! I/  	 I  
%     $ >  :;9   :;9I8  .?:;9'I<  .?:;9'@|   :;9I  4 :;9I   ,                     �                       �     Y   �                      	                                        	        ���	�����!��"t print_mtx t_table t_philo philos t_status __data t_thread short int threads_wait forks __suseconds_t __owner __kind pthread_mutex_t __lock pthread_join pthread_t t_mutex unsigned char __size __pthread_mutex_s c_thread meal_stamp short unsigned int thread table __time_t meals __nusers long unsigned int GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __pthread_internal_list __elision barier philo timeval unsigned int long long unsigned int __spins tv_usec start_stamp tv_sec long long int char __align __count heartbeat __prev __pthread_list_t table_mtx long int __list props __next signed char hb_mtx t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo threads.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include threads.c threads.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h pthread.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0            GNU   �                 zR x�             �    E�CE��       @           E�CF                                   ��                                           �                                         	                                                                                                �       '                      9                      F                      S                      `                      q                       threads.c _sub_I_00099_0 threads_wait __tsan_func_entry __tsan_read4 __tsan_read8 pthread_join __tsan_func_exit __tsan_init              
   ��������0             ��������R             ��������~             ���������             ���������             ���������             ���������             ���������             ���������             ��������              �              
                     
      /             
      ;              
                                   *       
              1       
            8       
            A       
      �       H       
      �       O       
      �      V       
      :       d       
      �      i       
            u       
      W       �       
      [      �       
      M      �       
      �      �       
      F      �       
      2      �       
            �       
      �      �       
      z      �       
      �      �       
      �      �       
      �             
      �             
      h            
      e       +      
            8      
      m       E      
      *      R      
      �      _      
      �      m      
      �       �      
      *       �      
      �       �      
      `      �      
      t       �      
      1       �      
      �       �      
      
       �      
      �       �      
      �      �      
      !             
      �            
             %      
      Q       2      
      p      ?      
      �      L      
      �      Y      
              f      
      :      t      
      �      �      
      �      �      
            �      
      �       �      
      �       �      
      �       �      
             �      
      �             
      D                            3      
      �       B      
      �              
                                   "       
      E       &       
      �       *       
      �       .       
      �       8       
      �       =       
      �       B       
      �       G       
      �       L       
            Q       
            V       
      +      [       
      :      `       
      B      j                                           D             �        .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                    @               0      �                           &                     .                                     ,                     .                                     6                     0                                   1      @                                                 M                      8      R                             H      @               8                                Y                      �                                   l                      �      0                              g      @               P      0          
                 �                      �      �                              {      @               �      P                          �      0               b      �                            �      0               6	      L                            �      0               �
      ,                             �                      �
                                     �                     �
                                     �                     �
      `                              �      @               �      0                                                 0      �         	                 	                      �      }                                                           �                              timer.c
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
timer.o
ELF          >                    h          @     @   ��UH��SH��HH�}�H�u�dH�%(   H�E�1�H�EH���    H�}� uH�Eо    H���    H�E�H�E�H�E�H���    H�E�H�H�E�H���    H�E�H� H)�H��H�U�H�E�H��H���    H�E�H�XH�E�H��H���    H�E�H�@H)�H��H�U�H�E�Hi��  H�M�H���S㥛� H��H��H��H��H��?H)�H��    H��H�U�dH+%(   t�    H�]�����UH��SH��8H�}�H�u�dH�%(   H�E�1�H�EH���    H�Eо    H���    �4H�E�H�PH�E�H�H8H�E�H��H���    ��u�   �&�2   �    H�Eо    H���    H9E���    �    ��H�U�dH+%(   t�    H�]�����UH���    ]�                                    �                  	<                   int         �f       �5       �f               �       m        �            3�       5#�        6#�    �       7�       (}      _        5       _       5        _       "	X       #	X       $�        .   (C	�      E      F�      Gf    
�   �  .   '     H�      }       �      !�      �>�      @�       A_       B_       C�       D  (    E�  0    F�  8    G�  `    H�  �    I�  �     "�       (5�  id 7_        8_       9�      :�      ;�    �      <�  
_   �  .    �  �      �_      y        V_   @  �    @   _       	C_   `  e  >    �   	`      _           �       ��      �  ��ms (f   ��t �  �@     f                 �  beg   ��end +  ��tmp �  �@    f   ��    f   �� �    :;9I8   :;9I  $ >   !I   I  :;9   :!;9I   :!;9I  	7 I  
I  ! I/  .?:;9'I<  .?:!;9'I@|  4 :!;9!
I  4 :!;9!I  %     $ >  :;9   :;9I8  .?:;9'I<   :;9I   ,                     �                      �     b   �                          
                                            	        J�v�.	�!t
��"�"��J�0 �Ku	�! 	l�� t_table __data usleep tv_sec short int meal_stamp __pthread_internal_list heartbeat print_mtx pthread_mutex_t __count __spins __align s_diff __prev table start_stamp __next __size __kind long long int long int props t_status philo forks us_diff hb_mtx barier unsigned char meals gettimeofday signed char long long unsigned int unsigned int thread short unsigned int char __nusers t_philo __useconds_t t_mutex GNU C17 13.3.0 -mtune=generic -march=x86-64 -g -fsanitize=thread -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection __lock __pthread_mutex_s long unsigned int __time_t __elision timeval __pthread_list_t tv_usec philos __owner precise_sleep mtx_getval t_thread table_mtx __suseconds_t get_time_diff pthread_t __list t_timer /home/borov/projects/42_folder/circle_3/philosophers/philo timer.c /home/borov/projects/42_folder/circle_3/philosophers/philo /usr/include/x86_64-linux-gnu/bits /usr/include/x86_64-linux-gnu/bits/types /usr/include /usr/include/x86_64-linux-gnu/sys timer.c timer.c types.h struct_timeval.h thread-shared-types.h struct_mutex.h pthreadtypes.h philo.h unistd.h time.h  GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0          GNU   �                 zR x�                E�CE��       @       �    E�CE��      d           E�CF                               ��                                      	     �                                        	                                                                                                      &                      8                      E                      R                      c                      t           �       �                      �                      �                       timer.c _sub_I_00099_0 get_time_diff __tsan_func_entry gettimeofday __tsan_read8 __tsan_func_exit __stack_chk_fail precise_sleep mtx_getval usleep __tsan_init ,          
   ��������D             ��������X             ��������k             ���������             ���������             ���������             ��������            ��������9         
   ��������J            ��������k            ���������            ���������         	   ���������            ���������            ���������            ��������              �             
                     
      �             
      ;              
                                   *       
              1       
      R      8       
      G      F       
            M       
      [      T       
      $      [       
             i       
      �       n       
      d      z       
      �      �       
      �      �       
      n      �       
      �       �       
      w      �       
             �       
      �      �       
      0      �       
      2       �       
      �       �       
      �       �       
                  
      @            
      9      "      
      n       /      
      �      <      
      s      I      
      �       V      
      v       c      
      m      p      
      �      ~      
      �      �      
             �      
      �       �      
      ~       �      
      ^       �      
      �      �      
      �      �      
              �      
      �             
      �             
      �             
      �       )      
      �      6      
      �       C      
      J       P      
      �      ]      
      �       j      
      T       w      
      �       �      
             �      
      �       �      
            �      
      T      �      
      '       �      
      �       �      
      |      
      
             !      
      �      F      
            k      
      �      u                  �      
      �       �      
      �      �                          
      �             
      �              
                                   "       
      C       &       
      ~       *       
      �       .       
      �       2       
      �       <       
      �       A       
            F       
      	      K       
            P       
      "      U       
      8      Z       
      G      _       
      V      d       
      ^      i       
      g      s                                           D                   h             �       .symtab .strtab .shstrtab .rela.text .data .bss .rela.init_array.00099 .rela.debug_info .debug_abbrev .rela.debug_aranges .rela.debug_line .debug_str .debug_line_str .comment .note.GNU-stack .note.gnu.property .rela.eh_frame                                                                                             @       �                                   @               H      �                          &                                                          ,                                                          6                                                        1      @               �                                 M                            $                             H      @               �      �                          Y                      <      Q                             l                      �      0                              g      @               �      0          
                 �                      �      �                              {      @               �      �                          �      0               �                                  �      0               �      n                            �      0                     ,                             �                      @                                     �                     @                                     �                     `      �                              �      @               8      H                                                 �      �         	                 	                      �      �                                                    �      �                              