import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_entity.freezed.dart';

@freezed
class BranchEntity with _$BranchEntity {
  const factory BranchEntity({
    required int id,
    required String name,
    required int patientsCount,
    required String location,
    required String phone,
    required String mail,
    required String address,
    required String gst,
    required bool isActive,
  }) = _BranchEntity;
}
