import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_provider_state.freezed.dart';

@freezed
class LoginProviderState with _$LoginProviderState {
  factory LoginProviderState({
    required bool isLoading,
    required String token,
  }) = _LoginProviderState;
}
