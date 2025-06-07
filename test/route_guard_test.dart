import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:route_guard/route_guard.dart';

void main() {
  testWidgets('RouteGuard shows child when allowed', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RouteGuard(
        guard: (_) async => true,
        redirectTo: '/login',
        child: const Text('Welcome'),
      ),
    ));

    await tester.pumpAndSettle(); // Wait for async
    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('RouteGuard redirects when denied', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/login': (_) => const Text('Login Page'),
      },
      home: RouteGuard(
        guard: (_) async => false,
        redirectTo: '/login',
        child: const Text('Protected Page'),
      ),
    ));

    await tester.pumpAndSettle();
    expect(find.text('Login Page'), findsOneWidget);
  });
}
