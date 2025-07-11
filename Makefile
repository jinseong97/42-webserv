NAME = webserv
CC = clang++
CFLAGS = #-Wall -Wextra -Werror #-std=c++98 #-fsanitize=address

INC_DIR	= include/
SRC_DIR	= src/
OBJ_DIR	= obj/

SRC_FILES =	main.cpp \
			config/ConfigParser.cpp \
			config/ConfigLocation.cpp \
			config/ConfigValidator.cpp \
			config/Config.cpp
OBJ_FILES = $(SRC_FILES:.cpp=.o)

SRC =	$(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ =	$(addprefix $(OBJ_DIR), $(OBJ_FILES))

all: $(NAME)

$(NAME): $(OBJ)
	@$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -I $(INC_DIR) -o $@ -c $<
	
clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
