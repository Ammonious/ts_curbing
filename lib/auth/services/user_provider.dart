import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/model/user.dart';
import '../../auth/services/auth_service.dart';
import '../../auth/services/user_role_director.dart';
import '../../common/locator/locator.dart';

class UserProvider extends StatelessWidget implements AutoRouteWrapper {
  final AuthenticationService model = locator<AuthenticationService>();
  final Widget loggedIn;
  final Widget child;
  final List<UserRoleModel> roleModels;
  UserProvider({Key key, this.loggedIn, this.roleModels, this.child}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) =>  StreamProvider.value(
    value: FirebaseAuth.instance.onAuthStateChanged,
    child: this,
  );


  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of(context);
    String uid = firebaseUser != null ? firebaseUser.uid : '';
    if (firebaseUser == null) return child;
    return StreamProvider.value(
        value: model.userStream(uid),
        child: roleModels == null
            ? loggedIn
            : Consumer<User>(
                builder: (context, user, child) => childBasedOnRole(user.userRole),
              ));
  }

  childBasedOnRole(String userRole) {
    Widget page = child;
    if (roleModels != null) {
      roleModels.forEach((userRoleModel) {
        if (userRole.trim() == userRoleModel.userRole.trim()) page = userRoleModel.child;
      });
    }
    return page;
  }

}
