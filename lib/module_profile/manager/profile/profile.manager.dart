import 'package:chat_testing/module_profile/repository/profile/profile.repository.dart';
import 'package:chat_testing/module_profile/request/profile/profile_request.dart';
class ProfileManager {
  final ProfileRepository _repository;

  ProfileManager(
    this._repository,
  );

  Future<bool> createProfile(ProfileRequest profileRequest,token) async =>
      await _repository.createProfile(profileRequest,token);
  Future<dynamic> getProfile(token) async =>
      await _repository.getProfile(token);
  Future<dynamic> updateProfile(token,ProfileRequest profileRequest) async =>
      await _repository.updateProfile(token,profileRequest);
}
