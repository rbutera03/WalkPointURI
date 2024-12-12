import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'account_settings_model.dart';
export 'account_settings_model.dart';

class AccountSettingsWidget extends StatefulWidget {
  const AccountSettingsWidget({super.key});

  @override
  State<AccountSettingsWidget> createState() => _AccountSettingsWidgetState();
}

class _AccountSettingsWidgetState extends State<AccountSettingsWidget> {
  late AccountSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountSettings'});
    _model.textController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode ??= FocusNode();

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
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Green_1.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              hoverColor: const Color(0xFF636363),
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ACCOUNT_SETTINGS_PAGE_close_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                        Text(
                          'Account Settings',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inknut Antiqua',
                                fontSize: 36.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello, ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inknut Antiqua',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: const AlignmentDirectional(1.5, 2.0),
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 106.0,
                                height: 106.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      currentUserPhoto,
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 20.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                                hoverIconColor: const Color(0xFF004701),
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Color(0xFF058204),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ACCOUNT_SETTINGS_add_circle_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 68.00,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('IconButton_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl,
                                  ));
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Change Photo',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inknut Antiqua',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: 'Inknut Antiqua',
                                fontSize: 17.0,
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
                              hintText: 'Username...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inknut Antiqua',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        offset: const Offset(2.0, 2.0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                    lineHeight: 4.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inknut Antiqua',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.genderDropDownValueController ??=
                                FormFieldController<String>(
                              _model.genderDropDownValue ??= valueOrDefault(
                                  currentUserDocument?.gender, ''),
                            ),
                            options: const [
                              'Man',
                              'Woman',
                              'Non-binary',
                              'Prefer not to say',
                              'Other'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.genderDropDownValue = val),
                            width: 300.0,
                            height: 66.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inknut Antiqua',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            hintText: 'Gender...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFF68ABE8),
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 1.0,
                            borderRadius: 24.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.gradeDropDownValueController ??=
                                FormFieldController<String>(
                              _model.gradeDropDownValue ??= valueOrDefault(
                                  currentUserDocument?.grade, ''),
                            ),
                            options: const [
                              'Freshman',
                              'Sophomore',
                              'Junior',
                              'Senior',
                              'Graduate',
                              'Non-student'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.gradeDropDownValue = val),
                            width: 300.0,
                            height: 66.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inknut Antiqua',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            hintText: 'Grade...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFF68ABE8),
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 1.0,
                            borderRadius: 24.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.statusDropDownValueController ??=
                                FormFieldController<String>(
                              _model.statusDropDownValue ??= valueOrDefault(
                                  currentUserDocument?.status, ''),
                            ),
                            options: const [
                              'New Student',
                              'On Campus',
                              'Commuter',
                              'Visitor'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.statusDropDownValue = val),
                            width: 300.0,
                            height: 66.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inknut Antiqua',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            hintText: 'Status...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFF68ABE8),
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 1.0,
                            borderRadius: 24.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ACCOUNT_SETTINGS_login-button_ON_TAP');
                          logFirebaseEvent('login-button_backend_call');
                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                grade: _model.gradeDropDownValue,
                                gender: _model.genderDropDownValue,
                                status: _model.statusDropDownValue,
                                displayName: _model.textController.text,
                              ));
                            }(),
                          );
                          logFirebaseEvent('login-button_navigate_to');

                          context.goNamed('MyRoutes');
                        },
                        text: 'Save Changes',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 42.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inknut Antiqua',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
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
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                          hoverColor: const Color(0xFF836612),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ACCOUNT_SETTINGS_Text_r05sn0tk_ON_TAP');
                        logFirebaseEvent('Text_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        logFirebaseEvent('Text_navigate_to');

                        context.pushNamedAuth('Login', context.mounted);
                      },
                      child: Text(
                        'Log Out',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inknut Antiqua',
                              letterSpacing: 0.0,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
