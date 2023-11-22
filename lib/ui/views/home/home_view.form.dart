// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TaskValueKey = 'task';
const String NewTaskValueKey = 'newTask';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  TaskValueKey: null,
  NewTaskValueKey: null,
};

mixin $HomeView {
  TextEditingController get taskController =>
      _getFormTextEditingController(TaskValueKey);
  TextEditingController get newTaskController =>
      _getFormTextEditingController(NewTaskValueKey);

  FocusNode get taskFocusNode => _getFormFocusNode(TaskValueKey);
  FocusNode get newTaskFocusNode => _getFormFocusNode(NewTaskValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }

    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    taskController.addListener(() => _updateFormData(model));
    newTaskController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    taskController.addListener(() => _updateFormData(model));
    newTaskController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TaskValueKey: taskController.text,
          NewTaskValueKey: newTaskController.text,
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

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
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

  String? get taskValue => this.formValueMap[TaskValueKey] as String?;
  String? get newTaskValue => this.formValueMap[NewTaskValueKey] as String?;

  set taskValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TaskValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(TaskValueKey)) {
      _HomeViewTextEditingControllers[TaskValueKey]?.text = value ?? '';
    }
  }

  set newTaskValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NewTaskValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(NewTaskValueKey)) {
      _HomeViewTextEditingControllers[NewTaskValueKey]?.text = value ?? '';
    }
  }

  bool get hasTask =>
      this.formValueMap.containsKey(TaskValueKey) &&
      (taskValue?.isNotEmpty ?? false);
  bool get hasNewTask =>
      this.formValueMap.containsKey(NewTaskValueKey) &&
      (newTaskValue?.isNotEmpty ?? false);

  bool get hasTaskValidationMessage =>
      this.fieldsValidationMessages[TaskValueKey]?.isNotEmpty ?? false;
  bool get hasNewTaskValidationMessage =>
      this.fieldsValidationMessages[NewTaskValueKey]?.isNotEmpty ?? false;

  String? get taskValidationMessage =>
      this.fieldsValidationMessages[TaskValueKey];
  String? get newTaskValidationMessage =>
      this.fieldsValidationMessages[NewTaskValueKey];
}

extension Methods on FormStateHelper {
  setTaskValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TaskValueKey] = validationMessage;
  setNewTaskValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewTaskValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    taskValue = '';
    newTaskValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TaskValueKey: getValidationMessage(TaskValueKey),
      NewTaskValueKey: getValidationMessage(NewTaskValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HomeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HomeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TaskValueKey: getValidationMessage(TaskValueKey),
      NewTaskValueKey: getValidationMessage(NewTaskValueKey),
    });
