import '/backend/backend.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'route_model.dart';
export 'route_model.dart';

class RouteWidget extends StatefulWidget {
  /// component for Route
  const RouteWidget({
    super.key,
    this.routesDoc,
    this.buildingsDoc,
    required this.routesRef,
  });

  final RoutesRecord? routesDoc;
  final BuildingsRecord? buildingsDoc;
  final DocumentReference? routesRef;

  @override
  State<RouteWidget> createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget> {
  late RouteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        logFirebaseEvent('ROUTE_MouseRegion_xarjgp3x_ON_TOGGLE_ON');
        logFirebaseEvent('MouseRegion_haptic_feedback');
        HapticFeedback.lightImpact();
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: const Color(0x79F8BD37),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('ROUTE_COMP_Icon_ejbney5k_ON_TAP');
                        logFirebaseEvent('Icon_custom_action');
                        _model.startDoc = await actions.getBuildingDocument(
                          widget.routesDoc!.start,
                        );
                        logFirebaseEvent('Icon_custom_action');
                        _model.endDoc = await actions.getBuildingDocument(
                          widget.routesDoc!.end,
                        );
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed(
                          'EditRoute',
                          queryParameters: {
                            'routeRef': serializeParam(
                              widget.routesRef,
                              ParamType.DocumentReference,
                            ),
                            'routeDoc': serializeParam(
                              widget.routesDoc,
                              ParamType.Document,
                            ),
                            'startDoc': serializeParam(
                              _model.startDoc,
                              ParamType.Document,
                            ),
                            'endDoc': serializeParam(
                              _model.endDoc,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'routeDoc': widget.routesDoc,
                            'startDoc': _model.startDoc,
                            'endDoc': _model.endDoc,
                          },
                        );

                        safeSetState(() {});
                      },
                      child: const Icon(
                        Icons.mode_edit_outlined,
                        color: Color(0xFF96701A),
                        size: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.routesDoc?.routeName,
                        'Name',
                      ).maybeHandleOverflow(
                        maxChars: 10,
                        replacement: '…',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inknut Antiqua',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        shadows: [
                          Shadow(
                            color: FlutterFlowTheme.of(context).secondary,
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 2.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: const Color(0x7EFF5D65),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE72020),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('ROUTE_COMP_Icon_qd9gc8bo_ON_TAP');
                            logFirebaseEvent('Icon_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: DeleteConfirmationWidget(
                                      routesDoc: widget.routesDoc,
                                      buildingsDoc: widget.buildingsDoc,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.trashAlt,
                            color: Color(0xC6921212),
                            size: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.routesDoc?.start,
                              'start',
                            ).maybeHandleOverflow(
                              maxChars: 15,
                              replacement: '…',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inknut Antiqua',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                  shadows: [
                                    Shadow(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                    )
                                  ],
                                  lineHeight: 0.75,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 30.0,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              valueOrDefault<String>(
                                widget.routesDoc?.end,
                                'end',
                              ).maybeHandleOverflow(
                                maxChars: 20,
                                replacement: '…',
                              ),
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inknut Antiqua',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        offset: const Offset(2.0, 2.0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                    lineHeight: 0.8,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
