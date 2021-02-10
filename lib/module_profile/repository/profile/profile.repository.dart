import 'package:chat_testing/consts/urls.dart';
import 'package:chat_testing/module_network/http_client/http_client.dart';
import 'package:chat_testing/module_profile/request/profile/profile_request.dart';

class ProfileRepository {
  ApiClient _apiClient;

  Future<bool> createProfile(ProfileRequest profileRequest,token) async {
    _apiClient = ApiClient();
    var headers= {"Content-Type":"application/json","Authorization":'Bearer $token'};
    dynamic response = await _apiClient.post(
    Urls.PROFILE,
   headers,
   profileRequest.toJson(),
    );

    if (response['status_code'] == '201' || response['status_code'] == '200') return true;

    return false;
  }
  Future<dynamic> getProfile(token) async {
    _apiClient = ApiClient();
    var headers= {"Content-Type":"application/json","Authorization":'Bearer $token'};
    dynamic response = await _apiClient.get(
      Urls.PROFILE,
      headers,
    );
    //print(token);
    if (response['status_code'] == '200') return response;

    return null;
  }
  Future<bool> updateProfile(token,ProfileRequest profileRequest) async {
    _apiClient = ApiClient();
    var headers= {"Content-Type":"application/json","Authorization":'Bearer $token'};
    dynamic response = await _apiClient.put(
      Urls.PROFILE,
      headers,
      profileRequest.toJson()
    );

    if (response['status_code'] == '200') return response;

    return false;
  }
}
