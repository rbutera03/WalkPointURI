import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/route/route_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'my_routes_model.dart';
export 'my_routes_model.dart';

class MyRoutesWidget extends StatefulWidget {
  const MyRoutesWidget({
    super.key,
    this.routesDoc,
    this.buildingsDoc,
  });

  final RoutesRecord? routesDoc;
  final BuildingsRecord? buildingsDoc;

  @override
  State<MyRoutesWidget> createState() => _MyRoutesWidgetState();
}

class _MyRoutesWidgetState extends State<MyRoutesWidget>
    with TickerProviderStateMixin {
  late MyRoutesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRoutesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyRoutes'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_ROUTES_PAGE_MyRoutes_ON_INIT_STATE');
      logFirebaseEvent('MyRoutes_backend_call');
      _model.weatherAPIresult = await GetWeatherBetterCall.call();

      if ((_model.weatherAPIresult?.succeeded ?? true)) {
        logFirebaseEvent('MyRoutes_update_app_state');
        FFAppState().temp = GetWeatherBetterCall.weatherTemp(
          (_model.weatherAPIresult?.jsonBody ?? ''),
        )!;
        FFAppState().weatherIconNumber = GetWeatherBetterCall.weatherCode(
          (_model.weatherAPIresult?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
        logFirebaseEvent('MyRoutes_backend_call');
        _model.dateResult = await GetDateCall.call();

        if ((_model.dateResult?.succeeded ?? true)) {
          logFirebaseEvent('MyRoutes_update_app_state');
          FFAppState().date = getJsonField(
            (_model.dateResult?.jsonBody ?? ''),
            r'''$.date''',
          ).toString().toString();
          FFAppState().dayOfWeek = getJsonField(
            (_model.dateResult?.jsonBody ?? ''),
            r'''$.dayOfWeek''',
          ).toString().toString();
          safeSetState(() {});
        }
      }
    });

    animationsMap.addAll({
      'routeOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'routeOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
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
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: SizedBox(
                width: 750.0,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 24.0, 10.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MY_ROUTES_PAGE_Column_a7wkehhp_ON_TAP');
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      'https://forecast.weather.gov/MapClick.php?lat=41.483722&lon=-71.5253916');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        functions.getWeatherImagePath(
                                            FFAppState()
                                                .weatherIconNumber
                                                .toString()),
                                        width: 49.0,
                                        height: 49.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFAppState().temp.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inknut Antiqua',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          '°F',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inknut Antiqua',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'My Routes',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inknut Antiqua',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      FFAppState().date,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inknut Antiqua',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 32.0,
                                buttonSize: 40.0,
                                hoverColor: const Color(0xFF636363),
                                icon: const Icon(
                                  Icons.settings_rounded,
                                  color: Color(0xFF909090),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MY_ROUTES_settings_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed('AccountSettings');
                                },
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MY_ROUTES_PAGE_toggleViewButton_ON_TAP');
                              logFirebaseEvent(
                                  'toggleViewButton_update_page_state');
                              _model.dailyView = !_model.dailyView;
                              safeSetState(() {});
                            },
                            text: _model.dailyView
                                ? 'View All Routes'
                                : 'View Todays Routes',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inknut Antiqua',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                letterSpacing: 0.0,
                                shadows: [
                                  Shadow(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: const Color(0xFF836612),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: _model.dailyView,
                                    child: StreamBuilder<List<RoutesRecord>>(
                                      stream: queryRoutesRecord(
                                        queryBuilder: (routesRecord) =>
                                            routesRecord
                                                .where(
                                                  'userID',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'weekDays',
                                                  arrayContains:
                                                      FFAppState().dayOfWeek,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RoutesRecord>
                                            listViewRoutesRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewRoutesRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewRoutesRecord =
                                                listViewRoutesRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MY_ROUTES_PAGE_Container_c9dk99sh_ON_TAP');
                                                logFirebaseEvent(
                                                    'route_navigate_to');

                                                context.pushNamed(
                                                  'routeViewMap',
                                                  queryParameters: {
                                                    'startLat': serializeParam(
                                                      listViewRoutesRecord
                                                          .startLat,
                                                      ParamType.double,
                                                    ),
                                                    'startLng': serializeParam(
                                                      listViewRoutesRecord
                                                          .startLng,
                                                      ParamType.double,
                                                    ),
                                                    'endLat': serializeParam(
                                                      listViewRoutesRecord
                                                          .endLat,
                                                      ParamType.double,
                                                    ),
                                                    'endLng': serializeParam(
                                                      listViewRoutesRecord
                                                          .endLng,
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: RouteWidget(
                                                key: Key(
                                                    'Keyc9d_${listViewIndex}_of_${listViewRoutesRecordList.length}'),
                                                routesDoc: listViewRoutesRecord,
                                                buildingsDoc:
                                                    widget.buildingsDoc,
                                                routesRef: listViewRoutesRecord
                                                    .reference,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'routeOnPageLoadAnimation1']!);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: !_model.dailyView,
                                    child: StreamBuilder<List<RoutesRecord>>(
                                      stream: queryRoutesRecord(
                                        queryBuilder: (routesRecord) =>
                                            routesRecord.where(
                                          'userID',
                                          isEqualTo: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RoutesRecord>
                                            listViewRoutesRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewRoutesRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewRoutesRecord =
                                                listViewRoutesRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MY_ROUTES_PAGE_Container_whgwkwb5_ON_TAP');
                                                logFirebaseEvent(
                                                    'route_navigate_to');

                                                context.pushNamed(
                                                  'routeViewMap',
                                                  queryParameters: {
                                                    'startLat': serializeParam(
                                                      listViewRoutesRecord
                                                          .startLat,
                                                      ParamType.double,
                                                    ),
                                                    'startLng': serializeParam(
                                                      listViewRoutesRecord
                                                          .startLng,
                                                      ParamType.double,
                                                    ),
                                                    'endLat': serializeParam(
                                                      listViewRoutesRecord
                                                          .endLat,
                                                      ParamType.double,
                                                    ),
                                                    'endLng': serializeParam(
                                                      listViewRoutesRecord
                                                          .endLng,
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: RouteWidget(
                                                key: Key(
                                                    'Keywhg_${listViewIndex}_of_${listViewRoutesRecordList.length}'),
                                                routesDoc: listViewRoutesRecord,
                                                buildingsDoc:
                                                    widget.buildingsDoc,
                                                routesRef: listViewRoutesRecord
                                                    .reference,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'routeOnPageLoadAnimation2']!);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MY_ROUTES_PAGE_NewRoute_ON_TAP');
                              logFirebaseEvent('NewRoute_navigate_to');

                              context.goNamed('NewRoute');
                            },
                            text: 'New Route',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inknut Antiqua',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                letterSpacing: 0.0,
                                shadows: [
                                  Shadow(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    offset: const Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverColor: const Color(0xFF836612),
                            ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
