
import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String message;
  final String token;

  const AuthResponseEntity({
    required this.message,
    required this.token,
  });

  @override
  List<Object?> get props => [message, token];
}