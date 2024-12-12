import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'free_view_map_model.dart';
export 'free_view_map_model.dart';

class FreeViewMapWidget extends StatefulWidget {
  /// Map that is used when route is clicked.
  const FreeViewMapWidget({super.key});

  @override
  State<FreeViewMapWidget> createState() => _FreeViewMapWidgetState();
}

class _FreeViewMapWidgetState extends State<FreeViewMapWidget> {
  late FreeViewMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeViewMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'freeViewMap'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Free View Map',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inknut Antiqua',
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    hoverColor: FlutterFlowTheme.of(context).secondary,
                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'FREE_VIEW_MAP_info_outline_rounded_ICN_O');
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('Disclaimer:'),
                              content: const Text(
                                  'The free map is designed to assist with navigation around campus without having to save routes. Quickly get the distance estimated walking time between two points by simply tapping them on the map. Walking paths are based on OpenStreetMap data, which may not account for all shortcuts or off-the-path options. **CROSSWALKS ARE THE DESIGNATED WALKING PATHS FOR CROSSING STREETS. CROSS WITHOUT CROSSWALKS AT YOUR OWN RISK**'),
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
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 665.0,
                child: custom_widgets.CustomMapWidget(
                  width: double.infinity,
                  height: 665.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
