import 'package:flutter/material.dart';
import 'package:peminjam_perpustakaan_kelasc/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({super.key, required this.onProfileTap, required this.onSignOut,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.greenAccent,
      child: Column(
        children: [
          //header
          DrawerHeader(child: Icon(
            Icons.person,
            color: Colors.cyan,
            size:64,
          ),
          ),
          
          //home
          MyListTile(icon: Icons.home, text: 'H O M E',
          onTap: () => Navigator.pop(context),
          ),
          
          //profile
          MyListTile(
            icon: Icons.person,
            text: 'P R O F I L E',
            onTap: onProfileTap,
          ),
          
          //logout
          MyListTile(
            icon: Icons.logout,
            text: 'LOGOUT',
            onTap: onSignOut,
          )

        ],
      ),
    );
  }
}
