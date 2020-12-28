import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/widgets/recharge_button.dart';

class Done extends StatefulWidget {
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  FileProvider get provider {
    return Provider.of<FileProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Your Voucher code',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 100),
            Text(
              provider.extracted == ''
                  ? 'Your voucher will appear here'
                  : provider.extracted,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            Text(
              provider.extracted != ''
                  ? 'Your voucher was scanned successfully'
                  : 'Sorry rescan image',
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: provider.extracted == ''
                    ? Colors.transparent
                    : Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  provider.extracted == '' ? Icons.cancel_outlined : Icons.done,
                  color: provider.extracted == '' ? Colors.red : Colors.white,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RechargeButton(
                    buttonColor: Colors.green,
                    borderColor: Colors.transparent,
                    textColor: Colors.white,
                    buttonLabel: 'Recharge',
                    ontapped: () {
                      // provider.runUssd(provider.extracted);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RechargeButton(
                    buttonColor: Colors.transparent,
                    borderColor: Colors.green,
                    textColor: Colors.green,
                    buttonLabel: 'Share',
                    ontapped: () {
                      // Share.share(provider.extracted);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
