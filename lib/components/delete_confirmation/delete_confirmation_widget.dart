import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'delete_confirmation_model.dart';
export 'delete_confirmation_model.dart';

class DeleteConfirmationWidget extends StatefulWidget {
  /// Confirms if you want to delete a route
  const DeleteConfirmationWidget({
    super.key,
    this.routesDoc,
    this.buildingsDoc,
  });

  final RoutesRecord? routesDoc;
  final BuildingsRecord? buildingsDoc;

  @override
  State<DeleteConfirmationWidget> createState() =>
      _DeleteConfirmationWidgetState();
}

class _DeleteConfirmationWidgetState extends State<DeleteConfirmationWidget> {
  late DeleteConfirmationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteConfirmationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Container(
        width: 350.0,
        height: 325.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_rounded,
                color: FlutterFlowTheme.of(context).error,
                size: 60.0,
              ),
              Text(
                'Are you sure?',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inknut Antiqua',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'This action cannot be undone. Please confirm that you want to delete this route.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inknut Antiqua',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('DELETE_CONFIRMATION_CANCEL_BTN_ON_TAP');
                      logFirebaseEvent('Button_close_dialog_drawer_etc');
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF5F6B71),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inknut Antiqua',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        shadows: [
                          Shadow(
                            color: FlutterFlowTheme.of(context).secondary,
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
                      borderRadius: BorderRadius.circular(25.0),
                      hoverColor: const Color(0xFF363636),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('DELETE_CONFIRMATION_DELETE_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');
                      await widget.routesDoc!.reference.delete();
                      logFirebaseEvent('Button_close_dialog_drawer_etc');
                      Navigator.pop(context);
                    },
                    text: 'Delete',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).error,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inknut Antiqua',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        shadows: [
                          Shadow(
                            color: FlutterFlowTheme.of(context).secondary,
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
                      borderRadius: BorderRadius.circular(25.0),
                      hoverColor: const Color(0xFFB03B42),
                    ),
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
