import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow('At least 1 lower case latter', hasLowerCase),
        verticalSpacing(2),
        _buildValidationRow('At least 1 upper case latter', hasUpperCase),
        verticalSpacing(2),
        _buildValidationRow('At least 1 special chars', hasSpecialChar),
        verticalSpacing(2),
        _buildValidationRow('At least 1 number', hasNumber),
        verticalSpacing(2),
        _buildValidationRow('At least 1 minimum length', hasMinLength),
        verticalSpacing(2),
        _buildValidationRow('At least 8 minimum length', hasMinLength),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: isValid ? Colors.green : ColorsManager.gray,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            color: isValid ? Colors.green : ColorsManager.gray,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
