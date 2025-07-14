import 'package:flutter_svg/svg.dart';

import '../../../commons.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final String? iconPath;
  final IconData? icon;
  final bool isHasTrailingText;
  final void Function()? onTap;

  const ProfileMenuWidget({
    super.key,
    required this.title,
    this.icon,
    this.iconPath,
    this.isHasTrailingText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingIcon;
    if (iconPath != null) {
      leadingIcon = SvgPicture.asset(
        iconPath ?? '',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(AppColors.mint, BlendMode.srcIn),
      );
    } else if (icon != null) {
      leadingIcon = Icon(icon, size: 24, color: AppColors.mint);
    } else {
      leadingIcon = const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: kRadius8,
          border: Border.all(),
          boxShadow: const [BoxShadow(offset: smallShadow)],
        ),
        child: Row(
          children: [
            leadingIcon,
            kGap10,
            Text(
              title,
              style: AppStyles.comfortaa14Bold,
            ),
            const Spacer(),
            if (isHasTrailingText)
              Text(
                'IDN',
                style: AppStyles.comfortaa10Bold
                    .copyWith(color: AppColors.darkGray),
              )
          ],
        ),
      ),
    );
  }
}
