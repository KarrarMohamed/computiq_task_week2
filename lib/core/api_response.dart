abstract class ApiResponse {}

abstract class SuccessResponse implements ApiResponse {
  late int statusCode;
  late String data;
}

abstract class FailureResponse implements ApiResponse {
  late int statusCode;
  late String data;
}

class Success implements SuccessResponse {
  @override
  String data;

  @override
  int statusCode;

  Success({required this.data, this.statusCode = 200});
}

class Failure implements FailureResponse {
  @override
  String data;

  @override
  int statusCode;

  Failure({this.data = 'Something went wrong!!', required this.statusCode});
}

class NoInternetConnection implements FailureResponse {
  @override
  String data = 'No Internet Connection';

  @override
  int statusCode = 0;
}

class ServerNotResponding implements FailureResponse {
  @override
  String data = 'Server is not responding!';

  @override
  int statusCode = 503;
}
