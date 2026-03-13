import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFilde extends StatefulWidget {
  const CustomTextFilde({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    required this.isemail,
    this.label, // أضفنا هذا المتغير اختياريًا
  });

  final String hint;
  final String? label; // العنوان الذي سيظهر على الإطار
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
      style: const TextStyle(color: Color.fromARGB(219, 0, 0, 0)),
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
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        // التعديل الأساسي هنا
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black54), // لون الـ Label

        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(
                  _obscureText
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }
}
