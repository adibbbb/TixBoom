import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/extensions.dart';
import '../../../commons.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../widgets/custom_scroll_horizontal_month.dart';
import '../widgets/diskon_card.dart';
import '../widgets/konser_card.dart';
import '../widgets/label_card.dart';

final List _dummyImages = [
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
];

final List<Widget> konserCards = List.generate(
  9,
  (index) => const KonserCard(),
);

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndexBanner = 0;
  int currentIndexKonser = 0;
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
              // ----------------------------------------------
              // Search Bar
              // ----------------------------------------------
              const CustomTextFormField(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              kGap12,

              // ----------------------------------------------
              // List Bulan
              // ----------------------------------------------
              Expanded(
                child: CustomScrollHorizontalMonth(
                  monthContents: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _heroBanner(),
                            kGap12,
                            labelCard(
                              title: 'Recommend Event',
                              desc: 'Pilih event yang ingin kamu datangi!',
                              onTapSeeOther: () {},
                            ),
                            _recommendEvent(),
                            kGap12,
                            ClipRRect(
                              borderRadius: kRadius12,
                              child: Image.asset(AppImages.imgBanner),
                            ),
                            kGap12,
                            const DiskonCard(),
                            kGap12,
                            const DiskonCard(),
                            kGap20,
                            labelCard(
                              title: 'Boom News',
                              desc: 'Update berita terbaru seputar music',
                              onTapSeeOther: () {},
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

  Widget _recommendEvent() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndexKonser = index;
              });
            },
          ),
          items: [
            for (int i = 0; i < (konserCards.length / 3).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j < 3; j++)
                    if (i * 3 + j < konserCards.length)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: konserCards[i * 3 + j],
                        ),
                      ),
                ],
              ),
          ],
        ),
        kGap12,
        Align(
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndexKonser,
            count: (konserCards.length / 3).ceil(),
            effect: const ScrollingDotsEffect(
              dotWidth: 5,
              dotHeight: 5,
              activeDotColor: AppColors.magenta,
              dotColor: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Column _heroBanner() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 21 / 9,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              setState(() {
                currentIndexBanner = index;
              });
            },
          ),
          items: _dummyImages.map(
            (imagePath) {
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
              );
            },
          ).toList(),
        ),
        kGap10,
        // ----------------------------------------------
        // Dot Indicator
        // ----------------------------------------------
        AnimatedSmoothIndicator(
          activeIndex: currentIndexBanner,
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
