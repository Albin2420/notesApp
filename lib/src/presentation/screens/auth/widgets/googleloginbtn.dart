import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleLoginBtn extends StatelessWidget {
  const GoogleLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        icon: Image.asset("assets/icons/google.png", height: 22),
        label: Text(
          "Continue with Google",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
