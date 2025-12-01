# Компилятор
CXX := g++

# Флаги компиляции (отключаем предупреждения)
CXXFLAGS := -std=c++17 -O2 -w -Ilibs

# Имя итогового бинарника
TARGET := prac1

# Список файлов с исходниками
SRC := main.cpp \
       insert.cpp \
       delete.cpp \
       select.cpp \
       read_json.cpp \
       instruments.cpp

# Соответствующие объектные файлы
OBJ := $(SRC:.cpp=.o)

# Цель по умолчанию
all: $(TARGET)

# Линковка и автоматическая очистка .o
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) $(OBJ) -o $(TARGET)
	@rm -f $(OBJ)
	@echo "Build complete. Object files removed."

# Правило для .o файлов
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Ручная очистка
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
