// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onChanged, this.inputType});
  String? hintText;
  String? labelText;
  Function(String)? onChanged;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
          
        ),
        hintText: hintText,
        hintStyle:const TextStyle(color: Colors.black),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}

class CustomTextFieldPassword extends StatefulWidget {
  CustomTextFieldPassword({
    this.hintText,
    this.onChanged,
    this.isObscure = true,
    this.labelText,
  });

  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final bool? isObscure;

  @override
  State<CustomTextFieldPassword> createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = widget.isObscure ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordHidden,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordHidden = !isPasswordHidden;
            });
          },
          icon: Icon(
            isPasswordHidden ? Icons.visibility_off : Icons.remove_red_eye,
            color: Colors.white,
          ),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}