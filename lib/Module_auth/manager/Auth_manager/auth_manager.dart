import 'package:chat_testing/Module_auth/repository/auth/auth_repository.dart';
import 'package:chat_testing/Module_auth/request/login_request/login_request.dart';
import 'package:chat_testing/Module_auth/request/register_request/register_request.dart';

class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<bool> register(RegisterRequest registerRequest) => _authRepository.createUser(registerRequest);

  Future<bool> login(LoginRequest loginRequest) => _authRepository.login(loginRequest);
}
