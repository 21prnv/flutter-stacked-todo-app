import 'package:flutter/material.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/views/home/home_view.form.dart';

class HomeViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final todoService = TodoService();
  final _navigationService = locator<NavigationService>();
  addTodo() {
    todoService.addTodo(taskValue!);
    rebuildUi();
  }

  deleteTodo(int id) {
    todoService.deleteTodo(id);
    rebuildUi();
  }

  readTodo() {
    todoService.readTodos();
    // rebuildUi();
  }

  updateTodo(int id, String newtask) {
    todoService.updateTodo(id, newtask);
    rebuildUi();
  }
}
