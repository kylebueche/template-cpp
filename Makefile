# Project Data
EXEC_NAME = Main
SRC_DIR = src
BUILD_DIR = build

# Flags, compiler stuff
CFLAGS = -Wall -Wextra -std=c99 -pedantic -MMD -MP
# Optional: Treat warnings as errors
# CFLAGS += -Werror
LIBS =

# Obtain all source, object, and dependency files
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS = $(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.d)

# Link all object files into one executable
$(EXEC_NAME): $(OBJS)
	gcc -o $@ $(OBJS) $(CFLAGS) $(LIBS)

# Line by line compile all srcs into objs
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	gcc -c $< -o $@ $(CFLAGS) $(LIBS)

# Recompile c files if any included files are updated
-include $(DEPS)

clean:
	rm -rf $(BUILD_DIR) $(EXEC_NAME)
	@mkdir $(BUILD_DIR)
