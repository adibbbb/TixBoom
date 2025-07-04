// class LoginModels {
//   final String email;
//   final String password;
//   final String? token;

//   LoginModels({
//     required this.email,
//     required this.password,
//     this.token,
//   });

//   Map<String, dynamic> toJson() => {
//         'email': email,
//         'password': password,
//       };

//   factory LoginModels.fromJson(Map<String, dynamic> json,
//       {String? email = '', String? password = ''}) {
//     return LoginModels(
//       email: email ?? '',
//       password: password ?? '',
//       token: json['token'],
//     );
//   }
// }
