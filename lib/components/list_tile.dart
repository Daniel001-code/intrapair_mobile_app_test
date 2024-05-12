import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final void Function()? onTap;
  final Widget? leading;
  final Widget? title;

  const ListTiles(
      {super.key,
      required this.onTap,
      required this.leading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: leading,
          title: title,
        ),
      ),
    );
  }
}
