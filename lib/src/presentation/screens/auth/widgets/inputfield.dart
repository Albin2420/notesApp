import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final bool obscure;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.obscure = false,
    this.suffix,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      maxLines: obscure ? 1 : maxLines,
      validator: validator,
      onChanged: onChanged,
      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey.shade100,

        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black, width: 1.3),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
