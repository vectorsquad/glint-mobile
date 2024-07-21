part of 'models.dart';

@MappableClass()
class ErrorResponse with ErrorResponseMappable {
  String message;

  ErrorResponse(this.message);
}
