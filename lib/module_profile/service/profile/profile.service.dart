
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
    ProfileRequest profileRequest = new ProfileRequest(
      userName:userName
    );

    return await _manager.createProfile(profileRequest,token);
  }
   Future<dynamic> getProfile(token) async {

     return await _manager.getProfile(token);
   }
}
