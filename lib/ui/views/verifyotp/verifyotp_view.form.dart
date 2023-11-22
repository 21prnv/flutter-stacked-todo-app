// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String OTPNumberValueKey = 'OTP Number';

final Map<String, TextEditingController> _VerifyotpViewTextEditingControllers =
    {};

final Map<String, FocusNode> _VerifyotpViewFocusNodes = {};

final Map<String, String? Function(String?)?> _VerifyotpViewTextValidations = {
  OTPNumberValueKey: null,
};

mixin $VerifyotpView {
  TextEditingController get oTPNumberController =>
      _getFormTextEditingController(OTPNumberValueKey);

  FocusNode get oTPNumberFocusNode => _getFormFocusNode(OTPNumberValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_VerifyotpViewTextEditingControllers.containsKey(key)) {
      return _VerifyotpViewTextEditingControllers[key]!;
    }

    _VerifyotpViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _VerifyotpViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_VerifyotpViewFocusNodes.containsKey(key)) {
      return _VerifyotpViewFocusNodes[key]!;
    }
    _VerifyotpViewFocusNodes[key] = FocusNode();
    return _VerifyotpViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    oTPNumberController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    oTPNumberController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          OTPNumberValueKey: oTPNumberController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _VerifyotpViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _VerifyotpViewFocusNodes.values) {
      focusNode.dispose();
    }

    _VerifyotpViewTextEditingControllers.clear();
    _VerifyotpViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get oTPNumberValue => this.formValueMap[OTPNumberValueKey] as String?;

  set oTPNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OTPNumberValueKey: value}),
    );

    if (_VerifyotpViewTextEditingControllers.containsKey(OTPNumberValueKey)) {
      _VerifyotpViewTextEditingControllers[OTPNumberValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasOTPNumber =>
      this.formValueMap.containsKey(OTPNumberValueKey) &&
      (oTPNumberValue?.isNotEmpty ?? false);

  bool get hasOTPNumberValidationMessage =>
      this.fieldsValidationMessages[OTPNumberValueKey]?.isNotEmpty ?? false;

  String? get oTPNumberValidationMessage =>
      this.fieldsValidationMessages[OTPNumberValueKey];
}

extension Methods on FormStateHelper {
  setOTPNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OTPNumberValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    oTPNumberValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      OTPNumberValueKey: getValidationMessage(OTPNumberValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _VerifyotpViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _VerifyotpViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      OTPNumberValueKey: getValidationMessage(OTPNumberValueKey),
    });
