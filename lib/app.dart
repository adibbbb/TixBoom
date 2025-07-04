import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/login/sign_in/sign_in_view.dart';
import 'provider/login_provider.dart';
import 'resources/colors_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TixBoom',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.brokenWhite,
          fontFamily: 'Comfortaa',
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
