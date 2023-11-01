import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta_admin/core/utils/theme_manager.dart';
import 'package:lifleta_admin/src/screens/add_employee/add_employee_page.dart';
import 'package:lifleta_admin/src/screens/display_employees/display_employees_page.dart';
import 'package:lifleta_admin/src/screens/welcome/welcome_page.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeManager.myTheme,
        home: DisplayEmployeePage(),
      ),
    );
  }
}
