import 'package:flutter/material.dart';
import 'package:movie/CustomWidgets/CustomDivider/custom_divider.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Icon? icon;
  final Color? iconColor;
  final VoidCallback onPress;

  const DrawerItem({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: icon,
          iconColor: iconColor,
          onTap: onPress,
        ),
        const CustomDivider(),
      ],
    );
  }
}
