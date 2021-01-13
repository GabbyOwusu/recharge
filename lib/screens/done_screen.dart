import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/widgets/recharge_button.dart';
import 'package:share/share.dart';

class Done extends StatefulWidget {
  final File image;

  const Done({Key key, this.image}) : super(key: key);
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  FileProvider get provider {
    return Provider.of<FileProvider>(context, listen: false);
  }

  void initState() {
    processImage(widget.image);
    super.initState();
  }

  Future processImage(File image) async {
    await provider.processImage(image).then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Go back',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              isLoading
                  ? 'Your voucher will appear here'
                  : provider.extracted ?? 'Please rescan',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            Text(
              isLoading
                  ? 'Scanning...'
                  : (provider.extracted == null)
                      ? 'Failed to scan image'
                      : 'Scanned Successfully',
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: isLoading
                    ? Colors.transparent
                    : (provider.extracted == null)
                        ? Colors.transparent
                        : Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  isLoading
                      ? Icons.done
                      : provider.extracted == null
                          ? Icons.cancel_outlined
                          : Icons.done,
                  color: isLoading
                      ? Colors.transparent
                      : provider.extracted == null
                          ? Colors.red
                          : Colors.white,
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
                      provider.runUssd(provider.extracted);
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
                    ontapped: () async {
                      await Share.share(provider.extracted);
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
