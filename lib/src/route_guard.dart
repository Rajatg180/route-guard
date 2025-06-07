import 'package:flutter/material.dart';


// A typedef is type in Dart that allows you to define a function signature
typedef GuardCallback = Future<bool> Function(BuildContext context);


// ignore: must_be_immutable
class RouteGuard extends StatelessWidget{

  final GuardCallback guard;
  Widget child;
  final String redirectTo;


  RouteGuard({
    super.key,
    required this.guard,
    required this.redirectTo,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: guard(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the guard to complete
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.data!) {
          // If the guard fails, redirect to the specified route
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed(redirectTo);
          });
          return const SizedBox.shrink(); // Return an empty widget while redirecting
       } else {
          // If the guard passes, show the child widget
          return child;
        }
      },
    );
  }
  
}
