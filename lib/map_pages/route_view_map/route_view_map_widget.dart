import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'route_view_map_model.dart';
export 'route_view_map_model.dart';

class RouteViewMapWidget extends StatefulWidget {
  const RouteViewMapWidget({
    super.key,
    this.startLat,
    this.startLng,
    this.endLat,
    this.endLng,
  });

  final double? startLat;
  final double? startLng;
  final double? endLat;
  final double? endLng;

  @override
  State<RouteViewMapWidget> createState() => _RouteViewMapWidgetState();
}

class _RouteViewMapWidgetState extends State<RouteViewMapWidget> {
  late RouteViewMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteViewMapModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'routeViewMap'});
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
        backgroundColor: const Color(0xFF002147),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  hoverColor: FlutterFlowTheme.of(context).secondary,
                  hoverIconColor: FlutterFlowTheme.of(context).primary,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'ROUTE_VIEW_MAP_arrow_back_rounded_ICN_ON');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                Text(
                  'Route View Map',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inknut Antiqua',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.info_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'ROUTE_VIEW_MAP_info_outlined_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('Disclaimer:'),
                              content: const Text(
                                  'The route map is designed to show your saved routes at the click of a button. Zoom in/out to adjust view of path. Building locations are set to hardcoded latitude and longitudes, which might not reflect the closest or most convenient entry points for every user. Please use your judgment and adjust your walking path as you go to better match your specific destination and preferences. Walking paths are based on OpenStreetMap data, which may not account for all shortcuts or off-the-path options **CROSSWALKS ARE THE DESIGNATED WALKING PATHS FOR CROSSING STREETS. CROSS WITHOUT CROSSWALKS AT YOUR OWN RISK**'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Dismiss'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 719.0,
                child: custom_widgets.CustomMapWidget(
                  width: double.infinity,
                  height: 719.0,
                  startLat: widget.startLat,
                  startLng: widget.startLng,
                  endLat: widget.endLat,
                  endLng: widget.endLng,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
