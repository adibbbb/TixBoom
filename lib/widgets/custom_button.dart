import 'package:flutter_svg/flutter_svg.dart';

import '../commons.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsets margin;

  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 40,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.lavender,
    this.textStyle,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: kRadius8,
        color: backgroundColor,
        border: Border.all(
          color: AppColors.black,
        ),
        boxShadow: const [
          BoxShadow(offset: smallShadow),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              AppStyles.comfortaa12Medium.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  final double width;
  final double height;
  final String iconpath;
  final void Function()? onPressed;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsets margin;

  const CustomButtonIcon({
    super.key,
    this.width = double.infinity,
    this.height = 40,
    required this.onPressed,
    this.backgroundColor = AppColors.magenta,
    this.textStyle,
    this.margin = EdgeInsets.zero,
    this.iconpath = "",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kRadius8,
      onTap: onPressed,
      child: Container(
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: kRadius8,
            color: backgroundColor,
            border: Border.all(
              color: AppColors.black,
            ),
            boxShadow: const [
              BoxShadow(offset: smallShadow),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              iconpath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
