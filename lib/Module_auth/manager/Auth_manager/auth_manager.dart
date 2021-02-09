import 'package:chat_testing/Module_auth/repository/auth/auth_repository.dart';
import 'package:chat_testing/Module_auth/request/login_request/LoginRequest_Api.dart';
import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/request/register_request/register_request.dart';
import 'package:chat_testing/Module_auth/response/login_response.dart';

class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<dynamic> register(RegisterRequest registerRequest) => _authRepository.createUser(registerRequest);

  Future<bool> login(LoginRequest loginRequest) => _authRepository.login(loginRequest);
  Future<LoginResponse> loginApi(LoginRequestApi loginRequestApi) => _authRepository.loginApi(loginRequestApi);
}
