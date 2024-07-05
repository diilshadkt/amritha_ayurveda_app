// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@freezed
class BranchModel with _$BranchModel {
  const factory BranchModel({
    // ignore: duplicate_ignore
    // ignore: invalid_annotation_target
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "patients_count") required int patientsCount,
    @JsonKey(name: "location") required String location,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "mail") required String mail,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "gst") required String gst,
    @JsonKey(name: "is_active") required bool isActive,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
