import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/doc_app.dart';

void main() {
  print("FAke push");
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
