import 'package:flutter/material.dart';

import 'package:flutter_cep/constants/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator? validator;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.darkGrey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '#####-###',
            filter: {'#': RegExp(r'[0-9xX]')},
            type: MaskAutoCompletionType.lazy,
          )
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorMaxLines: 3,
          helperMaxLines: 3,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
