import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio;

  ApiProvider({required this.dio});

  Future<Response> callBarberServicesData() async {
    final response = await dio.get('https://lookee.nwhco.ir/aapi/services/');

    return response;
  }

  Future<Response> callBarberListData() async {
    final response =
        await dio.get('https://lookee.nwhco.ir/aapi/barbers/home/');

    return response;
  }
}
