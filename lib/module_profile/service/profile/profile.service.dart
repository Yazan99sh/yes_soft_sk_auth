
import 'package:chat_testing/Module_auth/presistance/auth_prefs_helper.dart';
import 'package:chat_testing/module_profile/manager/profile/profile.manager.dart';
import 'package:chat_testing/module_profile/repository/profile/profile.repository.dart';
import 'package:chat_testing/module_profile/request/profile/profile_request.dart';

class ProfileService {
   ProfileManager _manager;
   ProfileRepository _repository;
  // ProfileService(
  //   this._manager,
  // );

  Future<bool> createProfile(String userName,token) async {
    _repository = ProfileRepository();
    _manager = ProfileManager(_repository);
    ProfileRequest profileRequest = ProfileRequest(
      userName:userName
    );
    return await _manager.createProfile(profileRequest,token);
  }
   Future<dynamic> getProfile() async {
     AuthPrefsHelper authPrefsHelper = AuthPrefsHelper();
     _repository = ProfileRepository();
     _manager = ProfileManager(_repository);
     String token = await authPrefsHelper.getToken();
     var data = await _manager.getProfile(token);
     return data;
   }
   Future<dynamic> updateProfile(userName) async {
     AuthPrefsHelper authPrefsHelper = AuthPrefsHelper();
     _repository = ProfileRepository();
     _manager = ProfileManager(_repository);
     String token = await authPrefsHelper.getToken();
     return await _manager.updateProfile(token,ProfileRequest(userName: userName));
   }
}
