import 'package:dio/dio.dart';
import 'package:looky/common/resources/data_state.dart';
import 'package:looky/infrastructure/model/barber_list_model.dart';
import 'package:looky/infrastructure/model/barber_service_model.dart';
import 'package:looky/infrastructure/provider/api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository(this.apiProvider);

  // Barber Services
  Future<dynamic> fetchBarberServicesData() async {
    try {
      Response response = await apiProvider.callBarberServicesData();
      if (response.statusCode == 200) {
        BarberServiceModel barberServicesModel =
            BarberServiceModel.fromJson(response.data);
        return DataSuccess(barberServicesModel);
      } else {
        return const DataFailed('Something went wrong, please try again.');
      }
    } catch (e) {
      return const DataFailed('No internet connection');
    }
  }

  // Barber List
  Future<dynamic> fetchBarberListData() async {
    try {
      Response response = await apiProvider.callBarberListData();
      if (response.statusCode == 200) {
        BarberListModel barberListModel =
            BarberListModel.fromJson(response.data);
        return DataSuccess(barberListModel);
      } else {
        return const DataFailed('Something went wrong, please try again.');
      }
    } catch (e) {
      return const DataFailed('No internet connection');
    }
  }
}
