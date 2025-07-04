import '../../../commons.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;
  final Color? iconColor;
  final bool isRead;

  const NotificationCard({
    super.key,
    required this.title,
    required this.date,
    required this.icon,
    this.iconColor = AppColors.golden,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // kasih jarak antara card
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            offset: extraSmallShadow,
          ),
        ],
      ),
      child: Row(
        children: [
          //icon
          Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
          kGap12,
          // title dan tanggal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.comfortaa12Bold,
              ),
              kGap6,
              Text(
                date,
                style: AppStyles.comfortaa8Bold,
              ),
            ],
          ),
          const Spacer(),
          // uda kebaca atau belum
          isRead
              ? Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFA676FF),
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
