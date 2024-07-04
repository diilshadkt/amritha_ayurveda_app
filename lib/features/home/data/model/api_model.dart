// ignore_for_file: invalid_annotation_target

import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

@freezed
class ApiModel with _$ApiModel {
  const factory ApiModel({
    @JsonKey(name: "status") required bool status,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "patient") required List<Patient> patient,
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, Object?> json) =>
      _$ApiModelFromJson(json);
}

@freezed
class Patient with _$Patient {
  const Patient._();
  const factory Patient({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "patientdetails_set")
    required List<PatientdetailsSet> patientdetailsSet,
    @JsonKey(name: "branch") required Branch? branch,
    @JsonKey(name: "user") required String user,
    @JsonKey(name: "payment") required String payment,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "price") required dynamic price,
    @JsonKey(name: "total_amount") required int totalAmount,
    @JsonKey(name: "discount_amount") required int discountAmount,
    @JsonKey(name: "advance_amount") required int advanceAmount,
    @JsonKey(name: "balance_amount") required int balanceAmount,
    @JsonKey(name: "date_nd_time") required DateTime? dateNdTime,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, Object?> json) =>
      _$PatientFromJson(json);

  Patient apiModelFromJson(String str) {
    return Patient.fromJson(json.decode(str));
  }
}

@freezed
class Branch with _$Branch {
  const factory Branch({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "patients_count") required int patientsCount,
    @JsonKey(name: "location") required String location,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "mail") required String mail,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "gst") required String gst,
    @JsonKey(name: "is_active") required bool isActive,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
class PatientdetailsSet with _$PatientdetailsSet {
  const factory PatientdetailsSet({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "male") required String male,
    @JsonKey(name: "female") required String female,
    @JsonKey(name: "patient") required int patient,
    @JsonKey(name: "treatment") required int? treatment,
    @JsonKey(name: "treatment_name") String? treatmentName,
  }) = _PatientdetailsSet;

  factory PatientdetailsSet.fromJson(Map<String, dynamic> json) =>
      _$PatientdetailsSetFromJson(json);
}
