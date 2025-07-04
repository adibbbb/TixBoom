import 'package:shimmer/shimmer.dart';

import '../commons.dart';

class ShimmerListWidget extends StatelessWidget {
  const ShimmerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brokenWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              // AppBar
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerBox(height: 35, width: 65), // logo
                  ShimmerBox(height: 35, width: 35, borderRadius: 10),
                ],
              ),
              kGap20,

              // Search Bar
              const ShimmerBox(height: 44, width: double.infinity),
              kGap12,

              // Label
              const Row(
                children: [
                  ShimmerBox(height: 30, width: 90),
                  kGap8,
                  ShimmerBox(height: 30, width: 90),
                  kGap8,
                  ShimmerBox(height: 30, width: 90),
                  kGap8,
                  ShimmerBox(height: 30, width: 60),
                ],
              ),
              kGap20,
              // Expanded Scroll Content
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    // Hero Banner
                    ShimmerBox(
                        height: 150, width: double.infinity, borderRadius: 16),
                    kGap12,
                    // Label + Carousel Concert
                    ShimmerBox(height: 20, width: 140), // Label
                    kGap12,
                    Row(
                      children: [
                        Expanded(child: ShimmerBox(height: 180)),
                        SizedBox(width: 12),
                        Expanded(child: ShimmerBox(height: 180)),
                      ],
                    ),
                    kGap20,

                    // Middle Banner
                    ShimmerBox(
                        height: 130, width: double.infinity, borderRadius: 12),
                    SizedBox(height: 20),

                    // Diskon Cards
                    ShimmerBox(height: 120, width: double.infinity),
                    kGap12,
                    ShimmerBox(height: 120, width: double.infinity),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.height,
    this.width,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
