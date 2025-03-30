import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../../DonateScreen/Donate_Screen.dart';
import '../../resources/text_styles.dart';
import '../Sellscreen.dart';

class Segmentsellbutton extends StatefulWidget {
  const Segmentsellbutton({super.key});

  @override
  State<Segmentsellbutton> createState() => _SegmentsellbuttonState();
}

enum selected { Sell, Donate }

class _SegmentsellbuttonState extends State<Segmentsellbutton> {
  selected selectedView = selected.Sell;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton<selected>(
          style: SegmentedButton.styleFrom(
              selectedBackgroundColor: ColorManager.SecondaryColor,
              selectedForegroundColor: ColorManager.PrimaryColor,
              foregroundColor: ColorManager.PrimaryColor,
              backgroundColor: ColorManager.greyColor),
          segments: [
            ButtonSegment(
              value: selected.Sell,
              label: Text(
                "Sell",
                style: selectedView == selected.Sell
                    ? TextStyles.white14Bold
                    : TextStyles.black14Regular,
              ),
            ),
            ButtonSegment(
              value: selected.Donate,
              label: Text(
                "Donate",
                style: selectedView == selected.Donate
                    ? TextStyles.white14Bold
                    : TextStyles.black14Regular,
              ),
            ),
          ],
          selected: {selectedView},
          onSelectionChanged: (Set<selected> newSelection) {
            setState(() {
              selectedView = newSelection.first;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => selectedView == selected.Sell
                    ? SellScreen()
                    : DonateScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
