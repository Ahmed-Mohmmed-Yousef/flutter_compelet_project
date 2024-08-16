import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, and a digit.';
    }
    return null;
  }

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (data) {
      emit(LoginState.success(data));
    }, failure: (error) {
      emit(LoginState.error(error: error.failure.message ?? ''));
    });
  }
}
