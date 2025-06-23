import '../../../commons.dart';

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
