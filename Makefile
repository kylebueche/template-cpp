# Project Data
EXEC_NAME = Main
SRC_DIR = src
OBJ_DIR = build

# Flags, compiler stuff
CFLAGS = -Wall -Wextra -std=c99 -pedantic
# Optional: Treat warnings as errors
# CFLAGS += -Werror
LIBS =

# Obtain all source, object, and dependency files
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEPS = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.d)

# Link all object files into one executable
$(EXEC_NAME): $(OBJS)
	gcc -o $@ $(OBJS) $(CFLAGS) $(LIBS)

# Line by line compile all srcs into objs
$(OBJS): $(SRC)
	gcc -c $< -o $@ $(CFLAGS) $(LIBS)

# Recompile c files if any included files are updated
-include $(DEPS)

clean:
	rm -rf $(OBJ_DIR) $(EXEC_NAME)
	@mkdir $(OBJ_DIR)
