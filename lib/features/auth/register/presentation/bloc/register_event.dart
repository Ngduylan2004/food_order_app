part of 'register_bloc.dart';

class RegisterEvent {}

class RegisterEventNextStep extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;

  RegisterEventNextStep(
      {required this.fullName, required this.email, required this.password});
}

class RegisterStepBackEvent extends RegisterEvent {
  final int step;
  RegisterStepBackEvent({required this.step});
}

class RegisterStepEvent extends RegisterEvent {
  final int step;
  RegisterStepEvent({required this.step});
}
