import '../../../commons.dart';
import '../../../widgets/custom_app_bar.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Pengaturan'),
    );
  }
}
