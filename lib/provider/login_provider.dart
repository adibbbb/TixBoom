import 'package:flutter/material.dart';

import '../app/custom_transition.dart';
import '../app/error/failure.dart';
import '../app/finite_state.dart';
import '../pages/home/pages/home_view.dart';
import '../pages/login/sign_in_view.dart';
import '../services/login_service.dart';
import '../services/shared_pref_services.dart';

class LoginProvider with ChangeNotifier {
  Failure? failure;
  MyState state = MyState.initial;
  final LoginService _service = LoginService();
  String? token;

  Future login(String username, String password, BuildContext context) async {
    // ngubah state initial menjadi loading
    state = MyState.loading;
    notifyListeners();

    // Ini memanggil method login() dari LoginService yang mengembalikan result future
    final result = await _service.login(username, password);

    bool isSuccess = false;
    result.fold(
      (fail) {
        isSuccess = false;
        failure = fail; // Simpan detail error
        state = MyState.failed; // Ubah state jadi gagal
        notifyListeners();

        //muncul dialog error ketika gagal login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(fail.message),
            backgroundColor: Colors.red,
          ),
        );
      },
      (success) async {
        isSuccess = true;
        token = success; // Simpan token dari API
        state = MyState.loaded; // Ubah state jadi sukses
        notifyListeners();
        final prefs = await SharedPreferencesServices.getInstance();
        prefs.saveToken(success);

        // push halaman home
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: const HomeView(),
            ),
          );
        }
      },
    );

    return isSuccess;
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferencesServices.getInstance();
    token = prefs.readToken;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferencesServices.getInstance();
    await prefs.clearAll();

    token = null;
    state = MyState.initial;
    notifyListeners();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    }
  }
}
