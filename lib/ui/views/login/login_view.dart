import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/login/login_view.form.dart';

import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'Mobile Number'),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 240,
                                        constraints:
                                            const BoxConstraints(maxWidth: 500),
                                        margin: const EdgeInsets.only(top: 100),
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        verticalSpaceMassive,
                                        verticalSpaceMedium,
                                        Center(
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxHeight: 340),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            // child: Image.asset('assets/img/login.png')),
                                            // child: new Image.network('https://raw.githubusercontent.com/huextrat/TheGorgeousOtp/master/assets/img/login.png'),
                                            child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtZh8T6c98XrjpfJn8p13g_a7rz9o3LHbxXvgPR7cTUA&s'),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text('OrderSum',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800))),
                              verticalSpaceLarge,
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 500),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: const TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          'We will send you an ',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                  TextSpan(
                                                      text:
                                                          'One Time Password ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text:
                                                          'on this mobile number',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ]),
                                          )),
                                      Container(
                                        height: 40,
                                        constraints:
                                            const BoxConstraints(maxWidth: 500),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: CupertinoTextField(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4)),
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 1),
                                          ),
                                          controller: mobileNumberController,
                                          clearButtonMode:
                                              OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.phone,
                                          maxLines: 1,
                                          placeholder: 'mobile number',
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        constraints:
                                            const BoxConstraints(maxWidth: 500),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20), // Adjust the radius as needed
                                            ),
                                          ),
                                          onPressed: () {
                                            if (mobileNumberController
                                                .text.isNotEmpty) {
                                              //call the viewmodel login function
                                              viewModel.login();
                                            } else {}
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  'Next',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color: Color(0xFF454545),
                                                  ),
                                                  child: const Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )))));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(
    LoginViewModel viewModel,
  ) {
    syncFormWithViewModel(viewModel);
  }
}
