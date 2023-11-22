import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/model/todo.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:todo_app/ui/views/notes_details/notes_details_view.dart';

class FirebaseDeepLinksService {
  final supabase = Supabase.instance.client;

  final navigationService = locator<NavigationService>();
  static Future<String> createDynamicLink(bool short, Todo todo) async {
    String linkMessage;

    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://www.google.com/todo?id=${todo.id}"),
      uriPrefix: "https://exampletodo21.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.example.todo_app"),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    linkMessage = dynamicLink.toString();
    return linkMessage;
  }

  Future<void> initDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      final Uri deepLink = dynamicLinkData.link;
      var isTodo = deepLink.pathSegments.contains('todo');
      if (isTodo) {
        String id = deepLink.queryParameters['id']!;
        // TODO :Modify Accordingly

        if (deepLink != null) {
          // TODO : Navigate to your pages accordingly here

          try {
            // Fetch the story data from Supabase using the 'id'
            final response = await supabase
                .from('todos') // Change to your Supabase table name
                .select()
                .eq('id', id)
                .single()
                .execute();

            // Check for errors in the response

            // Convert the Supabase response data to your StoryData model
            Todo todo = Todo.fromJson(response.data);

            // Navigate to the StoryPage with the fetched story data
            navigationService.navigateToView(NotesDetailsView(todo));
          } catch (e) {
            print('Error fetching story from Supabase: $e');
          }
        } else {
          return;
        }
      }
    }).onError((error) {
      // Handle errors
    });
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    try {
      final Uri deepLink = data!.link;
      var isStory = deepLink.pathSegments.contains('todo');
      if (isStory) {
        // TODO :Modify Accordingly
        String id = deepLink.queryParameters['id']!; // TODO :Modify Accordingly

        // TODO : Navigate to your pages accordingly here

        if (deepLink != null) {
          // TODO : Navigate to your pages accordingly here

          try {
            // Fetch the story data from Supabase using the 'id'
            final response = await supabase
                .from('todos') // Change to your Supabase table name
                .select()
                .eq('id', id)
                .single()
                .execute();

            // Check for errors in the response

            // Convert the Supabase response data to your StoryData model
            Todo todo = Todo.fromJson(response.data);

            // Navigate to the StoryPage with the fetched story data
            navigationService.navigateToView(NotesDetailsView(todo));
          } catch (e) {
            print('Error fetching story from Supabase: $e');
          }
        } else {
          return;
        }
      }
    } catch (e) {
      print('No deepLink found');
    }
  }

  // static Future<void> sendOneSignalNotificationToAll(
  //     String generatedLink) async {
  //   const String appId = '9e024891-6411-4c2b-a13b-dc76bffe12e4';
  //   const String apiKey = 'M2ZmOWIyYzMtOGJjOS00Mjg5LWE2N2ItOTVhMWI1YmQ5ODFj';

  //   final Map<String, dynamic> notification = {
  //     'app_id': appId,
  //     // Omit 'include_player_ids' to target all users
  //     'data': {'custom_link': generatedLink},
  //     'contents': {'en': 'Your notification message'},
  //     'headings': {'en': 'Your notification title'},
  //   };

  //   final http.Response response = await http.post(
  //     Uri.parse('https://onesignal.com/api/v1/notifications'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Basic $apiKey',
  //     },
  //     body: json.encode(notification),
  //   );

  //   if (response.statusCode == 200) {
  //     print('Notification sent successfully to all users');
  //   } else {
  //     print('Failed to send notification. Status code: ${response.statusCode}');
  //   }
  // }
}
