import '../commons.dart';

class WeightsApp {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppStyles {
  // ----------------------------------------------
  // Regular Section
  // ----------------------------------------------
  static const TextStyle comfortaa12Regular = TextStyle(
    fontWeight: WeightsApp.regular,
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle comfortaa14Regular = TextStyle(
    fontWeight: WeightsApp.regular,
    fontSize: 14,
    color: Colors.black,
  );

  // ----------------------------------------------
  // medium Section
  // ----------------------------------------------
  static const TextStyle comfortaa12Medium = TextStyle(
    fontWeight: WeightsApp.medium,
    fontSize: 12,
    color: Colors.black,
  );

  // ----------------------------------------------
  // Bold Section
  // ----------------------------------------------
  static const TextStyle comfortaa12Bold = TextStyle(
    fontWeight: WeightsApp.bold,
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle comfortaa24Bold = TextStyle(
    fontWeight: WeightsApp.bold,
    fontSize: 24,
    color: Colors.black,
  );
}

// ----------------------------------------------
// Border Style
// ----------------------------------------------
get bigborderStyle => BoxDecoration(
      borderRadius: kRadius16,
      color: AppColors.white,
      border: Border.all(
        color: AppColors.black,
      ),
      boxShadow: const [
        BoxShadow(offset: bigShadow),
      ],
    );
