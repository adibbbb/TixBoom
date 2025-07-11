import 'package:intl/intl.dart';

import '../commons.dart';

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
  late final ScrollController scrlController;
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    scrlController = ScrollController();
  }

  @override
  void dispose() {
    scrlController.dispose();
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int currentMonth = DateTime.now().month;
    final int currentYear = DateTime.now().year;

    // Hitung semua bulan
    List<Map<String, dynamic>> months = [];
    for (int i = 0; i < 12; i++) {
      final int month = currentMonth + i;
      final int year = currentYear;

      if (month > 12) break; // Stop jika bulan lebih dari Desember

      months.add({
        "name": i == 0
            ? "Bulan Ini"
            : DateFormat.MMMM().format(DateTime(year, month)),
        "month": month,
        "year": year,
      });
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
                clipBehavior: Clip.none,
                controller: scrlController,
                itemCount: months.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedIndexValue == index;
                  return InkWell(
                    onTap: () => selectedIndex.value = index,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.black),
                        color:
                            isSelected ? AppColors.lavender : AppColors.white,
                        boxShadow: const [
                          BoxShadow(offset: extraSmallShadow),
                        ],
                      ),
                      child: Text(
                        months[index]["name"],
                        style: AppStyles.comfortaa12Bold.copyWith(
                          color: isSelected ? AppColors.white : AppColors.black,
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
            return Expanded(
              child: widget.monthContents.isNotEmpty &&
                      selectedIndexValue < widget.monthContents.length
                  ? widget.monthContents[selectedIndexValue]
                  : const Center(
                      child: Text('Konten tidak tersedia'),
                    ),
            );
          },
        ),
      ],
    );
  }
}
