import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures

class DatabaseFailure extends Failure {}

/// when device is offline
class NetworkFailure extends Failure {}

/// when server is down
class ServerFailure extends Failure {}

/// when cache is empty
class CacheFailure extends Failure {}

/// when data is null
class NullFailure extends Failure {}

/// when auth failed
class AuthFailure extends Failure {}

/// when auth failed
class AuthCancelByUser extends Failure {}

String failureToMessage(Failure failure) {
  if (failure is NetworkFailure) {
    return "No Internet Connection";
  } else if (failure is AuthFailure) {
    return "Failed to Auth";
  } else if (failure is ServerFailure) {
    return "Server Error";
  } else if (failure is CacheFailure) {
    return "Cant get data";
  } else if (failure is AuthCancelByUser) {
    return "Auth failed: canceled by User";
  }
  return "Unknown Failure";
}
