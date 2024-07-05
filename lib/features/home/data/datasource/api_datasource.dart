import 'package:amrita_ayurvedic_app/features/home/data/model/api_model.dart';
import 'package:amrita_ayurvedic_app/features/home/data/model/branch_model.dart';

abstract class ApiDatasource {
  Future<List<Patient>> getPatientsData();
  Future<List<BranchModel>> getBranches();
}
