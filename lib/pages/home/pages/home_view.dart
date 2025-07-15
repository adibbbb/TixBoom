import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app/custom_transition.dart';

import '../../../app/extensions.dart';
import '../../../commons.dart';
import '../../../provider/login_provider.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../notifikasi/notifikasi_view.dart';
import '../../../widgets/custom_scroll_horizontal_month.dart';
import '../widgets/diskon_card.dart';
import '../widgets/konser_card.dart';
import '../widgets/label_card.dart';
import '../widgets/news_card.dart';

final List _dummyImages = [
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
  AppImages.imgDummyPhoto,
  AppImages.imgDummyPhoto2,
];

final List<Widget> konserCards = List.generate(
  8,
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

  int myIndex = 0;
  // final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocusKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
            child: Column(
              children: [
                _appBar(),

                kGap20,
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
                      SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            _heroBanner(),
                            kGap12,

                            // ----------------------------------------------
                            // rekomendasi event konser
                            // ----------------------------------------------
                            labelCard(
                              title: 'Recommend Event',
                              desc: 'Pilih event yang ingin kamu datangi!',
                              onTapSeeOther: () {},
                            ),
                            _recommendEvent(),
                            kGap12,

                            // // ----------------------------------------------
                            // // Banner
                            // // ----------------------------------------------
                            ClipRRect(
                              borderRadius: kRadius12,
                              child: Image.asset(AppImages.imgBanner),
                            ),
                            kGap20,

                            // // ----------------------------------------------
                            // // Diskon section
                            // // ----------------------------------------------
                            for (int i = 0; i < 2; i++)
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: DiskonCard(),
                              ),

                            kGap20,

                            // // ----------------------------------------------
                            // // Boom News
                            // // ----------------------------------------------
                            labelCard(
                              title: 'Boom News',
                              desc: 'Update berita terbaru seputar music',
                              onTapSeeOther: () {},
                            ),

                            for (int i = 0; i < 2; i++)
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: NewsCard(),
                              ),
                          ],
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
      ),
    );
  }

  Row _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          width: 65,
          height: 35,
          AppImages.imglogoTixBoom,
        ),
        GestureDetector(
          onDoubleTap: () {
            context.read<LoginProvider>().logout(context);
          },
          onTap: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: const NotifikasiView(),
              ),
            );
          },
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
      ],
    );
  }

  Widget _recommendEvent() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4),
            padEnds: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndexKonser = index;
              });
            },
          ),
          items: [
            // Per baris 2 item
            for (int i = 0; i < (konserCards.length / 2).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Maksimal 2 item per baris
                  for (int j = 0; j < 2; j++)
                    if (i * 2 + j < konserCards.length)
                      Expanded(
                        child: konserCards[i * 2 + j],
                      ),
                ],
              ),
          ],
        ),
        kGap12,
        AnimatedSmoothIndicator(
          activeIndex: currentIndexKonser,
          count: (konserCards.length / 3).ceil(),
          effect: const ScrollingDotsEffect(
            dotWidth: 5,
            dotHeight: 5,
            activeDotColor: AppColors.magenta,
            dotColor: AppColors.grey,
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
}
