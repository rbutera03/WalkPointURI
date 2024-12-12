import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_routes_widget.dart' show MyRoutesWidget;
import 'package:flutter/material.dart';

class MyRoutesModel extends FlutterFlowModel<MyRoutesWidget> {
  ///  Local state fields for this page.

  bool dailyView = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetWeatherBetter)] action in MyRoutes widget.
  ApiCallResponse? weatherAPIresult;
  // Stores action output result for [Backend Call - API (GetDate)] action in MyRoutes widget.
  ApiCallResponse? dateResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
