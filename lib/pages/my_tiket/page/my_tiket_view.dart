import 'dart:math';

import '../../../commons.dart';
import '../../home/widgets/label_card.dart';

import '../widgets/custom_my_tiket_tab_bar.dart';
import '../widgets/my_ticket_card.dart';

class MyTiketView extends StatefulWidget {
  const MyTiketView({super.key});

  @override
  State<MyTiketView> createState() => _MyTiketViewState();
}

class _MyTiketViewState extends State<MyTiketView> {
  final List<Widget> dummy = Random().nextBool()
      ? [const MyTicketCard(type: MyTicketCardType.done)]
      : [];

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> tabIndexActive = ValueNotifier(0);
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
        child: CustomMyTicketTabBar(
          activeIndex: tabIndexActive,
          tabNames: const [
            'Pesanan',
            'Tiket Aktif',
            'Riwayat Tiket',
          ],
          pageSections: [
            _pesananSection(),
            _tiketAktifSection(),
            _riwayatSection()
          ],
        ),
      ),
    );
  }

  Widget _riwayatSection() {
    return dummy.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset(AppImages.imgNoItem),
          )
        : ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 12),
            children: dummy,
          );
  }

  ListView _tiketAktifSection() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 12),
      children: [
        for (var i = 0; i < 2; i++)
          const MyTicketCard(
            type: MyTicketCardType.tiketAktif,
          ),
      ],
    );
  }

  ListView _pesananSection() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 12),
      children: [
        for (var i = 0; i < 4; i++)
          const MyTicketCard(
            type: MyTicketCardType.pesanan,
          ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.brokenWhite,
      title: eventLabel(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        title: 'My Ticket',
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0),
        child: Container(
          color: const Color(0xff333333).withOpacity(0.5),
          height: 1.0,
        ),
      ),
    );
  }
}
