import 'package:flutter/material.dart';

enum ButtonType { payBills, donate, receiptients, offers }
enum TransactionType { sent, received, pending }

class Transaction extends StatelessWidget {
  final TransactionType transactionType;
  final String transactionAmout, transactionInfo, transactionDate, receptient;
  const Transaction(
      {Key? key,
      required this.transactionType,
      required this.transactionAmout,
      required this.transactionInfo,
      required this.transactionDate,
      required this.receptient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.grey,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: const Icon(
                    Icons.volunteer_activism,
                    color: Colors.green,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "৳ $transactionAmout",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      transactionDate,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
