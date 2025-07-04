import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tixboom/app/app_typedef.dart';

import '../app/error_handler.dart';

class LoginService {
  final Dio _dio = Dio();

  // ketika uda pakai resultFuture untuk ngereturn data harus pakai right

  ResultFuture<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://reqres.in/api/login',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            'x-api-key': 'reqres-free-v1',
          },
        ),
      );

      String token = response.data['token'] ?? "";
      return Right(token);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
