import 'package:cloud_certify/pages/home/homescreen.dart';
import 'package:flutter/material.dart';

class PayNowBody extends StatelessWidget {
  const PayNowBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/success.png'),
          SizedBox(height: 64),
          Text('Successfully completed checkout'),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
            //send post to paymentservice and redirect_to confirmation. post payment(cert id)
            icon: Icon(Icons.home_filled),
            label: Text('Back to home'),
          ),
        ],
      ),
    );
  }
}
