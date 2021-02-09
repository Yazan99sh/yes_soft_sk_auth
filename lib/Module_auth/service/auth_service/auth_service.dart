import 'package:chat_testing/Module_auth/manager/Auth_manager/auth_manager.dart';
import 'package:chat_testing/Module_auth/repository/auth/auth_repository.dart';
import 'package:chat_testing/Module_auth/request/login_request/LoginRequest_Api.dart';
import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/request/register_request/register_request.dart';
import 'package:chat_testing/consts/urls.dart';
import 'package:chat_testing/module_network/http_client/http_client.dart';
import 'package:chat_testing/module_profile/service/profile/profile.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthRepository authRepository ;
  AuthManager authManager;
  ApiClient _apiClient;

  Future <void> registerUser(String username ,String email,String password ) async {
    authRepository = AuthRepository();
    authManager = AuthManager(authRepository);
    _apiClient = ApiClient();
    ProfileService profileService = ProfileService();
    String uId;
    try {
     uId = await authManager.register(RegisterRequest(username: username , email: email , password: password));
    }catch(e){
      print(e);
    }
    if (uId != null) {
      var headers = {"Content-Type": "application/json"};
      var body = {"userID": "$uId","password":"$password"};
      var result = await _apiClient.post(Urls.API_SIGN_UP, headers, body);
      print(result);
      print("=================");
      var token = await authManager.loginApi(LoginRequestApi(username: uId,password: password));
      print(token);
      print("===============");
      profileService.createProfile(username, token);
    }
  }
  Future <void> loginUser(String email,String password) async {
    authRepository = AuthRepository();
    authManager = AuthManager(authRepository);
    _apiClient = ApiClient();
    ProfileService profileService = ProfileService();
    var uId;
    try {
      uId = await authManager.login(LoginRequest(email: email ,password: password));
    }catch(e){
      print(e);
    }
    if (uId != null) {
      print("=================");
      var token = await authManager.loginApi(LoginRequestApi(username: uId,password: password));
      print(token);
      print("===============");
    }
  }

  Future <void> resetPassword(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
    } catch (e) {
      print(e);
    }
  }
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
