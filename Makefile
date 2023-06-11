# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dajeon <dajeon@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/11 18:18:27 by dajeon            #+#    #+#              #
#    Updated: 2023/06/11 22:07:37 by dajeon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRCS = ft_strncmp.c ft_memchr.c ft_atoi.c ft_memcmp.c ft_strnstr.c \
	   ft_strrchr.c ft_strchr.c ft_toupper.c ft_tolower.c ft_strlcpy.c \
	   ft_strlcat.c \
	   \
	   ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
	   ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
	   \
	   ft_calloc.c ft_strdup.c \
	   \
	   ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
	   ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c \
	   ft_putnbr_fd.c

SRCS_BONUS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
			 ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c
CC = cc
AR = ar
RM = rm -rf
CFLAGS = -Wall -Werror -Wextra
ARFLAGS = crus

OBJS = $(SRCS:.c=.o)
OBJS_BONUS = $(SRCS_BONUS:.c=.o)

ifdef WITH_BONUS
	OBJS_C = $(OBJS) $(OBJS_BONUS)
else
	OBJS_C = $(OBJS)
endif

all : $(NAME)

bonus :
	$(MAKE) WITH_BONUS=1

clean : 
	$(RM) $(OBJS) $(OBJS_BONUS)

fclean : 
	$(MAKE) clean
	$(RM) $(NAME)

re : 
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all clean fclean re bonus


$(NAME) : $(OBJS_C) $(SRC_H)
	$(AR) $(ARFLAGS) $@ $^ 
