import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/screens/splashscreen.dart';
import 'package:recharge/services/sl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recharge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        home: Splash(),
      ),
    );
  }
}
