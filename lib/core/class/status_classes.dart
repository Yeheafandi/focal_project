class StatusClasses {
  final String type;
  final String? message;
  const StatusClasses._(this.type, [this.message]);

  static const success = StatusClasses._("success");
  //---------------- error states ---------------------
  static const offlineError = StatusClasses._(
    "offlineError",
    "Please check your internet connection",
  );

  static const serverError = StatusClasses._("serverError");

  static const permissionDenied = StatusClasses._(
    "permissionDenied",
    "Your session has expired, please log in again",
  );

  static const notFound = StatusClasses._(
    "notFound",
    "The requested data was not found or has been deleted",
  );

  static const invalidData = StatusClasses._(
    "invalidData",
    "The entered data is invalid, please check and try again",
  );

  static const unauthorized = StatusClasses._(
    "unauthorized",
    "Unauthorized access",
  );

  //--------------------- custom error---------------------
  factory StatusClasses.customError(String message) =>
      StatusClasses._("customError", message);
}
