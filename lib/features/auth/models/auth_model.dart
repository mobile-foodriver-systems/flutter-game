import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String? accessToken;
  final String? refreshToken;

  AuthModel({
    this.accessToken,
    this.refreshToken,
  });

  bool get isEmpty =>
      (accessToken?.isEmpty ?? true) && (refreshToken?.isEmpty ?? true);

  bool get isNotEmpty => !isEmpty;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
