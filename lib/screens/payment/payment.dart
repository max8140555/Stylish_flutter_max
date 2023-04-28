import 'package:flutter/material.dart';
import 'package:stylish_max/platforms/tappay_platform.dart';
import '../../models/prime.dart';
import '../../widgets/stylish_app_bar.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TappayChannel tappayChannel = TappayChannel();
  final int appId = 12348;
  final String appKey =
      'app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF';

  @override
  void initState() {
    super.initState();
    tappayChannel.setupTappay(
        appId: appId,
        appKey: appKey,
        serverType: TappayServerType.sandBox,
        errorMessage: (error) {
          print(error);
          toast(context, error);
        });
  }

  String cardNumber = '';

  String dueMonth = '';

  String dueYear = '';

  String ccv = '';

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
                          labelText: '到期月',
                          hintText: 'MM',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        onChanged: (value) {
                          dueMonth = value;
                        }),
                  ),
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: '到期年',
                          hintText: 'YY',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        onChanged: (value) {
                          dueYear = value;
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
                          ccv = value;
                        }),
                  )
                ],
              ),
              GestureDetector(
                onTap: () async {
                  var isCardValid = await tappayChannel.isCardValid(
                      cardNumber: cardNumber,
                      dueMonth: dueMonth,
                      dueYear: dueYear,
                      ccv: ccv);
                  print('isCardValid: $isCardValid');
                  if(isCardValid) {
                    Prime prime = await tappayChannel.getPrime(
                        cardNumber: cardNumber,
                        dueMonth: dueMonth,
                        dueYear: dueYear,
                        ccv: ccv);
                    if(prime.prime == null || prime.prime?.isEmpty == true){
                      print('status: ${prime.status}, message: ${prime.message}');
                      if (context.mounted) {
                        toast(context,
                            'status: ${prime.status}, message: ${prime.message}');
                      }
                    } else {
                      print('prime: ${prime.prime}');
                      if (context.mounted) {
                        toast(context, 'prime: ${prime.prime}');
                      }
                    }
                  }
                },
                child: Text("付款"),
              )
            ],
          ),
        ));
  }

  void toast(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }
}
