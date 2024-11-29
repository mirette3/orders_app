import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/view/home_view.dart';
import 'package:provider/provider.dart';

import '../view_model/order_view_model.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<OrderViewModel>(context, listen: false);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color(0xFF466EFA).withOpacity(0.6),
              const Color(0xFF466EF9),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's recap\n2021 Orders",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: Colors.white.withOpacity(0.2),
                          offset: const Offset(0, 8),
                        )
                      ],
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(
                  "assets/images/rocket.svg",
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.calculateOrdersData();
                    viewModel.calculateOrdersPerMonth();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeView()));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: FittedBox(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 0,
                          ),
                          child: Text(
                            "Discover Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.white.withOpacity(0.2),
                                    offset: const Offset(0, 5),
                                  )
                                ],
                                fontSize: 30),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
