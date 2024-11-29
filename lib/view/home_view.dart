import 'package:flutter/material.dart';
import 'package:orders_app/view/matrix_view.dart';
import 'package:provider/provider.dart';

import '../view_model/order_view_model.dart';
import 'graph_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "/HomeView";

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<OrderViewModel>(context,);

    return  Scaffold(
        body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            //appbar
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                  onTap: ()=>Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios,color: Color(0xFF466EF9),)),
            ),
            //body
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height:40,
                  child: ListView.builder(
                    itemCount: viewModel.tabButtonsList.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            viewModel.changeSelectedTab(index,);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.4,
                            decoration: BoxDecoration(
                              color:viewModel
                                  .tabButtonsList[index].selected
                                  ? const Color(0xFF466EF9)
                                  : Colors.transparent,
                              border: Border.all(
                                color: const Color(0xFF466EF9),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                viewModel.tabButtonsList[index].category!,
                                style:  TextStyle(
                                  color: viewModel.tabButtonsList[index].selected
                                      ? Colors.white
                                      : const Color(0xFF466EF9),
                                  fontSize:20,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: viewModel.tabButtonsList[0].selected
                          ? const MatrixView()
                          :  const GraphView()),
                ),
              ],
            ),
          ),)
    );




    //   Scaffold(
    //   body: Container(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.topCenter,
    //             end: Alignment.bottomCenter,
    //             colors: [
    //               const Color(0xFF466EFA).withOpacity(0.6),
    //               const Color(0xFF466EF9),
    //             ])),
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent,
    //       // key: _scaffoldKey,
    //       appBar: AppBar(
    //         backgroundColor: Colors.transparent,
    //         elevation: 0.0,
    //       ),
    //       body:  Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //         Center(
    //           child: Container(
    //             width: 100,
    //             height: 100,
    //             decoration: BoxDecoration(
    //               border: Border.all(width: 2,color: Colors.purpleAccent),
    //               shape: BoxShape.circle
    //             ),
    //             child: Center(child: Text(viewModel.totalCount.toString(),textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
    //           ),
    //         )
    //
    //       ],)
    //     ),
    //   ),
    // );
  }
}
