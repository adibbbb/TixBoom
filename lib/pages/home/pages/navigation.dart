import 'package:flutter_svg/svg.dart';

import '../../../commons.dart';
import '../../my_tiket/my_tiket_view.dart';
import '../../profile/profile_view.dart';
import 'home_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int myIndex = 0;
  final PageController _pageController = PageController();
  late final List<Widget> pages;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeView(),
      const MyTiketView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        clipBehavior: Clip.none,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            myIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    // list navbar
    final List<Map<String, dynamic>> navItems = [
      {
        'icon': AppIcons.icHome,
        'label': 'Home',
      },
      {
        'icon': AppIcons.icMyticket,
        'label': 'My Tiket',
      },
      {
        'icon': AppIcons.icProfile,
        'label': 'Profil',
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.brokenWhite,
        borderRadius: kRadius12,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.42),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);

          setState(() {
            myIndex = index;
          });
        },
        items: [
          ...List.generate(
            navItems.length,
            (index) {
              return BottomNavigationBarItem(
                icon: _buttonNavWidget(
                  index: index,
                  icon: SvgPicture.asset(
                    navItems[index]['icon'],
                    height: 28,
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      myIndex == index ? AppColors.white : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: navItems[index]['label'],
              );
            },
          )
        ],
      ),
    );
  }

  Container _buttonNavWidget({required Widget icon, required int index}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: kPadd6,
      decoration: BoxDecoration(
        borderRadius: kRadius6,
        color: myIndex == index ? const Color(0xffB27FFF) : AppColors.white,
        border: Border.all(color: AppColors.black),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black,
            offset: extraSmallShadow,
          ),
        ],
      ),
      child: icon,
    );
  }
}
