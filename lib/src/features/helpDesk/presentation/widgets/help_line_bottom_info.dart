import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/app_style.dart';
import '../../../../common/utils/logger.dart';

class HelpLineBottomInfo extends StatelessWidget {
  const HelpLineBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppStyle.textBlack,
    );

    final bodyTextStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppStyle.textBlack,
    );
    const smallGap = SizedBox(height: 8);
    const itemGap = SizedBox(height: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How Can We Help?',
          style: titleTextStyle,
        ),
        smallGap,
        Text(
          'Our team is happy to answer your questions and help you to get involved with our system.',
          style: bodyTextStyle,
        ),
        smallGap,
        Text(
          ' Please do not hesitate to raise your hand for help.',
          style: bodyTextStyle,
        ),
        itemGap,
        Text(
          'Address:',
          style: titleTextStyle,
        ),
        smallGap,
        Text(
          'Senior System Analyst Planning Division \nMinistry of Planning\nBlock:13, Room No:12 \nPhone: 9180789, Fax: 9185868 \nAgargoan,Sher-E-Bangla Nagar, \nDhaka-1207,Bangladesh',
          style: bodyTextStyle,
        ),
        itemGap,
        Text(
          'Mail:',
          style: titleTextStyle,
        ),
        smallGap,
        Text.rich(
          TextSpan(
            text: 'sdpp.plandiv@mail.gov.bd',
            style: bodyTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _onEmail(
                    'sdpp.plandiv@mail.gov.bd',
                  ),
          ),
        ),
        itemGap,
        Text(
          'Cell:',
          style: titleTextStyle,
        ),
        smallGap,
        Text.rich(
          TextSpan(
            style: bodyTextStyle,
            children: [
              TextSpan(
                text: '+880 1911 054321',
                recognizer: TapGestureRecognizer()..onTap = () => _onCall('+880 1911 054321'),
              ),
              const TextSpan(text: '\n'),
              TextSpan(
                text: '+880 1711 054321',
                style: bodyTextStyle,
                recognizer: TapGestureRecognizer()..onTap = () => _onCall('+880 1711 054321'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onCall(String number) async {
    try {
      final uri = Uri(scheme: 'tel', path: number);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        logger.e('can not launch url');
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void _onEmail(String email) async {
    try {
      final uri = Uri(scheme: 'mailto', path: email);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        logger.e('can not launch url');
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
