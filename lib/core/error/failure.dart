abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String message = "A server failure occurred."])
      : super(message);
}

class CacheFailure extends Failure {
  CacheFailure([String message = "A cache failure occurred."]) : super(message);
}
