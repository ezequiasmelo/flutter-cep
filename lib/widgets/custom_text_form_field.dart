import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'CEP obrigatório';
          }
          return null;
        },
      ),
    );
  }
}
