import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/register/logic/signup_cubit.dart';

class SignUpGender extends StatefulWidget {
  const SignUpGender({super.key});

  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}

class _SignUpGenderState extends State<SignUpGender> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your gender:',
          style: TextStyles.font15DarkBlueMedium,
        ),
        DropdownButton<String>(
          hint: const Text('Choose Gender'),
          value: _selectedGender,
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;

              context
                  .read<SignupCubit>()
                  .changeGender(newValue == 'Male' ? 0 : 1);
            });
          },
          items: <String>['Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
