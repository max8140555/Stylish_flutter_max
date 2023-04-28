import 'package:flutter/material.dart';

import '../../widgets/stylish_app_bar.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  String cardNumber = '';
  String cardDate = '';
  String cardPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '0000 0000 0000 0000',
                  suffixIcon: Icon(Icons.credit_card),
                ),
                onChanged: (value) {
                  cardNumber = value;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: '到期年月',
                          hintText: 'MM/YY',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        onChanged: (value) {
                          cardDate = value;
                        }),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: '信用卡密碼',
                          hintText: '請輸入信用卡背面的三位數字',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          cardPassword = value;
                        }),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
