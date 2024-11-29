import 'package:flutter/material.dart';
import 'package:orders_app/view/widgets/item_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../view_model/order_view_model.dart';

class MatrixView extends StatelessWidget {
  const MatrixView({super.key});

  static const String routeName = "/MatrixView";

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<OrderViewModel>(
      context,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF466EF9).withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //average prices
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FittedBox(
                      child: Text(
                        "Average Price",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(
                            text: "\$ ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                            )),
                        TextSpan(
                            text:
                                "${viewModel.formatNumberWithComma(viewModel.averagePrice)}",
                            style: const TextStyle(
                              color: Color(0xFF466EF9),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                            )),
                      ])),
                    ),
                  ],
                ),

                //space
                SizedBox(
                  height: kIsWeb?MediaQuery.of(context).size.width * 0.1:MediaQuery.of(context).size.width * 0.2,
                ),

                //total orders and returned orders
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //total orders
                    Expanded(
                        child: ItemWidget(
                      title: 'Total\nOrders',
                      data: viewModel.orders.length.toString(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    //returned orders
                    Expanded(
                        child: ItemWidget(
                      title: 'Returned\nOrders',
                      data: viewModel.numOfReturns.toString(),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
