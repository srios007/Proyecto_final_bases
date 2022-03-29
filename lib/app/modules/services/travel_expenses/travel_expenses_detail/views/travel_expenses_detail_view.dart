import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/travel_expenses_detail_controller.dart';

class TravelExpensesDetailView extends GetView<TravelExpensesDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelExpensesDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TravelExpensesDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
