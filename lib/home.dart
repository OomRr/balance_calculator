import 'dart:io';
import 'package:balance_calculator/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var money = 'ادخل قيمة المال', balance = 'ادخل قيمة الرصيد';
  var moneyOut = 0.0, balanceOut = 0.0;
  TextEditingController m = TextEditingController();
  TextEditingController b = TextEditingController();

  @override
  void dispose() {
    m.dispose();
    b.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'احسب رصيدك',
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.deepOrange,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الفلوس',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: m,
              hintText: money.toString(),
              onChange: (text) {
                money = text;
              },
              suffixIcon: const Icon(Icons.account_balance_wallet_rounded),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (money.isNotEmpty && money != 'ادخل قيمة المال') {
                    balanceOut = double.parse(m.text) * 70 / 100;
                    b.text = balanceOut.toStringAsFixed(2);
                    money = 'ادخل قيمة المال';
                  }
                  if (balance.isNotEmpty && balance != 'ادخل قيمة الرصيد') {
                    moneyOut = double.parse(b.text) * 10 / 7;
                    m.text = moneyOut.toStringAsFixed(2);
                    balance = 'ادخل قيمة الرصيد';
                  }
                });
              },
              icon: const Icon(
                Icons.swap_horiz_outlined,
                size: 30,
              ),
              color: Colors.deepOrange,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الرصيد',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: b,
              hintText: balance,
              onChange: (text) {
                balance = text;
              },
              suffixIcon: const Icon(Icons.install_mobile_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
