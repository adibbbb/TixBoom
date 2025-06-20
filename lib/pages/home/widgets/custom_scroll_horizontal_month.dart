import 'package:intl/intl.dart';

import '../../../commons.dart';

class CustomScrollHorizontalMonth extends StatefulWidget {
  final List<Widget> monthContents;

  const CustomScrollHorizontalMonth({
    super.key,
    required this.monthContents,
  });

  @override
  State<CustomScrollHorizontalMonth> createState() =>
      _CustomScrollHorizontalMonthState();
}

class _CustomScrollHorizontalMonthState
    extends State<CustomScrollHorizontalMonth> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrlController = ScrollController();
    final ValueNotifier<int> selectedIndex = ValueNotifier(0);
    final int currentMonth = DateTime.now().month;
    final int currentYear = DateTime.now().year;

    // Hitung jumlah bulan yang akan ditampilkan (dari bulan saat ini hingga Desember)
    final int monthsRemaining = 12 - currentMonth + 1;

    // Fungsi untuk mendapatkan nama bulan
    String getMonthName(int month) {
      return DateFormat.MMMM().format(DateTime(currentYear, month));
    }

    return Column(
      children: [
        // ----------------------------------------------
        // SCROLL MONTH SECTION
        // ----------------------------------------------
        SizedBox(
          height: 38,
          child: ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, selectedIndexValue, _) {
              return ListView.separated(
                itemCount: monthsRemaining,
                shrinkWrap: true,
                controller: scrlController,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final int month = currentMonth + index;
                  final bool isSelected = selectedIndexValue == index;
                  final bool isCurrentMonth = index == 0;

                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.magenta
                            : isCurrentMonth
                                ? AppColors.lavender
                                : AppColors.lavender,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(offset: extraSmallShadow),
                        ],
                      ),
                      child: Text(
                        isCurrentMonth ? "Bulan Ini" : getMonthName(month),
                        style: AppStyles.comfortaa12Bold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

        kGap10,

        // ----------------------------------------------
        // KONTEN SECTION
        // ----------------------------------------------
        ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, selectedIndexValue, _) {
            return List.generate(
              monthsRemaining,
              (index) => index < widget.monthContents.length
                  ? widget.monthContents[index]
                  : const Center(
                      child: Text(
                        'Konten tidak tersedia',
                        style: AppStyles.comfortaa12Bold,
                      ),
                    ),
            )[selectedIndexValue];
          },
        ),
      ],
    );
  }
}
