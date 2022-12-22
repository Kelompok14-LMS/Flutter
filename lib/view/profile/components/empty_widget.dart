import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget showAtEmptyData() {
  return SizedBox(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('https://i.ibb.co/YtwP0Zp/emptycourseongoing.png'),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Fetch Data Failed... Please Try Again!',
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
