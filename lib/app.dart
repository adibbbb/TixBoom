import 'package:provider/provider.dart';

import 'commons.dart';
import 'pages/login/login_checker.dart';
import 'provider/login_provider.dart';

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
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: AppColors.brokenWhite,
          fontFamily: 'Comfortaa',
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: AppColors.brokenWhite,
            //todo
            selectedItemColor: AppColors.lavender,
            selectedLabelStyle: AppStyles.comfortaa10Bold,
            unselectedLabelStyle: AppStyles.comfortaa10Bold,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        home: const LoginChecker(),
      ),
    );
  }
}
