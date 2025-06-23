import '../../../commons.dart';

class KonserCard extends StatelessWidget {
  const KonserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: kPadd6,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: kRadius6,
        border: Border.all(color: AppColors.black),
        boxShadow: const [
          BoxShadow(offset: extraSmallShadow),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ----------------------------------------------
          // Images
          // ----------------------------------------------
          Container(
            width: double.infinity,
            decoration: decorationStyle,
            child: ClipRRect(
              borderRadius: kRadius4,
              child: Image.asset(
                width: 96,
                height: 70,
                AppImages.imgDummyPhoto,
                fit: BoxFit.cover,
              ),
            ),
          ),
          kGap4,

          // ----------------------------------------------
          // List konten
          // ----------------------------------------------
          Container(
            width: double.infinity,
            padding: kPadd6,
            decoration: decorationMintStyle,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JKT 48 Summer Festival',
                  style: AppStyles.comfortaa6Bold,
                ),
                kGap2,
                Text(
                  '30 Desember',
                  style: AppStyles.comfortaa4Bold,
                ),
                kGap2,
                Text(
                  'Batam - Temenggung Abdul Jamal',
                  style: AppStyles.comfortaa4Bold,
                ),
              ],
            ),
          ),
          kGap4,

          // ----------------------------------------------
          // Harga tiket
          // ----------------------------------------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: decorationGoldenStyle,
            child: const Text(
              'Rp 230.000',
              style: AppStyles.comfortaa6Bold,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration get decorationStyle => BoxDecoration(
      borderRadius: kRadius4,
      border: Border.all(color: AppColors.black, width: 0.5),
      boxShadow: const [
        BoxShadow(
          offset: Offset(1, 1),
        )
      ],
    );
BoxDecoration get decorationMintStyle => BoxDecoration(
      borderRadius: kRadius4,
      color: AppColors.mint,
      border: Border.all(color: AppColors.black, width: 0.5),
      boxShadow: const [
        BoxShadow(
          offset: Offset(1, 1),
        )
      ],
    );
BoxDecoration get decorationGoldenStyle => BoxDecoration(
      borderRadius: kRadius4,
      color: AppColors.golden,
      border: Border.all(color: AppColors.black, width: 0.5),
      boxShadow: const [
        BoxShadow(
          offset: Offset(1, 1),
        )
      ],
    );
