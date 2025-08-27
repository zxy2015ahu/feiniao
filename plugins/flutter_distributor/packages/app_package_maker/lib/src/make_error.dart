class MakeError extends Error {
  MakeError([this.message]);

  final String? message;

  @override
  String toString() {
    var message = this.message;
    return (message != null) ? 'MakeError: $message' : 'MakeError';
  }
}
