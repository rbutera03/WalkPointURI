import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'account_creation_widget.dart' show AccountCreationWidget;
import 'package:flutter/material.dart';

class AccountCreationModel extends FlutterFlowModel<AccountCreationWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for gradeDropDown widget.
  String? gradeDropDownValue;
  FormFieldController<String>? gradeDropDownValueController;
  // State field(s) for statusDropDown widget.
  String? statusDropDownValue;
  FormFieldController<String>? statusDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
