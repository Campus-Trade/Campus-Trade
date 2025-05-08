import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/presentaion/cubit/present_product_cubit.dart';
import '../widgets/appBar_search.dart';
import '../widgets/product_search_result.dart';
import '../widgets/search_card_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // void _onSearchChanged() {
  //   final query = _searchController.text;
  //   context.read<ProductCubit>().searchProducts(query, selectedCategory);
  //   setState(() {
  //     searchQuery = query;
  //   });
  // }
  void _onSearchChanged() {
    final query = _searchController.text;
    setState(() {
      searchQuery = query;
    });
    context.read<ProductCubit>().searchProducts(query, selectedCategory);
  }

  void _onCategoryChanged(String? category) {
    if (category == null) return;
    setState(() {
      selectedCategory = category;
    });
    context.read<ProductCubit>().searchProducts(searchQuery, category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSearch(
        categoryValue: selectedCategory,
        onCategoryChanged: _onCategoryChanged,
        controller: _searchController,
        onSubmitted: (_) => _onSearchChanged(), // Handle Enter key press
      ),
      body: searchQuery.isEmpty && selectedCategory == "All"
          ? SearchCardList()
          : ProductSearchResults(query: searchQuery),
    );
  }
}
