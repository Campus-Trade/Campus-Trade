import 'package:campus_trade/presentation/search/widgets/search_card_list.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchCardList(),
    );
  }
}
