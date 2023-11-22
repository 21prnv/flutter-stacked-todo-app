import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/home/home_view.form.dart';
import 'package:todo_app/ui/views/notes_details/notes_details_view.dart';

import '../../../model/todo.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'task'),
  FormTextField(name: 'newTask'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await Clipboard.setData(const ClipboardData(
                          text: 'https://exampletodo21.page.link/start'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Link copied to clipboard'),
                        ),
                      );
                    },
                    child: const Text('Share the app link')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: 'Enter task',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () async {
                          await viewModel.addTodo();
                          taskController.clear();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: StreamBuilder(
                        stream: Supabase.instance.client
                            .from('todos')
                            .stream(primaryKey: ["id"]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData == null) {
                            return const Center(
                              child: Text('Oops you dont have any todo yet'),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final todo = snapshot.data![index];
                              return ListTile(
                                title: Text(todo['task']),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NotesDetailsView(Todo.fromJson(todo)),
                                    ),
                                  );
                                },
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Edit Task'),
                                              content: TextField(
                                                controller: newTaskController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Enter new task',
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    viewModel.updateTodo(
                                                        todo['id'],
                                                        newTaskController.text);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Save'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        viewModel.deleteTodo(todo['id']);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
