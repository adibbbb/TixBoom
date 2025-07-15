import '../../../commons.dart';

GestureDetector eventLabel({
  required String title,
  TextStyle? textStyle = AppStyles.comfortaa10Bold,
  Color? bgColor = AppColors.golden,
  Color? textColor = AppColors.black,
  EdgeInsets? padding = kPadd6,
  final void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: padding ?? kPadd6,
      decoration: BoxDecoration(
        border: Border.all(),
        color: bgColor,
        borderRadius: kRadius4,
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        title,
        style: (textStyle ?? AppStyles.comfortaa10Bold).copyWith(
          color: textColor ?? AppColors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      ),
    ),
  );
}

Column labelCard(
    {required String title,
    required String desc,
    void Function()? onTapSeeOther}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.golden,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Text(
              title,
              style: AppStyles.comfortaa10Bold,
            ),
          ),
          InkWell(
            onTap: onTapSeeOther,
            child: Row(
              children: [
                Text(
                  'Lihat Lainnya',
                  style: AppStyles.comfortaa8Bold
                      .copyWith(color: AppColors.lavender),
                ),
                kGap2,
                const Icon(
                  color: AppColors.lavender,
                  Icons.arrow_forward_rounded,
                  size: 10,
                )
              ],
            ),
          )
        ],
      ),
      kGap8,
      Text(
        desc,
        style: AppStyles.comfortaa8Bold,
      ),
    ],
  );
}
