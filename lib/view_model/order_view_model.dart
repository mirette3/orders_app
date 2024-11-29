import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/order_model.dart';
import '../model/tab_model.dart';

class OrderViewModel extends ChangeNotifier {
  List<OrdersModel> orders = [];
  double averagePrice = 0.0;
  double totalPrice = 0;
  int numOfReturns = 0;
  Map<int, double> ordersPerMonth = {};
  var sortedByKeyMap={};
  List<TabModel> tabButtonsList = [
    TabModel(
      index: 0,
      category: 'In Numbers',
      selected: true,
    ),
    TabModel(
      index: 1,
      category: 'In Graph',
      selected: false,
    ),
  ];


  //Function to read data from json file
  Future<void> readJson() async {
    orders=[];
    notifyListeners();
    final String response = await rootBundle.loadString('assets/orders.json');

    final data = await json.decode(response);
    for (var order in data) {
      orders.add(OrdersModel.fromJson(order));
    }
  }

  void calculateOrdersData() {
    averagePrice=0;
    totalPrice=0;
    numOfReturns=0;
    for (var order in orders) {
      if (order.status == 'RETURNED') {
        //Calculate number of returned orders
        numOfReturns++;
      } else {
        // Remove dollar sign and commas from the string
        String cleanAmount =
            order.price.toString().replaceAll(RegExp(r'[$,]'), '');
        // Parse the cleaned string as a double
        double amount = double.parse(cleanAmount);
        //Calculate total amount of orders
        totalPrice += amount;
      }
    }
    averagePrice = totalPrice / ((orders.length) - numOfReturns);
    notifyListeners();
  }

  //to change tab index
  changeSelectedTab(int index,) {
    for (int i = 0; i < tabButtonsList.length; i++) {
      if (i == index) {
        tabButtonsList[i].selected = true;
      } else {
        tabButtonsList[i].selected = false;
      }
    }
    notifyListeners();
  }

  // Function to format integer value with comma separator
  formatNumberWithComma(var number) {
    String formattedValue = '';
    int commaIndex = number.toString().length % 3;

    if (commaIndex != 0) {
      formattedValue += number.toString().substring(0, commaIndex);
    }

    for (int i = commaIndex; i < number.toString().length; i += 3) {
      if (i != 0) {
        formattedValue += ',';
      }
      formattedValue += number.toString().substring(i, i + 3);
    }

    return formattedValue;
  }


  Map<int, double> calculateOrdersPerMonth() {
    ordersPerMonth={};
    for (var order in orders) {
      // Format the month as a key
      DateTime dateTime = DateTime.parse(order.registered.toString());

      int monthKey = int.parse(dateTime.month.toString());

      // Increment the count for this month
      if (ordersPerMonth.containsKey(monthKey)) {
        ordersPerMonth[monthKey] = ordersPerMonth[monthKey]! + 1;
      } else {
        ordersPerMonth[monthKey] = 1;
      }
    }
    //sort key of months
     sortedByKeyMap = SplayTreeMap<int, double>.from(ordersPerMonth, (k1, k2) => k1.compareTo(k2));
    return ordersPerMonth;
  }
}
