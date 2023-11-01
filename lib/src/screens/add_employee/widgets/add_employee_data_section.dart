import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lifleta_admin/core/utils/color_manager.dart';
import 'package:lifleta_admin/core/utils/values_manager.dart';

import '../../../../common_widgets/custom_text_filed.dart';
import '../../../../core/utils/app_string.dart';

class AddEmployeeDataSection extends StatefulWidget {
  const AddEmployeeDataSection({super.key});

  @override
  State<AddEmployeeDataSection> createState() => _AddEmployeeDataSectionState();
}

class _AddEmployeeDataSectionState extends State<AddEmployeeDataSection> {
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
  XFile? userImage;
  final ImagePicker picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: FadeInDown(
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context,imageSetState) {
                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.08,
                        ),
                        Positioned(
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.grey.withOpacity(.5),
                            child: IconButton(
                              onPressed: () {
                                showDialog(context: context, builder: (_)=>Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ZoomIn(
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              onTap: () async {
                                                final image = await picker.pickImage(source: ImageSource.gallery);
                                                if(image !=null){
                                                  userImage = image;
                                                  imageSetState((){});
                                                }
                                                Navigator.pop(context);
                                              },
                                              leading: Icon(Icons.image),
                                              title: Text('Pick From Gallery'),
                                            ),
                                            ListTile(
                                              onTap: () async {
                                                userImage=null;
                                                // value.user.photoUrl='';
                                                imageSetState((){});
                                                //ToDo : Remove Photo
                                                Navigator.pop(context);
                                              },
                                              leading: Icon(Icons.highlight_remove_rounded),
                                              title: Text('Delete Photo'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                              },
                              icon: Icon(
                                Icons.add_photo_alternate_outlined,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                TextFiledApp(
                  controller: firstNameController,
                  hintText: AppString.firstNameText,
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                TextFiledApp(
                  controller: emailController,
                  hintText: AppString.emailText,
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                TextFiledApp(
                  controller: phoneNumberController,
                  hintText: AppString.phoneNumberText,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                TextFiledApp(
                  controller: idController,
                  hintText: AppString.idNumberText,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                StatefulBuilder(
                  builder: (context,setStateDateBirth) {
                    return TextFiledApp(
                      onTap: ()async{
                        final picker = await showDatePicker(
                            context: context
                            , initialDate: DateTime.now(),
                            firstDate: DateTime(1960)
                            , lastDate: DateTime.now());
                        if(picker!=null){
                          dateBirthController.text = DateFormat.yMd().format(picker);
                        }
                      },
                      readOnly: true,
                      controller: dateBirthController,
                      hintText: AppString.dateOfBirthText,
                    );
                  }
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14
                    ),
                    border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: AppString.sexText,
                    filled: true,
                    fillColor: ColorManager.white,
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Filed is required*';
                    }
                  },
                    items: AppString.sexListText
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                    genderController.text = value.toString();
                    }),
                SizedBox(
                  height: AppSize.s20,
                ),
                TextFiledApp(
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
                      if(_formKey.currentState!.validate()){
                        Navigator.pop(context);
                      }
                    },
                    child: Text(AppString.addNewEmployeeText))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
