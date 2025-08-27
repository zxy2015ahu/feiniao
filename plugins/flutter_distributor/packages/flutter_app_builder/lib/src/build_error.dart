class BuildError extends Error {
  BuildError([this.message]);

  final String? message;

  @override
  String toString() {
    var message = this.message;
    return (message != null) ? 'BuildError: $message' : 'BuildError';
  }
}
