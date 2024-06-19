import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTextWidget extends StatelessWidget {
  const DetailTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'details'.i18n,
        style: TextStyle(
          fontFamily: GoogleFonts.lexend().fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: const Color.fromRGBO(144, 149, 161, 1),
        ),
      ),
    );
  }
}


@override
Widget build(BuildContext context) {
  return Text.rich(
    style: TextStyle(
      fontFamily: GoogleFonts.manrope().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(144, 149, 161, 1),
    ),
    TextSpan(
      text: 'by_joining'.i18n,
      children: [
        TextSpan(
          text: 'privacy_policy'.i18n,
          style: const TextStyle(color: Color.fromRGBO(109, 49, 237, 1)),
        ),
        TextSpan(
          text: 'and'.i18n,
        ),
        TextSpan(
          text: 'term_of_service'.i18n,
          style: const TextStyle(color: Color.fromRGBO(109, 49, 237, 1)),
        ),
      ],
    ),
  );
}

class PrivacyPolicyTextWidget extends StatelessWidget {
  const PrivacyPolicyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15 , right: 15),
      child: Text.rich(
        style: TextStyle(
          fontFamily: GoogleFonts.manrope().fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(144, 149, 161, 1),
        ),
        TextSpan(
          text: 'by_joining'.i18n,
          children: [
            TextSpan(
              text: 'privacy_policy'.i18n,
              style: const TextStyle(color: Color.fromRGBO(109, 49, 237, 1)),
            ),
            TextSpan(
              text: 'and'.i18n,
            ),
            TextSpan(
              text: 'term_of_service'.i18n,
              style: const TextStyle(color: Color.fromRGBO(109, 49, 237, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
