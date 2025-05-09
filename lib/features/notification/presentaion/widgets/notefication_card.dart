import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/image_manager.dart';
import '../../../../core/utils/resources/text_styles.dart';

class NoteficationCard extends StatelessWidget {
  String? title;
  String? subtitle;
  String? image;
  void Function()? onpressed;
  NoteficationCard({
    required this.subtitle,
    required this.title,
    this.image,
    this.onpressed,
  });
  final bool issuccess = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image != null
                ? Image.network(
                    image!,
                    height: 100.h,
                  )
                : Image.asset(
                    ImageManager.rectangleT,
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
                              title!,
                              style: TextStyles.black16Regular.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: null,
                              softWrap: true,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onpressed,
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    subtitle!,
                    style: TextStyles.white14regulare.copyWith(
                      color: issuccess ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
