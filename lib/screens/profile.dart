import 'package:flutter/material.dart';
import 'package:nano_help/components/transaction.dart';
import 'package:nano_help/models/user.dart';
import 'package:nano_help/widget/appbar_widget.dart';
import 'package:nano_help/widget/button_widget.dart';
import 'package:nano_help/widget/numbers_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = User(
      imagePath:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: 'Jane Doe',
      email: 'sarah.abs@gmail.com',
      about:
          'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
      isDarkMode: false,
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          buildPot(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          const NumbersWidget(),
          const SizedBox(height: 48),
          buildName(user),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.military_tech,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Icon(
                Icons.verified,
                color: Colors.black,
                size: 24.0,
              ),
              Icon(
                Icons.star_border,
                color: Colors.black,
                size: 24.0,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 15, bottom: 15),
            child: Text.rich(
              TextSpan(
                text: 'Recent Donations', // default text style
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orange),
              ),
            ),
          ),
          const Transaction(
            receptient: "Amazigh Halzoun",
            transactionAmout: "5000.00",
            transactionDate: "29 Jun 2020",
            transactionInfo: "Laptop",
            transactionType: TransactionType.sent,
          ),
          const Transaction(
            receptient: "Awesome Client",
            transactionAmout: "15000.00",
            transactionDate: "26 Jun 2020",
            transactionInfo: "Mobile App",
            transactionType: TransactionType.received,
          ),
          const Transaction(
            receptient: "Lazy Client",
            transactionAmout: "25000.00",
            transactionDate: "24 Jun 2020",
            transactionInfo: "Mobile App",
            transactionType: TransactionType.pending,
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          const Text(
            "Member since 2021",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildPot() => Column(
        children: const [
          Text(
            "৳ 5,000,000.00",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.orange),
          ),
          SizedBox(height: 4),
          Text(
            "Total Donation Pot",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Donate',
        onClicked: () {},
      );
}
