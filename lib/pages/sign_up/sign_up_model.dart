import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for signup-username widget.
  FocusNode? signupUsernameFocusNode;
  TextEditingController? signupUsernameTextController;
  String? Function(BuildContext, String?)?
      signupUsernameTextControllerValidator;
  String? _signupUsernameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for signup-email widget.
  FocusNode? signupEmailFocusNode;
  TextEditingController? signupEmailTextController;
  String? Function(BuildContext, String?)? signupEmailTextControllerValidator;
  String? _signupEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for signup-password widget.
  FocusNode? signupPasswordFocusNode;
  TextEditingController? signupPasswordTextController;
  late bool signupPasswordVisibility;
  String? Function(BuildContext, String?)?
      signupPasswordTextControllerValidator;
  String? _signupPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for Singup-ConfirmPassword widget.
  FocusNode? singupConfirmPasswordFocusNode;
  TextEditingController? singupConfirmPasswordTextController;
  late bool singupConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      singupConfirmPasswordTextControllerValidator;
  String? _singupConfirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    signupUsernameTextControllerValidator =
        _signupUsernameTextControllerValidator;
    signupEmailTextControllerValidator = _signupEmailTextControllerValidator;
    signupPasswordVisibility = false;
    signupPasswordTextControllerValidator =
        _signupPasswordTextControllerValidator;
    singupConfirmPasswordVisibility = false;
    singupConfirmPasswordTextControllerValidator =
        _singupConfirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    signupUsernameFocusNode?.dispose();
    signupUsernameTextController?.dispose();

    signupEmailFocusNode?.dispose();
    signupEmailTextController?.dispose();

    signupPasswordFocusNode?.dispose();
    signupPasswordTextController?.dispose();

    singupConfirmPasswordFocusNode?.dispose();
    singupConfirmPasswordTextController?.dispose();
  }
}
