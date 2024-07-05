import 'package:amrita_ayurvedic_app/features/home/domain/entity/patient_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/usecase/get_patient_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PatientProvider extends ChangeNotifier {
  late Future<List<PatientEntity>> patientsFuture;

  PatientProvider() {
    getPatient();
  }

  void getPatient() {
    patientsFuture =
        GetPatientsUsecase(repository: GetIt.I.get<ApiRepository>())();
    notifyListeners();
  }
}
