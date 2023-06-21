import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectLocationMapCard extends StatelessWidget {
  const ProjectLocationMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Department of Agricultural Extension Ministry of Agriculture',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF282020),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        const SizedBox(width: 10),
        AppButton(
          text: 'PROJECT LOCATION MAP',
          onPressed: () {},
          isFilled: true,
          textPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          textStyle: GoogleFonts.lexend(
            color: AppStyle.textWhite,
            fontSize: 9,
          ),
        )
      ],
    );
  }
}
