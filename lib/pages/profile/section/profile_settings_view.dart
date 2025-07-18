import '../../../commons.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widget/profile_menu_widget.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pengaturan'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        children: const [
          ProfileMenuWidget(
            icon: Icons.lock,
            iconColor: AppColors.black,
            title: 'Ganti Kata Sandi',
          ),
          ProfileMenuWidget(
            iconPath: AppIcons.icNotificationSettings,
            iconColor: AppColors.black,
            title: 'Notifikasi',
          ),
          ProfileMenuWidget(
            iconPath: AppIcons.icTrashBin,
            iconColor: AppColors.black,
            title: 'Hapus Akun',
          ),
          ProfileMenuWidget(
            iconPath: AppIcons.icLogout,
            iconColor: AppColors.magenta,
            textColor: AppColors.magenta,
            title: 'Keluar',
          ),
        ],
      ),
    );
  }
}
