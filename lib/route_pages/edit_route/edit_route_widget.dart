import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'edit_route_model.dart';
export 'edit_route_model.dart';

class EditRouteWidget extends StatefulWidget {
  const EditRouteWidget({
    super.key,
    required this.routeRef,
    required this.routeDoc,
    required this.startDoc,
    required this.endDoc,
  });

  final DocumentReference? routeRef;
  final RoutesRecord? routeDoc;
  final BuildingsRecord? startDoc;
  final BuildingsRecord? endDoc;

  @override
  State<EditRouteWidget> createState() => _EditRouteWidgetState();
}

class _EditRouteWidgetState extends State<EditRouteWidget> {
  late EditRouteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRouteModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditRoute'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_ROUTE_PAGE_EditRoute_ON_INIT_STATE');
      logFirebaseEvent('EditRoute_update_page_state');
      _model.daysOfTheWeek = widget.routeDoc!.weekDays.toList().cast<String>();
      safeSetState(() {});
      logFirebaseEvent('EditRoute_custom_action');
      _model.endDoc = await actions.getBuildingDocument(
        widget.routeDoc!.end,
      );
      logFirebaseEvent('EditRoute_custom_action');
      _model.startDoc = await actions.getBuildingDocument(
        widget.routeDoc!.start,
      );
    });

    _model.routeNameFieldTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.routeDoc?.routeName,
      'RouteName',
    ));
    _model.routeNameFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/walkPointbackground.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 200.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 750.0,
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Edit Route',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          SizedBox(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .routeNameFieldTextController,
                                              focusNode: _model
                                                  .routeNameFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                hintText: 'Route Name...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                fontFamily: 'Inknut Antiqua',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                shadows: [
                                                  Shadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    offset: const Offset(2.0, 2.0),
                                                    blurRadius: 2.0,
                                                  )
                                                ],
                                              ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              validator: _model
                                                  .routeNameFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          StreamBuilder<List<BuildingsRecord>>(
                                            stream: queryBuildingsRecord(),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BuildingsRecord>
                                                  startDropDownBuildingsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .startDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.startDropDownValue ??=
                                                      widget.startDoc
                                                          ?.reference.id,
                                                ),
                                                options: List<String>.from(
                                                    startDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels:
                                                    startDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            valueOrDefault<
                                                                String>(
                                                              e.name,
                                                              'StartLocation',
                                                            ))
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .startDropDownValue =
                                                      val);
                                                  logFirebaseEvent(
                                                      'EDIT_ROUTE_StartDropDown_ON_FORM_WIDGET_');
                                                  logFirebaseEvent(
                                                      'StartDropDown_custom_action');
                                                  _model.startBuilding =
                                                      await actions
                                                          .compareDocumentIDtoReferenceID(
                                                    _model.startDropDownValue!,
                                                    startDropDownBuildingsRecordList
                                                        .map((e) => e.reference)
                                                        .toList(),
                                                  );
                                                  logFirebaseEvent(
                                                      'StartDropDown_backend_call');
                                                  _model.startBuildingRef =
                                                      await BuildingsRecord
                                                          .getDocumentOnce(_model
                                                              .startBuilding!);

                                                  safeSetState(() {});
                                                },
                                                width: 200.0,
                                                height: 45.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inknut Antiqua',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                hintText:
                                                    'Select Start Location...',
                                                searchHintText:
                                                    'Search For Location...',
                                                searchCursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                elevation: 0.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<BuildingsRecord>>(
                                            stream: queryBuildingsRecord(),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BuildingsRecord>
                                                  endDropDownBuildingsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .endDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.endDropDownValue ??=
                                                      widget
                                                          .endDoc?.reference.id,
                                                ),
                                                options: List<String>.from(
                                                    endDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels:
                                                    endDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            valueOrDefault<
                                                                String>(
                                                              e.name,
                                                              'EndLocation',
                                                            ))
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                      .endDropDownValue = val);
                                                  logFirebaseEvent(
                                                      'EDIT_ROUTE_EndDropDown_ON_FORM_WIDGET_SE');
                                                  logFirebaseEvent(
                                                      'EndDropDown_custom_action');
                                                  _model.endBuilding = await actions
                                                      .compareDocumentIDtoReferenceID(
                                                    _model.endDropDownValue!,
                                                    endDropDownBuildingsRecordList
                                                        .map((e) => e.reference)
                                                        .toList(),
                                                  );
                                                  logFirebaseEvent(
                                                      'EndDropDown_backend_call');
                                                  _model.endBuildingRef =
                                                      await BuildingsRecord
                                                          .getDocumentOnce(_model
                                                              .endBuilding!);

                                                  safeSetState(() {});
                                                },
                                                width: 200.0,
                                                height: 45.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inknut Antiqua',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                  fontFamily: 'Inknut Antiqua',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      offset: const Offset(2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                ),
                                                hintText:
                                                    'Select End Location...',
                                                searchHintText:
                                                    'Search For Location...',
                                                searchCursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                elevation: 0.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'M',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue1 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Monday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue1 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_tip2t6xk_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Monday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_tip2t6xk_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Monday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Tu',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue2 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Tuesday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue2 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_mpdmtduj_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Tuesday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_mpdmtduj_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Tuesday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'W',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue3 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Wednesday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue3 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_x6im2est_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Wednesday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_x6im2est_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Wednesday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Th',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue4 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Thursday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue4 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_asmwzo71_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Thursday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_asmwzo71_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Thursday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'F',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue5 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Friday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue5 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_y5v4yio0_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Friday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_y5v4yio0_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Friday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'S',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue6 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Saturday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue6 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_re14d6cu_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Saturday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_re14d6cu_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Saturday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Su',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inknut Antiqua',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            const Color(0xFF3E8F4B),
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValue7 ??=
                                                            widget.routeDoc!
                                                                .weekDays
                                                                .contains(
                                                                    valueOrDefault<
                                                                        String>(
                                                          'Sunday',
                                                          '1',
                                                        )),
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValue7 =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_kbcr5scn_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Sunday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'EDIT_ROUTE_Checkbox_kbcr5scn_ON_TOGGLE_O');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_page_state');
                                                            _model
                                                                .removeFromDaysOfTheWeek(
                                                                    'Sunday');
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: const BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFF3E8F4B),
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      50.0, 0.0, 50.0, 0.0),
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_ROUTE_PAGE_new-route-button_ON_TAP');
                                                      logFirebaseEvent(
                                                          'new-route-button_backend_call');

                                                      await widget.routeRef!
                                                          .update({
                                                        ...createRoutesRecordData(
                                                          start: _model
                                                              .startBuildingRef
                                                              ?.name,
                                                          end: _model
                                                              .endBuildingRef
                                                              ?.name,
                                                          routeName: _model
                                                              .routeNameFieldTextController
                                                              .text,
                                                          startLat: _model
                                                              .startBuildingRef
                                                              ?.latitude,
                                                          startLng: _model
                                                              .startBuildingRef
                                                              ?.longitude,
                                                          endLat: _model
                                                              .endBuildingRef
                                                              ?.latitude,
                                                          endLng: _model
                                                              .endBuildingRef
                                                              ?.longitude,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'weekDays': _model
                                                                .daysOfTheWeek,
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'new-route-button_navigate_to');

                                                      context.pushNamed(
                                                          'MyRoutes');
                                                    },
                                                    text: 'Confirm Changes',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 42.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                        fontFamily:
                                                            'Inknut Antiqua',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 2.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      hoverColor:
                                                          const Color(0xFF836612),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      50.0, 0.0, 50.0, 0.0),
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_ROUTE_PAGE_cancel_button_ON_TAP');
                                                      logFirebaseEvent(
                                                          'cancel_button_navigate_to');

                                                      context
                                                          .goNamed('MyRoutes');
                                                    },
                                                    text: 'Cancel',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 42.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFFC1444B),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                        fontFamily:
                                                            'Inknut Antiqua',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 2.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      hoverColor:
                                                          const Color(0xFFD41F29),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
