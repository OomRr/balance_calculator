import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.valid,
    this.controller,
    this.suffixIconPressed,
    this.onChange,
  });
  String? Function(String?)? valid;
  void Function(String)? onChange;
  TextEditingController? controller;
  String? prefixIcon;
  Icon? suffixIcon;
  final VoidCallback? suffixIconPressed;
  final String hintText;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF5F5F5),
      ),
    //  height: 50,
      width: double.infinity,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: onChange,
        style: const TextStyle(color: Color(0xFF141D21)),
        obscureText: obscureText,
        validator: valid,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(prefixIcon!),
            ),
          ),
          suffixIcon: (suffixIcon == null)
              ? null
              : Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: TextButton(
              style: ButtonStyle(
                overlayColor:
                MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                suffixIconPressed!();
              },
              child: suffixIcon!,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF5F5F5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF5F5F5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF5F5F5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}