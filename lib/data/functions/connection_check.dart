import 'package:dio/dio.dart';

Future<bool> connectionCheck() async {
  try {
    final response = await Dio().get(
      'https://www.google.com',
      options: Options(
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    final isConnected = response.statusCode == 200;

    return isConnected;
  } catch (e) {
    return false;
  }
}
