import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/text_styles.dart';

class PendingProductCard extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productAddress;
  final String productImage;
  final String productId;
  final String productState;
  const PendingProductCard(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productAddress,
      required this.productImage,
      required this.productId,
      required this.productState});

  @override
  State<PendingProductCard> createState() => _PendingProductCardState();
}

class _PendingProductCardState extends State<PendingProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.productImage,
              height: 100.h,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              widget.productName,
                              style: TextStyles.black16Regular.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: null,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.productState,
                    style: TextStyles.black14Regular400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
