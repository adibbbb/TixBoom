import '../../../commons.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widget/profile_menu_widget.dart';

class ProfileTentangTixboomView extends StatelessWidget {
  const ProfileTentangTixboomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tentang Tixboom',
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        children: const [
          ProfileMenuWidget(
            icon: Icons.info,
            iconColor: AppColors.black,
            title: 'Profile Tixboom',
          ),
          ProfileMenuWidget(
            iconPath: AppIcons.icFileSecurity,
            iconColor: AppColors.black,
            title: 'Kebijakan Privasi',
          ),
          ProfileMenuWidget(
            iconPath: AppIcons.icFileInfo,
            iconColor: AppColors.black,
            title: 'Syarat & Ketentuan',
          ),
        ],
      ),
    );
  }
}
