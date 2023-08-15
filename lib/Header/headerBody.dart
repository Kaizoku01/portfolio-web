import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/utils/hover_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderBody extends StatelessWidget {
  HeaderBody({super.key, this.isMobile});
  bool? isMobile;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        AutoSizeText(
          'Namaste 🙏',
          style: GoogleFonts.montserrat(fontSize: 60 ),
          maxLines: 1,
        ),
        AutoSizeText(
          'Mein Sarvagya',
          style: GoogleFonts.montserrat(fontSize: 60 ),
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 37),
        AutoSizeText(
          'Student at Jaypee Institute of Information Technology, Noida.I am Hyperactive, always ready to tackle any challenges. I love Mobile development, and working on real-life problems.',
          style: TextStyle(fontSize: 24),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
          onPressed: () => launchUrl(Uri.parse('mailto:saxenasarvagya11@gmail.com?subject=News&body=New%20plugin')),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 17,
              horizontal: isMobile ?? false ? 8 : 15,
            ),
            child: Text(
              'Contact Me',
              style: TextStyle(
                  fontSize: isMobile ?? false ? 20 : 24, color: Colors.white),
            ),
          ),
        ).moveUpOnHover,
      ],
    );
  }
}
