import '../../../commons.dart';

class DiskonCard extends StatelessWidget {
  const DiskonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            color: AppColors.white,
            borderRadius: kRadius8,
            boxShadow: const [
              BoxShadow(
                offset: Offset(3, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '[Pengguna Baru] Diskon + Cashback hingga Rp50.000 untuk semua pem',
                style: AppStyles.comfortaa14Bold,
                textAlign: TextAlign.justify,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              kGap10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 7),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        color: const Color(0xffFFF8E8),
                        borderRadius: kRadius6,
                        boxShadow: const [
                          BoxShadow(
                            offset: extraSmallShadow,
                          )
                        ],
                      ),
                      child: const Text(
                        'Code Name',
                        style: AppStyles.comfortaa12Regular,
                      ),
                    ),
                  ),
                  kGap10,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      color: AppColors.lavender,
                      borderRadius: kRadius6,
                      boxShadow: const [
                        BoxShadow(
                          offset: extraSmallShadow,
                        )
                      ],
                    ),
                    child: Text(
                      'Salin',
                      style: AppStyles.comfortaa11Bold.copyWith(
                        color: const Color(0xffFFF8E8),
                      ),
                    ),
                  ),
                ],
              ),
              kGap10,
              Text(
                'Syarat dan Ketentuan',
                style: AppStyles.comfortaa12Regular
                    .copyWith(color: AppColors.lavender),
              )
            ],
          ),
        ),
        // kiri
        Positioned(
          top: 60,
          left: 4,
          bottom: 60,
          child: Container(
            width: 15,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  color: const Color(0xff000000).withOpacity(0.75),
                )
              ],
              border: const Border(
                top: BorderSide(
                  color: AppColors.black,
                ),
                bottom: BorderSide(
                  color: AppColors.black,
                ),
                right: BorderSide(
                  color: AppColors.black,
                ),
              ),
              color: AppColors.brokenWhite,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
          ),
        ),

        // kanan
        Positioned(
          top: 60,
          right: 1,
          bottom: 60,
          child: Container(
            width: 15,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(-2, 0),
                )
              ],
              border: Border(
                top: BorderSide(
                  color: AppColors.black,
                ),
                bottom: BorderSide(
                  color: AppColors.black,
                ),
                left: BorderSide(
                  color: AppColors.black,
                ),
              ),
              color: AppColors.brokenWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
