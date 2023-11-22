import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_app/ui/views/verifyotp/verifyotp_view.form.dart';

import 'verifyotp_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'OTP Number'),
  ],
)
class VerifyotpView extends StackedView<VerifyotpViewModel>
    with $VerifyotpView {
  final String mobileNumber;

  const VerifyotpView({Key? key, required this.mobileNumber}) : super(key: key);

  Widget otpNumberWidget(String textPosition) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          textPosition,
          style: const TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    VerifyotpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                                'Enter 6 digits verification code sent to your number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500))),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            controller: oTPNumberController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'OTP',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.verifyOTP();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.black,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  VerifyotpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyotpViewModel(mobileNumber);

  @override
  void onViewModelReady(VerifyotpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
