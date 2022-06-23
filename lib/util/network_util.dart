import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digital_collection/base/config_util.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetWorkUtil {
  NetWorkUtil() {
    initCookieManager();
  }

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Dio _dio = new Dio();

  static Dio getDio() => _dio;

  static Future getHttp(String url) async {
    EasyLoading.show(status: 'loading...');

    try {
      Response response = await getDio().get(ConfigUtil.baseUrl + url);
      print('请求数据:' + response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpParam(String path, {Map<String, dynamic>? data}) async {
    EasyLoading.show(status: 'loading...');
    data = data ?? {};
    data.forEach((key, value) {
      if (path.indexOf(key) != -1) {
        path = path.replaceAll(":$key", value.toString());
      }
    });

    try {
      Response response = await getDio().get(ConfigUtil.baseUrl + path);
      print('请求数据:' + response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpQuery(String url, Map<String, String> map) async {
    EasyLoading.show(status: 'loading...');

    try {
      Response response =
          await getDio().get(ConfigUtil.baseUrl + url, queryParameters: map);
      print('请求数据:' + response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpByUrl(String url) async {
    EasyLoading.show(status: 'loading...');
    try {
      Response response = await Dio().get(url);
      EasyLoading.dismiss();
      print('请求数据:' + response.toString());
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future initCookieManager() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var cj = new PersistCookieJar(
        ignoreExpires: true, storage: FileStorage(tempPath));
    _dio.interceptors.add(CookieManager(cj));
    print("初始化cookie");
  }

  static Future postHttp(String url, Map<String, dynamic> map,
      {loginPage = false, dismissed = false}) async {
    if (!dismissed) {
      EasyLoading.show(status: '加载中...');
    }
    Options option = new Options();

    Map<String, String> headers = new Map<String, String>();
    headers["Content-Type"] = "application/json";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    print("token === " + token);

    if (token.length > 0) {
      headers["Authorization"] = token;
    }

    String device = "";
    if (Platform.isAndroid) {
      headers["os"] = 'android';
      // AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      // device = readAndroidInfo(androidInfo);
    } else if (Platform.isIOS) {
      headers["os"] = 'ios';
      // IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      // device = readIosInfo(iosInfo);
      // Fluttertoast.showToast(msg: "IosId $device");
    } else if (Platform.isWindows) {
      headers["os"] = 'windows';
    } else if (Platform.isMacOS) {
      headers["os"] = 'macos';
    } else if (Platform.isLinux) {
      headers["os"] = 'linux';
    } else {
      device = "Unknown";
    }
    headers["appVersion"] = sharedPreferences.getString("version")??"";

    // if (device.length > 0) {
    //   headers["device"] = device;
    // }
    // headers["device"] = Provider.of<PrefetchData>(
    //         navigatorKey.currentState!.context,
    //         listen: false)
    //     .deviceId;
    //
    // headers["device"] = sharedPreferences.getString("deviceId") ?? "---";

    option.headers = headers;
    try {
      // FormData formData = FormData.fromMap(map);

      Response response = await getDio()
          .post(ConfigUtil.baseUrl + url, data: map, options: option);

      print('请求数据:' + response.toString());
      Map resultMap = json.decode(response.toString());
      EasyLoading.dismiss();
      // if (resultMap["code"] == 1005) {
      //   if (!loginPage) {
      //   }
      //   navigatorKey.currentState!.pushAndRemoveUntil(
      //       MaterialPageRoute(builder: (context) => (LoginPage(true))),
      //           (check) => false);
      //   return;
      // }
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

// static String readAndroidInfo(AndroidDeviceInfo info) {
//   return info.androidId??"";
// }
//
// static String readIosInfo(IosDeviceInfo info) {
//   return info.identifierForVendor??"";
// }
}
