import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductApi extends GetxService {
  Dio? _dio;
  String productUrl =
      'http://fakestoreapi.com/products?fbclid=IwAR2yLhmTope8nYxciVO-UbIseDMTjZMoL_4kXLUUcpQfu3GJLv3NWNvfGBs';

  static ProductApi get find => Get.find<ProductApi>();

  Dio get http {
    _dio ??= Dio();
    return _dio!;
  }

  Future<dynamic> getProduct() async {
    final response = await http.get(
      productUrl,
      options: Options(headers: {
        'Content-type': 'application/json',
        'charset': 'UTF-8',
      }, responseType: ResponseType.json),
    );
    return response.data;
  }
}
