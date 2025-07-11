import 'package:cached_network_image/cached_network_image.dart';

import '../../../commons.dart';

import 'label_card.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: kRadius8,
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: kRadius6,
          //   child: Image.asset(
          //     height: 65,
          //     width: 65,
          //     AppImages.imgDummyPhoto,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ClipRRect(
            borderRadius: kRadius6,
            child: CachedNetworkImage(
              height: 65,
              width: 65,
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7b2U3EP1m40dqvB6OvTLVEzAebvDeXcQ_zQ&s',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          kGap8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ----------------------------------------------
                // title + label
                // ----------------------------------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        maxLines: 2,
                        'Juicy Luicy bakal manggung lagi di batam untuk ke 3 kalinya',
                        style: AppStyles.comfortaa10Bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    kGap12,
                    eventLabel(
                      title: 'News',
                      padding: kPadd2,
                      textStyle: AppStyles.comfortaa8Bold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),

                kGap25,

                // ----------------------------------------------
                // section like, watch dan upload
                // ----------------------------------------------
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // See dan Like
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove_red_eye_rounded,
                          size: 10,
                        ),
                        kGap2,
                        Text(
                          '1k',
                          style: AppStyles.comfortaa6Bold,
                        ),
                        kGap5,
                        Icon(
                          Icons.thumb_up_alt_rounded,
                          size: 10,
                        ),
                        kGap2,
                        Text(
                          '46',
                          style: AppStyles.comfortaa6Bold,
                        ),
                      ],
                    ),

                    // Menit
                    Text(
                      '30 menit yang lalu',
                      style: AppStyles.comfortaa6Bold,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
