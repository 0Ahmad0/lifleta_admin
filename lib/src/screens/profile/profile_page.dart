import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifleta_admin/src/screens/welcome/welcome_page.dart';

import '../../../common_widgets/custom_text_filed.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/values_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final photoUrlController = TextEditingController();
  final genderController = TextEditingController();
  final dateBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    idController.dispose();
    passwordController.dispose();
    photoUrlController.dispose();
    genderController.dispose();
    dateBirthController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Image.asset(AssetsManager.logoIMG,
            width: 80,
            height: 80,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ZoomIn(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.08,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: firstNameController,
                    hintText: AppString.firstNameText,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: emailController,
                    hintText: AppString.emailText,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: phoneNumberController,
                    hintText: AppString.phoneNumberText,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: idController,
                    hintText: AppString.idNumberText,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: dateBirthController,
                    hintText: AppString.dateOfBirthText,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    controller: genderController,
                    hintText: AppString.sexText,
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFiledApp(
                    readOnly: true,
                    obscureText: true,
                    suffixIcon: true,
                    controller: passwordController,
                    hintText: AppString.passwordText,
                  ),
                  SizedBox(
                    height: AppSize.s40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60)),
                      onPressed: () {

                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>WelcomePage()));
                      },
                      child: Text(AppString.logoutText))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
