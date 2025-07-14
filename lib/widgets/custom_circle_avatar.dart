import 'package:cached_network_image/cached_network_image.dart';

import '../commons.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final Color? backgroundColor;
  final Color? iconColor;
  final double radiusCircle;
  final List<BoxShadow>? shadows;

  const CustomCircleAvatar({
    super.key,
    required this.imageUrl,
    this.backgroundColor,
    this.iconColor,
    required this.radiusCircle,
    required,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radiusCircle * 2,
      width: radiusCircle * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey,
          shape: BoxShape.circle,
          boxShadow: shadows),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(
                Icons.person,
                color: iconColor ?? AppColors.white,
                size: radiusCircle + 4,
              )),
    );
  }
}
