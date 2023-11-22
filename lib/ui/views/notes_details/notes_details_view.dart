import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/services/firebase_deep_links_service.dart';
import 'package:flutter/services.dart';
import 'notes_details_viewmodel.dart';

class NotesDetailsView extends StackedView<NotesDetailsViewModel> {
  const NotesDetailsView(this.todo, {Key? key}) : super(key: key);
  final Todo todo;
  @override
  Widget builder(
    BuildContext context,
    NotesDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task: ${todo.task}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('ID: ${todo.id}'),
            // Add more details as needed
            IconButton(
                onPressed: () async {
                  String generatedLink =
                      await FirebaseDeepLinksService.createDynamicLink(
                          true, todo);
                  await Clipboard.setData(ClipboardData(text: generatedLink));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link copied to clipboard'),
                    ),
                  );
                  print(generatedLink);
                },
                icon: const Icon(Icons.share))
          ],
        ),
      ),
    );
  }

  @override
  NotesDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotesDetailsViewModel();
}
