import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/email_and_password_form.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpacing(24),
              Column(
                children: [
                  const EmailAndPasswordForm(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  verticalSpacing(24),
                  AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        _validateTheDoLogin(context);
                      }),
                  verticalSpacing(16),
                  const TermsAndConditionsText(),
                  verticalSpacing(32),
                  const AlreadyHaveAccountText(),
                  const LoginBlocListener(),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _validateTheDoLogin(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginState(
        LoginRequestBody(
          email: cubit.emailController.text,
          password: cubit.passwordController.text,
        ),
      );
    }
  }
}
