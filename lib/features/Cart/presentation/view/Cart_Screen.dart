import 'package:campus_trade/core/shared_widgets/common_app_bar.dart';
import 'package:campus_trade/features/SellScreen/presentation/cubit/TestProduct.dart';
import 'package:campus_trade/features/product/data/model/product_model.dart';
import 'package:campus_trade/features/product/presentaion/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../SellScreen/presentation/widget/DoneButton.dart'
    show DoneButton;
import '../../../notification/presentaion/widgets/notefication_card.dart';
import '../../../product/presentaion/details/view/detail_screen.dart';
import '../widgets/checkout_container.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel> productList = [];
  CartScreen({super.key, required this.productList});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String calculateTotalPrice(List<ProductModel> products) {
    double total = 0.0;
    for (var product in products) {
      total += double.parse(product.price);
    }
    return total.toStringAsFixed(2); // Format to 2 decimal places
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Cart"),
      body: widget.productList.isEmpty
          ? Center(
              child: Text(
              "Your Cart is Empty",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ))
          : SingleChildScrollView(
              child: Column(children: [
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: widget.productList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      productId:
                                          widget.productList[index].productId,
                                    )));
                      },
                      child: NoteficationCard(
                        onpressed: () {
                          setState(() {
                            widget.productList.removeAt(index);
                          });
                        },
                        title: widget.productList[index].name,
                        subtitle: "${widget.productList[index].price} EGP",
                        image: widget.productList[index].imageUrl,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 160.h,
              ),
              CheckoutContainer(
                productPrice: calculateTotalPrice(widget.productList),
              ),
              SizedBox(
                height: 70.h,
              ),
              DoneButton(
                text: "Go to Checkout",
                Continue: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ])),
    );
  }
}
