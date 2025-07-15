import '../../../app/custom_transition.dart';
import '../../../commons.dart';
import '../../../widgets/custom_circle_avatar.dart';
import '../../home/widgets/label_card.dart';
import '../section/profile_ganti_bahasa_view.dart';
import '../section/profile_settings_view.dart';
import '../section/profile_tentang_tixboom_view.dart';
import '../widget/profile_menu_widget.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brokenWhite,
        title: eventLabel(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          title: 'Profile',
        ),
      ),
      body: Column(
        children: [
          kGap7,
          _userProfileCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            child: Column(
              children: [
                const ProfileMenuWidget(
                  iconPath: AppIcons.icWallet,
                  title: 'Pembayaran',
                ),
                ProfileMenuWidget(
                  icon: Icons.language,
                  title: 'Ganti Bahasa',
                  isHasTrailingText: true,
                  onTap: () {
                    Navigator.push(context,
                        SlidePageRoute(page: const ProfileGantiBahasaView()));
                  },
                ),
                ProfileMenuWidget(
                  iconPath: AppIcons.icShieldSearch,
                  title: 'Tentang Tixboom',
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const ProfileTentangTixboomView(),
                      ),
                    );
                  },
                ),
                ProfileMenuWidget(
                  icon: Icons.settings_outlined,
                  title: 'Pengaturan',
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const ProfileSettingsView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _userProfileCard() {
    return Container(
      padding: kPadd22,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: const Color(
                0xffB1B1B1,
              ).withOpacity(0.5)),
              bottom: BorderSide(
                  color: const Color(
                0xffB1B1B1,
              ).withOpacity(0.5)))),
      child: Container(
        padding: kPadd10,
        decoration: BoxDecoration(
            borderRadius: kRadius12,
            color: AppColors.white,
            border: Border.all(color: AppColors.black),
            boxShadow: const [BoxShadow(offset: smallShadow)]),
        child: Row(
          children: [
            const CustomCircleAvatar(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0S7RQyXhjkYiw6xedIdPd-3E7t7qXPr0JGw&s',
              radiusCircle: 29,
            ),
            kGap10,
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ryujin Soedibyo',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.comfortaa16Bold,
                  ),
                  kGap4,
                  Text(
                    'sudibyoryujin@gmail.com',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.comfortaa10Bold
                        .copyWith(color: AppColors.darkGray),
                  ),
                  Text(
                    '+62 8912-3489-2023',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.comfortaa10Bold
                        .copyWith(color: AppColors.darkGray),
                  ),
                ],
              ),
            ),
            const Spacer(),
            eventLabel(
              title: 'Edit',
              bgColor: AppColors.lavender,
              textColor: AppColors.white,
              onTap: () {
                Navigator.push(
                    context, SlidePageRoute(page: const EditProfileView()));
              },
            )
          ],
        ),
      ),
    );
  }
}
