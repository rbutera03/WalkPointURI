import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:walk_point_u_r_i/flutter_flow/flutter_flow_drop_down.dart';
import 'package:walk_point_u_r_i/flutter_flow/flutter_flow_icon_button.dart';
import 'package:walk_point_u_r_i/flutter_flow/flutter_flow_widgets.dart';
import 'package:walk_point_u_r_i/flutter_flow/flutter_flow_theme.dart';
import 'package:walk_point_u_r_i/index.dart';
import 'package:walk_point_u_r_i/main.dart';
import 'package:walk_point_u_r_i/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:walk_point_u_r_i/backend/firebase/firebase_config.dart';
import 'package:walk_point_u_r_i/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('US2: Login', () {
    testWidgets('LoginTest1', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(ValueKey('login-email_zsbl')), 'kerem_erkmen@uri.edu');
      await tester.enterText(
          find.byKey(ValueKey('login-password_92ml')), 'kerem123');
      await tester.tap(find.byKey(ValueKey('login-button_dhsu')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('New Route'), findsWidgets);
    });

    testWidgets('Password-Incorrect-Test', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(ValueKey('login-email_zsbl')), 'kerem_erkmen@uri.edu');
      await tester.enterText(
          find.byKey(ValueKey('login-password_92ml')), 'kerem_123');
      await tester.tap(find.byKey(ValueKey('login-button_dhsu')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Don\'t Have An Account? Signup!'), findsWidgets);
    });

    testWidgets('Invalid-Email-Test', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(ValueKey('login-email_zsbl')), 'keremErmen@uri.edu');
      await tester.enterText(
          find.byKey(ValueKey('login-password_92ml')), 'kerem123');
      await tester.tap(find.byKey(ValueKey('login-button_dhsu')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Don\'t Have An Account? Signup!'), findsWidgets);
    });

    testWidgets('No-Input-Login-Test', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('login-button_dhsu')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Don\'t Have An Account? Signup!'), findsWidgets);
    });

    testWidgets('Invalid-Email-Format', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(ValueKey('login-email_zsbl')), 'kerem_erkmen');
      await tester.enterText(
          find.byKey(ValueKey('login-password_92ml')), 'kerem123');
      await tester.tap(find.byKey(ValueKey('login-button_dhsu')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Don\'t Have An Account? Signup!'), findsWidgets);
    });

    testWidgets('navigate-to-sign-up', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('toSignUpButton_4izg')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Already Have An Account? Login!'), findsWidgets);
    });
  });

  testWidgets('SignUp-Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SignUpWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(ValueKey('signup-email_di2a')), 'testUser@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('signup-username_req5')), 'testUser');
    await tester.enterText(
        find.byKey(ValueKey('signup-password_neis')), 'Password');
    // aaa
    await tester.enterText(
        find.byKey(ValueKey('Singup-ConfirmPassword_5eb4')), 'Password');
    await tester.tap(find.byKey(ValueKey('signup-button_e7e8')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.byKey(ValueKey('genderDropDown_t7i5')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
