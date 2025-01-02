part of 'register_bloc.dart';

class RegisterError extends RegisterState {
  final String errorMessage;
  RegisterError({required this.errorMessage});
}

class RegisterLoading extends RegisterState {}

class RegisterState {}

class RegisterStep extends RegisterState {
  final int step;
  RegisterStep({required this.step});
}

class RegisterSuccess extends RegisterState {
  final String fullName;
  final String email;

  RegisterSuccess({required this.fullName, required this.email});
}
