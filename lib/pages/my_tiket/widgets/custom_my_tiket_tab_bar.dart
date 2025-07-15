import '../../../commons.dart';

class CustomMyTicketTabBar extends StatelessWidget {
  const CustomMyTicketTabBar({
    super.key,
    required this.activeIndex,
    required this.pageSections,
    required this.tabNames,
    this.title = "",
    this.switchAnimationDuration = const Duration(milliseconds: 250),
    this.padding = const EdgeInsets.only(top: 12),
  });

  final String title;
  final ValueNotifier<int> activeIndex;

  final List<Widget> pageSections;
  final List<String> tabNames;
  final Duration switchAnimationDuration;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ----------------------------------------------
        // tabbar
        // ----------------------------------------------
        ValueListenableBuilder(
          valueListenable: activeIndex,
          builder: (context, currentIndex, _) {
            return Row(
              children: List.generate(tabNames.length, (index) {
                final isActive = currentIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      activeIndex.value = index;
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(right: index == 2 ? 0 : 10),
                      duration: switchAnimationDuration,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: kRadius6,
                        border: Border.all(
                          color:
                              isActive ? AppColors.lavender : AppColors.black,
                        ),
                        color: isActive
                            ? const Color(0xffB27FFF)
                            : AppColors.white,
                        boxShadow: const [
                          BoxShadow(offset: extraSmallShadow),
                        ],
                      ),
                      child: Text(
                        tabNames[index],
                        textAlign: TextAlign.center,
                        style: AppStyles.comfortaa10Bold.copyWith(
                          color:
                              isActive ? AppColors.white : AppColors.lavender,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),

        // ----------------------------------------------
        // page switcher
        // ----------------------------------------------
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: activeIndex,
              builder: (context, currentIndex, _) {
                return AnimatedSwitcher(
                  duration: switchAnimationDuration,
                  child: pageSections[currentIndex],
                );
              }),
        )
      ],
    );
  }
}
