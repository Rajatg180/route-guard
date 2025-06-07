# route_guard

[![pub version](https://img.shields.io/pub/v/route_guard.svg)](https://pub.dev/packages/route_guard)

A simple Flutter package for protecting routes with async guards like authentication.

## Features

 • Async guards

 • Custom redirection

 • Custom loading indicator

## Usage

```dart
RouteGuard(
  guard: (_) async => isLoggedIn,
  redirectTo: '/login',
  child: HomePage(),
)
