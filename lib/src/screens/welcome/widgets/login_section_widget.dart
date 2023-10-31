import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';
import 'package:lifleta_admin/src/screens/add_employee/add_employee_page.dart';
import 'package:lifleta_admin/src/screens/display_employees/display_employees_page.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDownBig(
              child: Image.asset(
                AssetsManager.logoIMG,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            TextFiledApp(
              controller: idController,
              hintText: AppString.idNumberText,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            TextFiledApp(
              suffixIcon: true,
              obscureText: true,
              controller: passwordController,
              hintText: AppString.passwordText,
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,60)
              ),
                onPressed: () {
                if(_formKey.currentState!.validate()){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>DisplayEmployeePage()));
                }
                },
                child: Text(
                  AppString.loginText,
                ))
          ],
        ),
        padding: const EdgeInsets.all(AppPadding.p12),
      ),
    );
  }
}
