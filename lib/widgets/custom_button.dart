import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final bool enable;
  final String text;
  final Function onClick;
  final Color? color;

  const CustomButton({Key? key,
    required this.enable,
    required this.text,
    required this.onClick,
    this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color??Colors.black,
        ),
        onPressed: enable ? () => onClick() : null,
        child: Text(text));
  }
}
