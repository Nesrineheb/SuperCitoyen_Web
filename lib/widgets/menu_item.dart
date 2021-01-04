import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
   final Function touched;
  final bool active;
  const MenuItem({
    Key key,
    this.title,
    this.press,
    this.active,
    this.touched,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Color.fromRGBO(31, 32, 38, 100),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
