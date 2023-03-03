import 'package:flutter_todo_list/models/todo.dart';

// Provider 작성하기
// 네트워크 등 외부 데이터 영역과 통신을 담당하는 코드.
// 1. 모든 Todo를 가져오는 기능
// 2. 특정 Todo를 가져오는 기능
// 3. Todo 생성
// 4. 특정 Todo를 수정
// 5. Todo 삭제

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(id: 1, title: '플러터 공부 시작하기1', description: '1. 뽕 뽑는 플러터를 읽어봅시다.'),
    Todo(id: 2, title: '플러터 공부 시작하기2', description: '2. 뽕 뽑는 플러터를 읽어봅시다.'),
    Todo(id: 3, title: '플러터 공부 시작하기3', description: '3. 뽕 뽑는 플러터를 읽어봅시다.'),
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int id) {
    return dummyTodos[id];
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
        id: dummyTodos.length + 1,
        title: todo.title,
        description: todo.description);

    dummyTodos.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == id) {
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == todo.id) {
        dummyTodos[i] = todo;
      }
    }
  }
}
