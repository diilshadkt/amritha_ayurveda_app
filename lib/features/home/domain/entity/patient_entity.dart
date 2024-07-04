import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_entity.freezed.dart';

@freezed
class PatientEntity with _$PatientEntity {
  const factory PatientEntity({
    required int id,
    required List<PatientdetailsSet>patientdetailsSet,
    required String user,
    required String payment,
    required String name,
    required String phone,
    required String address,
    required dynamic price,
    required int totalAmount,
    required int discountAmount,
    required int advanceAmount,
    required int balanceAmount,
    required DateTime? dateNdTime,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PatientEntity;
}

@freezed
class Branch with _$Branch {
  const factory Branch({
    required int id,
    required String name,
    required int patientsCount,
    required String location,
    required String phone,
    required String mail,
    required String address,
    required String gst,
    required bool isActive,
  }) = _Branch;
}

@freezed
class PatientdetailsSet with _$PatientdetailsSet {
  const factory PatientdetailsSet({
    required int id,
    required String male,
    required String female,
    required int patient,
    required int? treatment,
    required String? treatmentName,
  }) = _PatientdetailsSet;
}
