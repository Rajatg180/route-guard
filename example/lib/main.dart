import 'package:flutter/material.dart';
import 'package:route_guard/route_guard.dart';

bool isLoggedIn = false;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/home': (_) => RouteGuard(
              guard: (_) async => isLoggedIn,
              redirectTo: '/',
              child: const HomePage(),
            ),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            isLoggedIn = true;
            Navigator.pushNamed(context, '/home');
          },
          child: const Text('Login and Go to Home'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('Welcome! You are logged in.')),
    );
  }
}
