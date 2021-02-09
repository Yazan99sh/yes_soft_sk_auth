
import 'package:chat_testing/Module_auth/service/auth_service/auth_service.dart';
import 'package:chat_testing/consts/urls.dart';
import 'package:chat_testing/module_network/http_client/http_client.dart';
import 'package:chat_testing/module_profile/request/profile/profile_request.dart';

class ProfileRepository {
  ApiClient _apiClient;

  Future<bool> createProfile(ProfileRequest profileRequest,token) async {
    _apiClient = ApiClient();
    var headers= {"Content-Type":"application/json","Authorization":'Bearer'+token};
    dynamic response = await _apiClient.post(
    Urls.PROFILE,
   headers,
   profileRequest.toJson(),
    );

    if (response['status_code'] == '201') return true;

    return false;
  }
  Future<bool> getProfile(token) async {
    _apiClient = ApiClient();
    var headers= {"Content-Type":"application/json","Authorization":'Bearer'+token};
    dynamic response = await _apiClient.get(
      Urls.PROFILE,
      headers,
    );

    if (response['status_code'] == '201') return response;

    return false;
  }
}
