import 'package:tixboom/app/extensions.dart';
import 'package:tixboom/widgets/custom_text_form_field.dart';

import '../../../commons.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_circle_avatar.dart';
import '../../home/widgets/label_card.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocusKeyboard();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: 'Edit Profile',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------------------------------------
              // Unggah Foto atau ganti foto profil
              // ----------------------------------------------
              _uploadPhoto(),
              kGap26,

              // ----------------------------------------------
              // Form Edit profile
              // ----------------------------------------------
              const Row(
                children: [
                  Flexible(
                    child: CustomTextFormField(
                      hintText: 'Ryujin',
                    ),
                  ),
                  kGap10,
                  Flexible(
                    child: CustomTextFormField(
                      hintText: 'Soedibyo',
                    ),
                  ),
                ],
              ),
              kGap14,
              const CustomTextFormField(
                hintText: 'Sudibyoryujin@gmail.com',
              ),
              kGap14,
              CustomTextFormField(
                keyboardType: TextInputType.number,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 7),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: AppColors.black),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '+62',
                        style: AppStyles.comfortaa14Regular,
                      ),
                    ],
                  ),
                ),
                hintText: '8912-3489-2023',
              ),
              kGap14,
              Row(
                children: [
                  Expanded(
                    child: _dateCardWidget(
                      title: 'Hari',
                      desc: '-',
                    ),
                  ),
                  kGap10,
                  Expanded(
                    flex: 2,
                    child: _dateCardWidget(
                      title: 'Bulan',
                      desc: '-',
                    ),
                  ),
                  kGap10,
                  Expanded(
                    child: _dateCardWidget(
                      title: 'Tahun',
                      desc: '-',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 34),
          child: CustomButton(
            text: 'Simpan Perubahan',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  Container _dateCardWidget({required String title, required String desc}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(),
          borderRadius: kRadius8,
          boxShadow: const [BoxShadow(offset: smallShadow)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.comfortaa12Regular,
          ),
          Text(
            desc,
            style: AppStyles.comfortaa12Regular,
          )
        ],
      ),
    );
  }

  Container _uploadPhoto() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.48,
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
            radiusCircle: 24,
          ),
          kGap10,
          eventLabel(
            title: 'Unggah Foto',
            bgColor: AppColors.lavender,
            textColor: AppColors.white,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
