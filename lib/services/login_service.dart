class LoginService {
  LoginService._internal();
  static final _singleton = LoginService._internal();
  factory LoginService() => _singleton;
}
