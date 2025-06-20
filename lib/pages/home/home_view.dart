import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app/extensions.dart';
import '../../commons.dart';
import '../../widgets/custom_text_form_field.dart';
import 'widgets/custom_scroll_horizontal_month.dart';

final List _dummyImages = [
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocusKeyboard();
      },
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              const CustomTextFormField(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              kGap12,
              Expanded(
                child: CustomScrollHorizontalMonth(
                  monthContents: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // ----------------------------------------------
                            // Images
                            // ----------------------------------------------
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                aspectRatio: 21 / 9,
                                viewportFraction: 1,
                                onPageChanged: (index, _) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                              items: _dummyImages.map(
                                (imagePath) {
                                  return LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.asset(
                                            imagePath,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            kGap10,
                            // ----------------------------------------------
                            // Dot Indicator
                            // ----------------------------------------------
                            AnimatedSmoothIndicator(
                              activeIndex: currentIndex,
                              count: _dummyImages.length,
                              effect: const ExpandingDotsEffect(
                                dotHeight: 6,
                                dotWidth: 10,
                                activeDotColor: AppColors.magenta,
                                dotColor: AppColors.grey,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ----------------------------------------------
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.brokenWhite,
      leadingWidth: 65 + 22,
      leading: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Image.asset(
          AppImages.imglogoTixBoom,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.lavender,
              border: Border.all(color: AppColors.black),
              borderRadius: kRadius6,
              boxShadow: const [
                BoxShadow(
                  offset: extraSmallShadow,
                ),
              ],
            ),
            child: SvgPicture.asset(AppIcons.icNotification),
          ),
        ),
        kGap22
      ],
    );
  }
}
