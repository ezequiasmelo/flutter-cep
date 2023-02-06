import 'package:flutter/material.dart';

class RichTextCustom extends StatelessWidget {
  final String text1;
  final String text2;

  const RichTextCustom({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: const TextStyle(fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
