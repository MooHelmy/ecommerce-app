import 'package:flutter/material.dart';

import '../../const/constants.dart';

class custm_text extends StatelessWidget {
  const custm_text({
    super.key,
    required this.hinttext,
    this.onSaved,
    this.icon,
  });
  final String hinttext;

  final Function(String?)? onSaved;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter the filed';
          }
        },
        onSaved: onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: KmainScreencolor,
          hintText: hinttext,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.pinkAccent)),
        ),
      ),
    );
  }
}
