import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../m_user/common/user_host/user_host.dart';
import '../../auth/model/user.dart';
import '../../auth/services/user_role_director.dart';
import '../../m_admin/common/navigation_host/admin_host.dart';
import '../../common/utils/utils.dart';
import '../../common/dialog_utils/dialog_service.dart';
import '../../common/locator/locator.dart';
import '../services/auth_service.dart';
import '../model/base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<dynamic> signIn(
    String email,
    String password,
  ) async {
    setBusy(true);
    var result = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => setBusy(false))
        .catchError((error) => _dialogService.showDialog(title: 'Oops!', body: error.message));
    if (result.user != null) {
      return navigateBack();
    }

    return false;
  }

  Future<bool> createAccount(String email, String password,
      {String firstName, String lastName, String userRole = 'User'}) async {
    setBusy(true);
    var result = await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => setBusy(false))
        .catchError((error) => _dialogService.showDialog(title: 'Oops!', body: error.message));
    if (result.user != null) {
      await _authenticationService.createUser(User(
          email: email,
          uid: result.user.uid,
          firstName: firstName,
          fullName: '$firstName $lastName',
          userRole: userRole));
      return navigateBack();
    }

    return true;
  }

  Future<dynamic> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var response = await _auth
        .signInWithCredential(credential)
        .whenComplete(() => setBusy(false))
        .catchError((error) => _dialogService.showDialog(title: 'Oops!', body: error.message));
    if (response.user != null) {
      return navigateBack();
    }

    return false;
  }

   signOut() async {
    _auth.signOut();
    GoogleSignIn().signOut();
    return Future.delayed(Duration.zero);
  }



  get userRoles => <UserRoleModel>[
  	UserRoleModel(userRole: 'User',child: UserHost()),
    UserRoleModel(userRole: 'Admin',child: AdminHost())
  ];
}
