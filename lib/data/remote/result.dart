sealed class Result {}

class Failure extends Result {
  String message;

  Failure(this.message);
}

class Success<T> extends Result {
  final T data;

  Success(this.data);
}
