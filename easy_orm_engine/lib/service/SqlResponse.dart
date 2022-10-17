abstract class SqlResponse<TResultType> {}

class SqlResponse_Success<TResultType> implements SqlResponse<TResultType> {
  final TResultType result;

  SqlResponse_Success(this.result);
}

class SqlResponse_Failure<TResultType> implements SqlResponse<TResultType> {
  final String failureMessage;

  SqlResponse_Failure(this.failureMessage);
}
