import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_route_model.dart';
export 'new_route_model.dart';

class NewRouteWidget extends StatefulWidget {
  const NewRouteWidget({
    super.key,
    this.buildings,
  });

  final BuildingsRecord? buildings;

  @override
  State<NewRouteWidget> createState() => _NewRouteWidgetState();
}

class _NewRouteWidgetState extends State<NewRouteWidget> {
  late NewRouteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewRouteModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NewRoute'});
    _model.routeNameFieldTextController ??= TextEditingController();
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'New Route',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Inknut Antiqua',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                fillColor: const Color(0x0068ABE8),
                                                hoverColor: Colors.transparent,
                                                hoverIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons.info_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'NEW_ROUTE_info_outline_rounded_ICN_ON_TA');
                                                  logFirebaseEvent(
                                                      'IconButton_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: const Text(
                                                              'Can\'t find a building?'),
                                                          content: const Text(
                                                              'Our building database does not pull from a constantly updating API. Because of this, some of the less prevelant buildings on campus may not be present in the dropdown. If you would like a certain building added to the list, please contact walkpointuri@gmail.com.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
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
                                                hintText: 'Route Name...',
                                                hintStyle:
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
                                                      '',
                                                ),
                                                options: List<String>.from(
                                                    startDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels:
                                                    startDropDownBuildingsRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .startDropDownValue =
                                                      val);
                                                  logFirebaseEvent(
                                                      'NEW_ROUTE_StartDropDown_ON_FORM_WIDGET_S');
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
                                                      '',
                                                ),
                                                options: List<String>.from(
                                                    endDropDownBuildingsRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels:
                                                    endDropDownBuildingsRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                      .endDropDownValue = val);
                                                  logFirebaseEvent(
                                                      'NEW_ROUTE_EndDropDown_ON_FORM_WIDGET_SEL');
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
                                                                .mCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.mCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_MCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'MCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Monday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_MCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'MCheckbox_update_page_state');
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
                                                                .tuCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.tuCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_TuCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'TuCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Tuesday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_TuCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'TuCheckbox_update_page_state');
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
                                                                .wCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.wCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_WCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'WCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Wednesday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_WCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'WCheckbox_update_page_state');
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
                                                                .thCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.thCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_ThCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'ThCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Thursday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_ThCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'ThCheckbox_update_page_state');
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
                                                                .fCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.fCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_FCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'FCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Friday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_FCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'FCheckbox_update_page_state');
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
                                                                .saCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.saCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_SaCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'SaCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Saturday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_SaCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'SaCheckbox_update_page_state');
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
                                                                .suCheckboxValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.suCheckboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_SuCheckbox_ON_TOGGLE_ON');
                                                            logFirebaseEvent(
                                                                'SuCheckbox_update_page_state');
                                                            _model
                                                                .addToDaysOfTheWeek(
                                                                    'Sunday');
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'NEW_ROUTE_PAGE_SuCheckbox_ON_TOGGLE_OFF');
                                                            logFirebaseEvent(
                                                                'SuCheckbox_update_page_state');
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
                                                          'NEW_ROUTE_PAGE_new-route-button_ON_TAP');
                                                      logFirebaseEvent(
                                                          'new-route-button_validate_form');
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .startDropDownValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .endDropDownValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if ((_model.startDropDownValue !=
                                                                  null &&
                                                              _model.startDropDownValue !=
                                                                  '') &&
                                                          (_model.endDropDownValue !=
                                                                  null &&
                                                              _model.endDropDownValue !=
                                                                  '')) {
                                                        logFirebaseEvent(
                                                            'new-route-button_backend_call');

                                                        await RoutesRecord
                                                            .collection
                                                            .doc()
                                                            .set({
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
                                                            userID:
                                                                currentUserReference,
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
                                                      } else {
                                                        logFirebaseEvent(
                                                            'new-route-button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Error: Please fill out all fields',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                    },
                                                    text: 'Create Route',
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
                                                          'NEW_ROUTE_PAGE_cancel_button_ON_TAP');
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
