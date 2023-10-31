import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';
import 'package:lifleta_admin/core/utils/assets_manager.dart';
import 'package:lifleta_admin/core/utils/values_manager.dart';

class AddEmployeeImageSection extends StatelessWidget {
  const AddEmployeeImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInLeft(
            child: SvgPicture.asset(
              AssetsManager.addEmployeeIMG,
              height: size / 3,
              width: size / 3,
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          FadeInDown(
            child: Text(
              AppString.addNewEmployeeText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
