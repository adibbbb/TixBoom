import '../../app/date_formatting.dart';
import '../../commons.dart';
import '../../widgets/custom_app_bar.dart';
import '../home/widgets/label_card.dart';
import 'widgets/notifikasi_card.dart';

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({super.key});

  @override
  State<NotifikasiView> createState() => _NotifikasiViewState();
}

class _NotifikasiViewState extends State<NotifikasiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        padding: kPadd6,
        title: 'Notifikasi',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        children: [
          // ----------------------------------------------
          // Today
          // ----------------------------------------------
          Align(
            alignment: Alignment.centerLeft,
            child: eventLabel(title: 'Today'),
          ),
          kGap13,
          for (int i = 0; i < 2; i++)
            const NotificationCard(
              title: 'New Event Has Come',
              date: '09 September 2025',
              icon: Icons.event_note_outlined,
              isRead: true,
            ),
          NotificationCard(
            title: 'Your Order Has Complete',
            date:
                '${formatDateString(DateTime.now().toString(), toFormat: 'dd MMMM yyyy')} | 13:32 WIB',
            icon: Icons.shopping_bag_outlined,
            iconColor: AppColors.mint,
            isRead: true,
          ),
          kGap14,

          // ----------------------------------------------
          // Yesterday
          // ----------------------------------------------
          Align(
            alignment: Alignment.centerLeft,
            child: eventLabel(title: 'Yesterday'),
          ),
          kGap13,
          for (int i = 0; i < 2; i++)
            const NotificationCard(
              title: 'New Event Has Come',
              date: '09 September 2025',
              icon: Icons.event_note_outlined,
            ),
          const NotificationCard(
            title: 'Your Order Has Complete',
            date: '09 September 2025 | 13:32 WIB',
            icon: Icons.shopping_bag_outlined,
            iconColor: AppColors.mint,
          ),
        ],
      ),
    );
  }
}
