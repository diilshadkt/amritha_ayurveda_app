import 'package:amrita_ayurvedic_app/features/home/data/datasource/api_datasource.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/entity/patient_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiDatasource datasource;
  ApiRepositoryImpl({required this.datasource});

  @override
  Future<List<PatientEntity>> getDatas() async {
    final data = await datasource.getPatientsData();

    late List<PatientEntity> results;

    results = [
      for (final result in data)
        PatientEntity(
          id: result.id,
          patientdetailsSet: [
            for (final data in result.patientdetailsSet)
              PatientdetailsSet(
                  id: data.id,
                  male: data.male,
                  female: data.female,
                  patient: data.patient,
                  treatment: data.treatment,
                  treatmentName: data.treatmentName),
          ],
          user: result.user,
          payment: result.payment,
          name: result.name,
          phone: result.phone,
          address: result.address,
          price: result.price,
          totalAmount: result.totalAmount,
          discountAmount: result.discountAmount,
          advanceAmount: result.advanceAmount,
          balanceAmount: result.balanceAmount,
          dateNdTime: result.dateNdTime,
          isActive: result.isActive,
          createdAt: result.createdAt,
          updatedAt: result.updatedAt,
        ),
    ];
    return results;
  }
}
