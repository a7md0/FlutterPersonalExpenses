import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTrascationsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final double totalSum = recentTransactions.fold(0, (value, tx) {
        if (weekDay.day == tx.date.day &&
            weekDay.month == tx.date.month &&
            weekDay.year == tx.date.year) {
          return value + tx.amount;
        }

        return value;
      });

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [Container()],
          )
        ],
      ),
    );
  }
}
