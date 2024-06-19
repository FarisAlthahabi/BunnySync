import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgreeTermsTextWidget extends StatelessWidget {
  const AgreeTermsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By joining, you agree to our privacy policy and',
        style: TextStyle(
          fontFamily: GoogleFonts.manrope().fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(23, 26, 31, 1),
        ),
        children: const [
          TextSpan(
            text: 'term of service',
            style: TextStyle(color: Color.fromRGBO(55, 154, 230, 1)),
          ),
        ],
      ),
    );
  }
}
