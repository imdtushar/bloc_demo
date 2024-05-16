import 'package:bloc_demo/login/bloc/login_bloc.dart';
import 'package:bloc_demo/login/bloc/login_event.dart';
import 'package:bloc_demo/login/bloc/login_state.dart';
import 'package:bloc_demo/login/model/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginInitialState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(hintText: "UserName"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var bloc = BlocProvider.of<LoginBloc>(context);
                      var requestData = LoginReqModel(
                        username: userController.text,
                        password: passwordController.text,
                      );
                      bloc.add(
                        LoginReqEvent(
                          loginReqModel: requestData,
                        ),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            );
          } else if (state is LoginLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoginSuccessState) {
            return Center(
              child: Text(
                state.loginRespModel?.email ?? "",
                style: const TextStyle(color: Colors.green),
              ),
            );
          } else if (state is LoginErrorState) {
            return Center(
              child: Text(
                state.errorMessage ?? "",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
