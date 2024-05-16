import 'package:bloc_demo/login/model/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginReqEvent extends LoginEvent {
  final LoginReqModel? loginReqModel;

  LoginReqEvent({required this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}
