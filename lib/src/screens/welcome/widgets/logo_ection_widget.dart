import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FadeInUp(
            child: Text(
              AppString.ayaText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            )),
      ],
    );
  }
}
