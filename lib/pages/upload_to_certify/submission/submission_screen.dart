import 'package:provider/provider.dart';
import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { ECOCASH }

enum ReceiptChannel { WHATSAPP, EMAIL }

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({Key? key}) : super(key: key);

  @override
  _SubmissionScreenState createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  ReceiptChannel _channelType = ReceiptChannel.WHATSAPP;
  TextEditingController _controller = TextEditingController();
  String? _extension;
  String rChannel = 'WHATSAPP';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<CertifyViewModel>().isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Submission'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 16),
            child: Text(
                'Would you like to receive your files via EMAIL or WHATSAPP?'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: DropdownButton<ReceiptChannel>(
                hint: const Text('SEND FILES VIA?'),
                value: _channelType,
                items: ReceiptChannel.values
                    .map((channel) => DropdownMenuItem<ReceiptChannel>(
                          child: Text(channel.toString().split('.').last),
                          value: channel,
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                      _channelType = value!;
                      rChannel = _channelType.toString().split('.').last;
                      print(rChannel);
                      if (_channelType != ReceiptChannel.WHATSAPP) {
                        _controller.text = _extension = '';
                      }
                    })),
          ),
          SizedBox(height: 36),
          isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.black),
                    ],
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () async {
                    context
                        .read<CertifyViewModel>()
                        .certifySubmit(
                            receiptMethod: rChannel, context: context)
                        .then((value) => print('Done submitting Certificates'));
                  },
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('Done'),
                )
        ],
      ),
    );
  }
}
