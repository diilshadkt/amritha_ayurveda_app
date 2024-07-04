import 'package:amrita_ayurvedic_app/features/home/domain/entity/patient_entity.dart';

abstract class ApiRepository{
   Future<List<PatientEntity>> getDatas();
}