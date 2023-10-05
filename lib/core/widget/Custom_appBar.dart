import 'package:e_commapp/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class custom_appBar extends StatelessWidget {
  const custom_appBar({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: SizeConfig.defaultSize! * 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
                height: SizeConfig.defaultSize! * 3,
                width: SizeConfig.defaultSize! * 3,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon))
          ],
        ),
      ),
    );
  }
}
