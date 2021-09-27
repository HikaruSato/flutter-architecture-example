enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class AppException implements Exception {
  AppException({
    this.innerException,
    this.message,
    this.type = AppErrorType.unknown,
  });

  Exception? innerException;
  String? message;
  AppErrorType type = AppErrorType.unknown;
}
