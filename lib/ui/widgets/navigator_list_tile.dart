import 'package:flutter/material.dart';

class NavigatorListTile extends StatelessWidget {
  const NavigatorListTile({
    required this.icon,
    required this.page,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final Icon icon;
  final Widget page;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (_) => page,
          ),
        );
      },
    );
  }
}
