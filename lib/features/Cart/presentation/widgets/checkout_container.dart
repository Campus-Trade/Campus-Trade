import 'package:campus_trade/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutContainer extends StatefulWidget {
  String? productPrice;
  CheckoutContainer({super.key, required this.productPrice});

  @override
  State<CheckoutContainer> createState() => _CheckoutContainerState();
}

class _CheckoutContainerState extends State<CheckoutContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 353.w,
        height: 168.h,
        decoration: BoxDecoration(
            color: ColorManager.SecondaryColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subtotal",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                    Text(
                      "${widget.productPrice} EGP",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount Total",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                    Text(
                      "At checkout",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Order (EGP)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                    Text(
                      "${widget.productPrice} EGP",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.PrimaryColor),
                    ),
                  ],
                ),
              ],
            )));
  }
}
