import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFilde extends StatefulWidget {
  const CustomTextFilde({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller, required this.isemail,
  });
  final String hint;
  final bool isPassword;
  final bool isemail;
  final TextEditingController controller;

  @override
  State<CustomTextFilde> createState() => _CustomTextFildeState();
}

class _CustomTextFildeState extends State<CustomTextFilde> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: const Color.fromARGB(219, 255, 255, 255)),
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
      canRequestFocus: true,
      cursorHeight: 20,
      cursorColor: const Color.fromARGB(255, 255, 255, 255),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  _togglePassword();
                },
                child: Icon(
                  CupertinoIcons.eye_solid,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),

          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: const Color.fromARGB(101, 255, 255, 255)),
        fillColor: const Color.fromARGB(0, 255, 255, 255),
        filled: true,
      ),
    );
  }
}
