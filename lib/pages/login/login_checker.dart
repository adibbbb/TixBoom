import 'package:provider/provider.dart';

import '../../commons.dart';
import '../../provider/login_provider.dart';
import '../../widgets/shimmer.dart';
import '../home/pages/navigation.dart';
import 'sign_in_view.dart';

class LoginChecker extends StatefulWidget {
  const LoginChecker({super.key});

  @override
  State<LoginChecker> createState() => _LoginCheckerState();
}

class _LoginCheckerState extends State<LoginChecker> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    await provider.loadToken();

    // tunggu sebentar biar loading keliatan
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context);
    if (isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.brokenWhite,
        body: ShimmerListWidget(),
      );
    }

    if (prov.token != null && (prov.token ?? '').isNotEmpty) {
      return const Navigation();
    } else {
      return const LoginView();
    }
  }
}
