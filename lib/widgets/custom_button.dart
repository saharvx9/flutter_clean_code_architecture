import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {

  final bool enable;
  final String text;
  final Function onClick;
  final Color color;

  const CustomButton({Key key,
    @required this.enable,
    @required this.text,
    @required this.onClick,
    this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: enable ? 5 : 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: color??Colors.grey[300],
        child: Text(text),
        onPressed: enable ? () => onClick() : null);
  }
}
