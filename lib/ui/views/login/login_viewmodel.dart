import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/login_service.dart';
import 'package:todo_app/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();

  login() {
    _loginService.sendOTP('+91${mobileNumberValue!}');
    _navigationService.navigateToVerifyotpView(
        mobileNumber: '+91${mobileNumberValue!}');
  }
}
