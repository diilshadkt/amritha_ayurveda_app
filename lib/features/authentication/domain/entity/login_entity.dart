import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required bool? status,
    required String? message,
    required String? token,
    required bool? isSuperuser,
  }) = _LoginEntity;
}
