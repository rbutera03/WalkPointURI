import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'r_i_p_t_a_next_bus_model.dart';
export 'r_i_p_t_a_next_bus_model.dart';

class RIPTANextBusWidget extends StatefulWidget {
  const RIPTANextBusWidget({super.key});

  @override
  State<RIPTANextBusWidget> createState() => _RIPTANextBusWidgetState();
}

class _RIPTANextBusWidgetState extends State<RIPTANextBusWidget> {
  late RIPTANextBusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RIPTANextBusModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RIPTA_Next_Bus'});
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'RIPTA and Shuttles',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inknut Antiqua',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Leaving the Memorial Union:',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inknut Antiqua',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions.getNextRoute64(),
                        'Unable to find next Route 64',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Inknut Antiqua',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      functions.getNextRoute66(),
                      'Unable to find Next Route 66',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inknut Antiqua',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      functions.getNextRoute69(),
                      'Unable to find Next Route 69',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inknut Antiqua',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    ' ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inknut Antiqua',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'URI Shuttle Service:',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inknut Antiqua',
                          letterSpacing: 0.0,
                        ),
                  ),
                  const FlutterFlowWebView(
                    content: 'https://uri.transloc.com/m/',
                    height: 570.0,
                    verticalScroll: false,
                    horizontalScroll: false,
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
