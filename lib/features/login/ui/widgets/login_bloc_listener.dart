import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (ctx, newState) =>
          newState is Loading || newState is Error || newState is Success,
      listener: (ctx, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.darkBlue,
                  ),
                );
              },
            );
          },
          success: (response) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                icon: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32.sp,
                ),
                content: Text(
                  error,
                  style: TextStyles.font15DarkBlueMeduim,
                ),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Got it',
                      style: TextStyles.font14BlueSimeBold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
