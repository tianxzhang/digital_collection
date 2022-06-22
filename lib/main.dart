// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'base/prefetch_data.dart';
import 'login_register/splash_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  setCustomErrorPage();
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PrefetchData())],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static BuildContext? appContext;

  @override
  void initState() {
    // Provider.of<PrefetchData>(context, listen: false).getDeviceInfo();
    MyAppState.appContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Locale> an = [
      const Locale('zh', 'CH'),
      const Locale('en', 'US'),
    ];
    List<Locale> ios = [
      const Locale('en', 'US'),
      const Locale('zh', 'CH'),
    ];

    return ScreenUtilInit(
      designSize: Size(187.5, 406),
      builder: (context, child) => MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // ChineseCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // locale: const Locale("en", "US"),
        debugShowCheckedModeBanner: false,
        title: "数字收藏",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        // builder: (BuildContext context, Widget? child) {
        //   return FlutterSmartDialog(child: child);
        // },
        home: Splash(),
        // supportedLocales: Platform.isIOS ? ios : an,
      ),
      // builder: () => MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (_) => CountDownTimeModel(60, 1))
      //   ],
      //   child: MaterialApp(
      //     localizationsDelegates: [
      //       GlobalMaterialLocalizations.delegate,
      //       GlobalWidgetsLocalizations.delegate,
      //       // ChineseCupertinoLocalizations.delegate,
      //     ],
      //     // locale: const Locale("en", "US"),
      //     debugShowCheckedModeBanner: false,
      //     title: "球知APP",
      //     theme: ThemeData(
      //       primarySwatch: Colors.blue,
      //     ),
      //     builder: EasyLoading.init(),
      //     home: LoginPage(),
      //     supportedLocales: Platform.isIOS ? ios : an,
      //   ),
      // ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void setCustomErrorPage() {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print(flutterErrorDetails.toString());
    return Center(
      child: Text("请重新加载"),
    );
  };
}