/// [Exception] thrown for server related error and device error
class DeviceException implements Exception {
  /// Constructor for exceptions

  /// Error message
  final String message;

  /// Error code
  final int statusCode;

  DeviceException(this.message, {this.statusCode = 404});

  /// Convert error messages from database
  factory DeviceException.fromJson(Map<String, dynamic> json,
          {int code = 404}) =>
      DeviceException(json['detail'] as String, statusCode: code);

  @override
  String toString() => message;
}

class AlreadyAMemberException implements Exception {
  final String message;
  AlreadyAMemberException(this.message);
  @override
  String toString() => message;
}
