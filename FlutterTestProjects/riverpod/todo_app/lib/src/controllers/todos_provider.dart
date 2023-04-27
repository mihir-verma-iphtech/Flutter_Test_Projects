import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/src/models/todos.dart';

class TodosProvider extends Notifier<List<Todos>> {
  @override
  List<Todos> build() {
    state = todoList;
    return state;
  }

  late List<Todos> todoList = [];
  late List<Todos> todoCompletedList = [];
  late List<Todos> todoNotCompletedList = [];

  todoListAdd(Todos todo) {
    // state=[...state,todo];//It is used to add new elements in the todo List
    state = [...state, todo];
    // todos();

    return state;
  }

  toggle(Todos todo) {
    List<Todos> lst = [];
    for (Todos td in state) {
      if (td.taskName == todo.taskName) {
        // td.isCompleted = true;
        td.isCompleted = !td.isCompleted;
      }
      lst = [...lst, td];
    }
    state = lst;
    return state;
    // return state;
  }

  isCompletedOrNot() {
    todoCompletedList.clear();
    todoNotCompletedList.clear();
    for (Todos todos in state) {
      if (todos.isCompleted) {
        todoCompletedList = [...todoCompletedList, todos];
      } else {
        todoNotCompletedList = [...todoNotCompletedList, todos];
      }
    }
  }

  completedOrNot(bool complete) {
    isCompletedOrNot();
    //  (complete) ? todoCompletedList : todoNotCompletedList;
    return (complete) ? todoCompletedList : todoNotCompletedList;
  }
}

final todosProvider =
    NotifierProvider<TodosProvider, List<Todos>>(() => TodosProvider());
