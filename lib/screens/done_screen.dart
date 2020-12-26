import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/widgets/recharge_button.dart';

class Done extends StatefulWidget {
  final ImageSource source;

  const Done({Key key, this.source}) : super(key: key);
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  FileProvider get provider {
    return Provider.of<FileProvider>(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider.processImage(widget.source);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Voucher code',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                SizedBox(height: 100),
                Text(
                  provider.extracted,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  provider.extracted == ''
                      ? 'Your voucher was scanned successfully'
                      : 'Sorry rescan image',
                ),
                SizedBox(height: 50),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: RechargeButton(
                buttonColor: Colors.green,
                borderColor: Colors.transparent,
                textColor: Colors.white,
                buttonLabel: 'Recharge',
                ontapped: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: RechargeButton(
                buttonColor: Colors.transparent,
                borderColor: Colors.green,
                textColor: Colors.green,
                buttonLabel: 'Share',
                ontapped: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
