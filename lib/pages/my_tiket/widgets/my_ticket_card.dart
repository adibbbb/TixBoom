import 'package:cached_network_image/cached_network_image.dart';

import '../../../commons.dart';
import '../../home/widgets/label_card.dart';

enum MyTicketCardType {
  pesanan,
  tiketAktif,
  done,
}

class MyTicketCard extends StatelessWidget {
  final MyTicketCardType type;
  const MyTicketCard({
    super.key,
    this.type = MyTicketCardType.pesanan,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case MyTicketCardType.pesanan:
        return _pesananSection();
      case MyTicketCardType.tiketAktif:
        return _tiketAktifSection();
      case MyTicketCardType.done:
        return _doneSection();
    }
  }

  Container _pesananSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: kRadius8,
        boxShadow: const [BoxShadow(offset: smallShadow)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: kRadius4,
            child: CachedNetworkImage(
              height: 70,
              width: 95,
              imageUrl:
                  'https://pophariini.com/wp-content/uploads/2024/09/Photo-Profile-Feast1-scaled.jpeg',
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
                // title + Times
                // ----------------------------------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        maxLines: 2,
                        'JKT 48 Summer Festival',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.comfortaa10Bold,
                      ),
                    ),
                    kGap12,
                    eventLabel(
                      padding: kPadd2,
                      title: '13:52',
                      bgColor: AppColors.mint,
                      textColor: AppColors.white,
                      textStyle: AppStyles.comfortaa8Bold,
                    ),
                  ],
                ),

                kGap4,
                const Text(
                  'Rp 230.000',
                  style: AppStyles.comfortaa10Bold,
                ),
                kGap4,
                const Text(
                  '15 Sep 2025 16:47 WIB',
                  style: AppStyles.comfortaa6Bold,
                ),

                // ----------------------------------------------
                // section status dan waktu
                // ----------------------------------------------
                kGap6,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // See dan Like
                    eventLabel(
                      padding: kPadd2,
                      title: 'Belum Lunas',
                      bgColor: AppColors.red,
                      textColor: AppColors.white,
                      textStyle: AppStyles.comfortaa8Bold,
                    ),

                    // Menit
                    const Text(
                      '3 menit yang lalu',
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

  Container _tiketAktifSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: kRadius8,
        boxShadow: const [BoxShadow(offset: smallShadow)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: kRadius4,
            child: CachedNetworkImage(
              height: 70,
              width: 95,
              imageUrl:
                  'https://pophariini.com/wp-content/uploads/2024/09/Photo-Profile-Feast1-scaled.jpeg',
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
                // title + Times
                // ----------------------------------------------
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        'JKT 48 Summer Festival',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.comfortaa10Bold,
                      ),
                    ),
                    // kGap12,
                    // eventLabel(
                    //   padding: kPadd2,
                    //   title: '13:52',
                    //   bgColor: AppColors.mint,
                    //   textColor: AppColors.white,
                    //   textStyle: AppStyles.comfortaa8Bold,
                    // ),
                  ],
                ),

                kGap4,
                const Text(
                  'Rp 230.000',
                  style: AppStyles.comfortaa10Bold,
                ),
                kGap4,
                const Text(
                  '15 Sep 2025 16:47 WIB',
                  style: AppStyles.comfortaa6Bold,
                ),

                // ----------------------------------------------
                // section status dan waktu
                // ----------------------------------------------
                kGap6,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    eventLabel(
                      padding: kPadd2,
                      title: 'Lunas',
                      bgColor: AppColors.mint,
                      textColor: AppColors.white,
                      textStyle: AppStyles.comfortaa8Bold,
                    ),

                    // Menit
                    const Text(
                      '1 menit yang lalu',
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

  Container _doneSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: kRadius8,
        boxShadow: const [BoxShadow(offset: smallShadow)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: kRadius4,
            child: CachedNetworkImage(
              height: 70,
              width: 95,
              imageUrl:
                  'https://pophariini.com/wp-content/uploads/2024/09/Photo-Profile-Feast1-scaled.jpeg',
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
                // title + Times
                // ----------------------------------------------
                const Text(
                  maxLines: 2,
                  'JKT 48 Summer Festival',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.comfortaa10Bold,
                ),

                kGap4,
                const Text(
                  'Rp 230.000',
                  style: AppStyles.comfortaa10Bold,
                ),
                kGap4,
                const Text(
                  '15 Sep 2025 16:47 WIB',
                  style: AppStyles.comfortaa6Bold,
                ),

                // ----------------------------------------------
                // section status dan waktu
                // ----------------------------------------------
                kGap6,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: false,
                      child: eventLabel(
                        padding: kPadd2,
                        title: 'Belum Lunas',
                        bgColor: AppColors.red,
                        textColor: AppColors.white,
                        textStyle: AppStyles.comfortaa8Bold,
                      ),
                    ),

                    // Menit
                    const Text(
                      '1 bulan yang lalu',
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
