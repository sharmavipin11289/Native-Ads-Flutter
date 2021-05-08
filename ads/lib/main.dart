import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'dart:io';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Admob.requestTrackingAuthorization();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ads'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.greenAccent,
              height: 60,
              width: double.infinity,
              child: AdmobBanner(
                adUnitId: getBannerAdUnitId(),
                adSize: AdmobBannerSize.BANNER,
              ),
            ),
            Container(
              color: Colors.greenAccent,
              height: 400,
              width: double.infinity,
              child: NativeAdmob(
                adUnitID: 'ca-app-pub-3940256099942544/8135179316',
                numberAds: 3,
                controller: NativeAdmobController(),
                type: NativeAdmobType.full,
              ),
            )
          ],
        ),
      ),
    );
  }

//Get banner ads
  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }
}
