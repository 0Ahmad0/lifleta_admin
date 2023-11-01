import 'package:flutter/material.dart';
import 'package:lifleta_admin/core/utils/app_string.dart';
import 'package:lifleta_admin/src/screens/profile/profile_page.dart';
import 'package:lifleta_admin/src/screens/welcome/welcome_page.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
        UserAccountsDrawerHeader(
            accountName: Text('Admin Admin'),
            accountEmail: Text('admin@admin.com'),
          currentAccountPicture: CircleAvatar(),
        ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage()));
            },
            leading: Icon(Icons.person),
            title: Text(AppString.profileText),
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WelcomePage()));
            },
            leading: Icon(Icons.logout),
            title: Text(AppString.logoutText),
          ),
        ],
      ),
    );
  }
}
