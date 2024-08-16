import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // to fix .sp font bug in screenUtil, in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
