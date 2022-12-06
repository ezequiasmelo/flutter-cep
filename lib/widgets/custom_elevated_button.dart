// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_cep/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool loading;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.loading,
  }) : super(key: key);

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(6.0));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: Material(
        child: Ink(
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: AppColors.darkGrey,
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: onPressed,
            child: Align(
              child: !loading
                  ? Text(
                      text,
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
