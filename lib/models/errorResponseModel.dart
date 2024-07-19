
import 'package:json_annotation/json_annotation.dart';

part 'errorResponseModel.g.dart';

@JsonSerializable()
class ErrorResponseModel {
  String message;

  ErrorResponseModel(this.message);

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}