import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';
import 'package:lifleta_admin/core/utils/color_manager.dart';

import 'widgets/add_employee_data_section.dart';
import 'widgets/add_employee_image_section_widget.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: AddEmployeeImageSection()),
            VerticalDivider(
              color: ColorManager.primaryColor,
            ),
            Expanded(child: AddEmployeeDataSection()),
          ],
        ),
      ),
    );
  }
}
