import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_route_widget.dart' show EditRouteWidget;
import 'package:flutter/material.dart';

class EditRouteModel extends FlutterFlowModel<EditRouteWidget> {
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
  // Stores action output result for [Custom Action - getBuildingDocument] action in EditRoute widget.
  BuildingsRecord? endDoc;
  // Stores action output result for [Custom Action - getBuildingDocument] action in EditRoute widget.
  BuildingsRecord? startDoc;
  // State field(s) for routeNameField widget.
  FocusNode? routeNameFieldFocusNode;
  TextEditingController? routeNameFieldTextController;
  String? Function(BuildContext, String?)?
      routeNameFieldTextControllerValidator;
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
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    routeNameFieldFocusNode?.dispose();
    routeNameFieldTextController?.dispose();
  }
}
