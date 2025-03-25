CC = cc
FLAGS = -Wall -Wextra -Werror
# SAN = -fsanitize=thread -g

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
