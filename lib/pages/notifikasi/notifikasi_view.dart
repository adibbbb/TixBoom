import '../../commons.dart';
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
      appBar: _appBar(),
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
          const NotificationCard(
            title: 'Your Order Has Complete',
            date: '09 September 2025 | 13:32 WIB',
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

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.brokenWhite,
      centerTitle: true,
      title: eventLabel(title: 'Notifikasi'),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xff333333).withOpacity(0.5),
          height: 1.0,
        ),
      ),
    );
  }
}
