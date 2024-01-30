CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = main

$(TARGET): main.c asgn2.c
	$(CC) $(CFLAGS) -o $(TARGET) main.c asgn2.c -lm

.PHONY: clean
clean:
	rm -f $(TARGET)
