import 'package:flutter/material.dart';
import 'package:tscurbing/auth/services/user_provider.dart';
import 'package:tscurbing/auth/services/user_role_director.dart';

class AppHost extends StatelessWidget {
  final Widget navigationHost;
  final Widget userHost;
  final List<UserRoleModel> items;
  AppHost({Key key, this.navigationHost, this.userHost, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProvider(child: navigationHost, loggedIn: userHost, roleModels: items);
  }
}
