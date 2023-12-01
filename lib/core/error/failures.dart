abstract class Failures {
  String message;

  Failures(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalFailures extends Failures {
  LocalFailures(super.message);
}
