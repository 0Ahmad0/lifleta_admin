import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';
import 'package:lifleta_admin/core/utils/color_manager.dart';
import 'package:lifleta_admin/core/utils/values_manager.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lifleta_admin/src/screens/add_employee/add_employee_page.dart';

import '../../profile/profile_page.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return FadeInLeft(
      key: Key(index.toString()),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddEmployeePage())),
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(8.0)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: (size > 750) ? size * 0.05 : size * 0.05,
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text(
                        'Employee Name',
                        style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Visibility(
                        visible: MediaQuery.of(context).size.width > 750,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            Text(
                              'Email.com',
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            Text(
                              'PhoneNumber',
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              right: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddEmployeePage()));
                  },
                  icon: CircleAvatar(
                    backgroundColor: ColorManager.white,
                    child: Icon(
                      Icons.edit,
                      color: ColorManager.grey,
                      size: 20,
                    ),
                  )),
            ),
            IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.rightSlide,
                  title: AppString.areYouSure,
                  width: MediaQuery.of(context).size.width / 3,
                  desc: AppString.deleteThisEmployee,
                  btnCancelOnPress: (){},
                  btnOkOnPress: () {
                    //ToDO:
                  },
                )..show();
              },
              icon: CircleAvatar(
                backgroundColor: ColorManager.white,
                child: Icon(
                  Icons.delete,
                  color: ColorManager.error,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
