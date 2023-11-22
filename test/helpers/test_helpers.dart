import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/services/login_service.dart';
import 'package:todo_app/services/subscription_service.dart';
import 'package:todo_app/services/router_service.dart';
import 'package:todo_app/services/routingg_service.dart';
import 'package:todo_app/services/firebase_deep_links_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TodoService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SubscriptionService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RoutinggService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirebaseDeepLinksService>(
      onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterTodoService();
  getAndRegisterLoginService();
  getAndRegisterSubscriptionService();
  getAndRegisterRouterService();
  getAndRegisterRoutinggService();
  getAndRegisterFirebaseDeepLinksService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockTodoService getAndRegisterTodoService() {
  _removeRegistrationIfExists<TodoService>();
  final service = MockTodoService();
  locator.registerSingleton<TodoService>(service);
  return service;
}

MockLoginService getAndRegisterLoginService() {
  _removeRegistrationIfExists<LoginService>();
  final service = MockLoginService();
  locator.registerSingleton<LoginService>(service);
  return service;
}

MockSubscriptionService getAndRegisterSubscriptionService() {
  _removeRegistrationIfExists<SubscriptionService>();
  final service = MockSubscriptionService();
  locator.registerSingleton<SubscriptionService>(service);
  return service;
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockRoutinggService getAndRegisterRoutinggService() {
  _removeRegistrationIfExists<RoutinggService>();
  final service = MockRoutinggService();
  locator.registerSingleton<RoutinggService>(service);
  return service;
}

MockFirebaseDeepLinksService getAndRegisterFirebaseDeepLinksService() {
  _removeRegistrationIfExists<FirebaseDeepLinksService>();
  final service = MockFirebaseDeepLinksService();
  locator.registerSingleton<FirebaseDeepLinksService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
