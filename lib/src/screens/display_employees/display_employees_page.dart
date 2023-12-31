import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/assets_manager.dart';
import 'package:lifleta_admin/core/utils/values_manager.dart';
import 'package:lifleta_admin/src/screens/add_employee/add_employee_page.dart';
import 'package:lifleta_admin/src/screens/display_employees/widgets/build_drawer.dart';

import '../../../core/utils/app_string.dart';
import 'widgets/employee_item.dart';

class DisplayEmployeePage extends StatelessWidget {
  const DisplayEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Image.asset(AssetsManager.logoIMG,
          width: 80,
          height: 80,),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (_)=>AddEmployeePage()));
        },
        label: Text(AppString.addNewEmployeeText),
        icon: Icon(Icons.add),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(AppPadding.p12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
          ),
          itemCount: 25,
          itemBuilder: (_, index) => EmployeeItem(index: index,)
      ),
    );
  }
}
