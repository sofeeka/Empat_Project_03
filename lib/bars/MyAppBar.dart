import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(192, 188, 169, 100),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Material(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Title, author or ISBN',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              enabled: true,
            ),
          ),
        ),
      ),
      actions: const [
        Icon(Icons.notifications_outlined),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
