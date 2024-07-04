import 'package:amrita_ayurvedic_app/features/home/domain/entity/patient_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';

final class GetPatientsUsecase {
  final ApiRepository repository;
  GetPatientsUsecase({required this.repository});

  Future<List<PatientEntity>> call() async {
    try {
      return await repository.getDatas();
    } catch (e) {
      throw Exception('Error');
    }
  }
}