import 'package:flutter/material.dart';

import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';

class CarPlate extends StatelessWidget {
  final String plateNumber;
  final String plateNumberAr;
  final String firstPlateLetter;
  final String secondPlateLetter;
  final String thirdPlateLetter;
  final String firstPlateLetterAr;
  final String secondPlateLetterAr;
  final String thirdPlateLetterAr;

  const CarPlate({
    super.key,
    required this.plateNumber,
    required this.plateNumberAr,
    required this.firstPlateLetter,
    required this.secondPlateLetter,
    required this.thirdPlateLetter,
    required this.firstPlateLetterAr,
    required this.secondPlateLetterAr,
    required this.thirdPlateLetterAr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
        color: ColorManager.basicsWhite,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      plateNumberAr,
                      style: TextStyleManager.carPlate,
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: ColorManager.basicsBlack,
                  width: 0,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '$thirdPlateLetterAr $secondPlateLetterAr $firstPlateLetterAr',
                      style: TextStyleManager.carPlate,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorManager.basicsBlack,
            height: 0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      plateNumber,
                      style: TextStyleManager.carPlate,
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: ColorManager.basicsBlack,
                  width: 0,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '$firstPlateLetter $secondPlateLetter $thirdPlateLetter',
                      style: TextStyleManager.carPlate,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
