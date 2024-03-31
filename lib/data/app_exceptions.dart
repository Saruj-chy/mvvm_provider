
class AppExceptions implements Exception{
  final _message;
  final _prefix;

  AppExceptions(this._message, this._prefix);
  @override
  String toString() {
    // TODO: implement toString
    return "$_message $_prefix";
  }
}

class FetchDataException extends AppExceptions{

  FetchDataException([String? message]): super(message, "Error During Communication");
}

class BadRequestException extends AppExceptions{

  BadRequestException([String? message]): super(message, "Error During Communication");
}
class UnauthorizedException extends AppExceptions{

  UnauthorizedException([String? message]): super(message, "Error During Communication");
}