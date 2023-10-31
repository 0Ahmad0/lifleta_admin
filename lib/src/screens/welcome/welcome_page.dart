import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/color_manager.dart';
import 'package:lifleta_admin/src/screens/welcome/widgets/login_section_widget.dart';

import '../../../common_widgets/logo_ection_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: LogoSection()),
            VerticalDivider(
              color: ColorManager.primaryColor,
            ),
            Expanded(child: LoginSection()),
          ],
        ),
      ),
    );
  }
}
