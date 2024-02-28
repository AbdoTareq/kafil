abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class OfflineFailure extends Failure {
  const OfflineFailure({super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({super.message});
}

/// exception in fromMap or fromJson
class SerializeFailure extends Failure {
  const SerializeFailure({super.message});
}
