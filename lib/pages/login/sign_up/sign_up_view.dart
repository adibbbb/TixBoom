import 'package:tixboom/app/extensions.dart';

import '../../../commons.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocusKeyboard();
      },
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          children: [
            Image.asset(
              height: 50,
              width: 90,
              AppImages.imglogoTixBoom,
            ),
            kGap40,
            _header(),
            kGap22,
            _formSignUp(),
            kGap30,
            _orSection(),
            kGap16,
            _anotherRegister(),
            kGap24,
            _signInSection()
          ],
        ),
      ),
    );
  }

  Column _header() {
    return const Column(
      children: [
        Text(
          'Welcome Back 👋',
          style: AppStyles.comfortaa24Bold,
          textAlign: TextAlign.center,
        ),
        kGap12,
        Text(
          'Hey, Enter you details to get sign up \nto your account',
          style: AppStyles.comfortaa12Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container _formSignUp() {
    return Container(
      padding: kPadd16,
      decoration: bigborderStyle,
      child: Column(
        children: [
          const CustomTextFormField(
            hintText: 'Nama',
          ),
          kGap20,
          const CustomTextFormField(
            hintText: 'Email',
          ),
          kGap20,
          const CustomTextFormFieldPassword(
            hintText: 'Password',
          ),
          kGap20,
          const CustomTextFormFieldPassword(
            hintText: 'Confirm Password',
          ),
          kGap20,
          const CustomTextFormFieldPassword(
            hintText: 'Phone Number',
          ),
          kGap20,
          CustomButton(
            text: 'Sign Up',
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Stack _orSection() {
    return Stack(
      children: [
        const Divider(
          color: Color(0xffCFDFE2),
          thickness: 2,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            color: AppColors.brokenWhite,
            child: Text(
              'Or',
              style: AppStyles.comfortaa12Regular
                  .copyWith(color: const Color(0xff294957)),
            ),
          ),
        )
      ],
    );
  }

  Row _anotherRegister() {
    return Row(
      children: [
        Flexible(
          child: CustomButtonIcon(
            iconpath: AppIcons.icGoogle,
            onPressed: () {},
          ),
        ),
        kGap16,
        Flexible(
          child: CustomButtonIcon(
            iconpath: AppIcons.icfacebook,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  GestureDetector _signInSection() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppStyles.comfortaa14Regular.copyWith(color: AppColors.black),
          children: [
            const TextSpan(text: 'Already have Account? '),
            TextSpan(
              text: 'Sign In',
              style: AppStyles.comfortaa14Regular
                  .copyWith(color: AppColors.lavender),
            ),
          ],
        ),
      ),
    );
  }
}
