import 'package:provider/provider.dart';
import 'package:tixboom/app/finite_state.dart';
import 'package:tixboom/provider/login_provider.dart';

import '../../../app/custom_transition.dart';
import '../../../commons.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../app/extensions.dart';

import '../sign_up/sign_up_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocusKeyboard();
      },
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 80),
          children: [
            Image.asset(
              height: 50,
              width: 90,
              AppImages.imglogoTixBoom,
            ),
            kGap40,
            // ----------------------------------------------
            // Welcome Back Section
            // ----------------------------------------------
            _header(),
            kGap22,

            // ----------------------------------------------
            // Form Login Section
            // ----------------------------------------------
            _formLogin(),
            kGap30,

            // ----------------------------------------------
            // Or Section
            // ----------------------------------------------
            _orSection(),
            kGap16,

            // ----------------------------------------------
            // Another Login Section
            // ----------------------------------------------
            _anotherLoginSection(),
            kGap60,

            // ----------------------------------------------
            // SignUp
            // ----------------------------------------------
            _signUpSection()
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
          'Hey, Enter you details to get sign in \nto your account',
          style: AppStyles.comfortaa12Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container _formLogin() {
    return Container(
      padding: kPadd16,
      decoration: bigborderStyle,
      child: Consumer<LoginProvider>(
        builder: (context, prov, _) {
          var state = prov.state;
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                kGap20,
                CustomTextFormFieldPassword(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                kGap12,
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: AppStyles.comfortaa12Bold.copyWith(
                        color: AppColors.lavender,
                      ),
                    ),
                  ),
                ),
                kGap12,
                CustomButton(
                  text: isLoading(state) ? 'Loading...' : 'Login',
                  onPressed: isLoading(state)
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await prov.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              context,
                            );
                          }
                        },
                ),
              ],
            ),
          );
        },
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

  Row _anotherLoginSection() {
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
            iconpath: AppIcons.icFacebook,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  GestureDetector _signUpSection() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlidePageRoute(page: const SignUpView()));
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppStyles.comfortaa14Regular.copyWith(color: AppColors.black),
          children: [
            const TextSpan(text: 'Don’t have Account? '),
            TextSpan(
              text: 'Sign up',
              style: AppStyles.comfortaa14Regular
                  .copyWith(color: AppColors.lavender),
            ),
          ],
        ),
      ),
    );
  }
}
