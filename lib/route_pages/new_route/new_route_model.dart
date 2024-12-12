import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_route_widget.dart' show NewRouteWidget;
import 'package:flutter/material.dart';

class NewRouteModel extends FlutterFlowModel<NewRouteWidget> {
  ///  Local state fields for this page.

  List<String> daysOfTheWeek = [];
  void addToDaysOfTheWeek(String item) => daysOfTheWeek.add(item);
  void removeFromDaysOfTheWeek(String item) => daysOfTheWeek.remove(item);
  void removeAtIndexFromDaysOfTheWeek(int index) =>
      daysOfTheWeek.removeAt(index);
  void insertAtIndexInDaysOfTheWeek(int index, String item) =>
      daysOfTheWeek.insert(index, item);
  void updateDaysOfTheWeekAtIndex(int index, Function(String) updateFn) =>
      daysOfTheWeek[index] = updateFn(daysOfTheWeek[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for routeNameField widget.
  FocusNode? routeNameFieldFocusNode;
  TextEditingController? routeNameFieldTextController;
  String? Function(BuildContext, String?)?
      routeNameFieldTextControllerValidator;
  String? _routeNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for StartDropDown widget.
  String? startDropDownValue;
  FormFieldController<String>? startDropDownValueController;
  // Stores action output result for [Custom Action - compareDocumentIDtoReferenceID] action in StartDropDown widget.
  DocumentReference? startBuilding;
  // Stores action output result for [Backend Call - Read Document] action in StartDropDown widget.
  BuildingsRecord? startBuildingRef;
  // State field(s) for EndDropDown widget.
  String? endDropDownValue;
  FormFieldController<String>? endDropDownValueController;
  // Stores action output result for [Custom Action - compareDocumentIDtoReferenceID] action in EndDropDown widget.
  DocumentReference? endBuilding;
  // Stores action output result for [Backend Call - Read Document] action in EndDropDown widget.
  BuildingsRecord? endBuildingRef;
  // State field(s) for MCheckbox widget.
  bool? mCheckboxValue;
  // State field(s) for TuCheckbox widget.
  bool? tuCheckboxValue;
  // State field(s) for WCheckbox widget.
  bool? wCheckboxValue;
  // State field(s) for ThCheckbox widget.
  bool? thCheckboxValue;
  // State field(s) for FCheckbox widget.
  bool? fCheckboxValue;
  // State field(s) for SaCheckbox widget.
  bool? saCheckboxValue;
  // State field(s) for SuCheckbox widget.
  bool? suCheckboxValue;

  @override
  void initState(BuildContext context) {
    routeNameFieldTextControllerValidator =
        _routeNameFieldTextControllerValidator;
  }

  @override
  void dispose() {
    routeNameFieldFocusNode?.dispose();
    routeNameFieldTextController?.dispose();
  }
}
