import 'package:flutter_svg/svg.dart';

import '../../../commons.dart';
import '../../../widgets/custom_app_bar.dart';

class ProfileGantiBahasaView extends StatelessWidget {
  const ProfileGantiBahasaView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedLanguages = ValueNotifier('id');
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pilih Bahasa',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: ValueListenableBuilder<String>(
          valueListenable: selectedLanguages,
          builder: (context, value, _) {
            return Column(
              children: [
                ContainerCardWidget(
                    flag: AppIcons.icFlagIndonesian,
                    title: 'Bahasa Indonesia',
                    isSelected: value == 'id',
                    onTap: () => selectedLanguages.value = 'id'),
                kGap12,
                ContainerCardWidget(
                    flag: AppIcons.icFlagEnglish,
                    title: 'Inggris',
                    isSelected: value == 'en',
                    onTap: () => selectedLanguages.value = 'en'),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ContainerCardWidget extends StatelessWidget {
  const ContainerCardWidget({
    super.key,
    required this.flag,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String flag;
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: kPadd12,
        decoration: BoxDecoration(
          borderRadius: kRadius8,
          color: AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.lavender : AppColors.black,
          ),
          boxShadow: const [
            BoxShadow(offset: extraSmallShadow),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(flag),
            kGap10,
            Text(
              title,
              style: AppStyles.comfortaa12Bold.copyWith(
                color: isSelected ? AppColors.lavender : AppColors.black,
              ),
            ),
            const Spacer(),
            isSelected
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.lavender,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
