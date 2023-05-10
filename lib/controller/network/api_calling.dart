import 'package:evpoint/utils/imports.dart';
import 'package:dio/dio.dart';

class ApiCallController extends GetxController {
  late Dio dio;

  @override
  void onInit() {
    dio = Dio();
    fetchData();
    super.onInit();
  }

  fetchData() async {
    final response = await dio.get('https://dart.dev');
    print(response.statusCode);
  }
}
