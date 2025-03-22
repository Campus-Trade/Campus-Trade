import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:campus_trade/presentation/search/category_model.dart';
import 'package:campus_trade/presentation/search/widgets/search_card.dart';
import 'package:flutter/material.dart';

class SearchCardList extends StatelessWidget {
  SearchCardList({super.key});
  final List<CategoryModel> categoryData = [
    CategoryModel(
      categoryName: 'Engineering',
      imageUrl: ImageManager.engineering,
    ),
    CategoryModel(
      categoryName: 'Medicine',
      imageUrl: ImageManager.medicine,
    ),
    CategoryModel(
      categoryName: 'Pharmacy',
      imageUrl: ImageManager.pharmacy,
    ),
    CategoryModel(
      categoryName: 'Business',
      imageUrl: ImageManager.business,
    ),
    CategoryModel(
      categoryName: 'Fine Arts',
      imageUrl: ImageManager.fineArts,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          itemCount: categoryData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SearchCard(
              categoryModel: categoryData[index],
            );
          }),
    );
  }
}
