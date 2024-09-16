import 'package:bloc_learning/common/utils/screenUtils.dart';
import 'package:bloc_learning/pages/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        print(state.errorMessage);
        if (state.errorMessage != null) {
          _showErrorSnackbar(state.errorMessage!, context);
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          print("SSS S SS SS S S S S S ");
          print(state.product?.products?.length);
          return Container(
            child: SafeArea(
              child: Scaffold(
                appBar: buildAppBar("Product"),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      resuableText("Product List"),
                      state.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: ScreenUtils.height(context) * 0.5,
                              child: ListView.builder(
                                  itemCount: state.product?.products?.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(state.product?.products![index]
                                                  .title ??
                                              ""),
                                          Text(state.product?.products![index]
                                                  .description ??
                                              "")
                                        ],
                                      ),
                                    );
                                  }),
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showErrorSnackbar(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
