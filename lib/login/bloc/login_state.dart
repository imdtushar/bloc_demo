import 'package:bloc_demo/login/model/login_resp_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final LoginRespModel? loginRespModel;

  LoginSuccessState({required this.loginRespModel});

  @override
  List<Object?> get props => [loginRespModel];
}

class LoginErrorState extends LoginState {
  late final String? errorMessage;

  LoginErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
