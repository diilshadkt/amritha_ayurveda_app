import 'package:amrita_ayurvedic_app/core/constants/api_constants.dart';
import 'package:amrita_ayurvedic_app/core/exceptions/api/api_exception.dart';
import 'package:amrita_ayurvedic_app/features/home/data/datasource/api_datasource.dart';
import 'package:amrita_ayurvedic_app/features/home/data/model/api_model.dart';
import 'package:amrita_ayurvedic_app/features/home/data/model/branch_model.dart';
import 'package:dio/dio.dart';

class ApiDatasourceImpl implements ApiDatasource {
  final Dio dio = Dio();

  static const token = ApiConstants.token;

  static const link = ApiConstants.baseUrl;
  static const patientLink = ApiConstants.patientList;
  
  static const branchLink = ApiConstants.brancheList;

  @override
  Future<List<Patient>> getPatientsData() async {
    try {
      dio.options.headers["Authorization"] = 'Bearer $token';
      final response = await dio.get(link + patientLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Patient>[];
        for (final result in data['patient']) {
          datas.add(
            Patient.fromJson(result),
          );
        }
        return datas;
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BranchModel>> getBranches() async{
   try {
      dio.options.headers["Authorization"] = 'Bearer $token';
      final response = await dio.get(link + branchLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <BranchModel>[];
        for (final result in data['branches']) {
          datas.add(
            BranchModel.fromJson(result),
          );
        }
        return datas;
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
