import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/agency_and_ministry__name/agency_and_ministry_name_bloc.dart';
import 'label_decorator.dart';

class ProjectLocationMapCard extends StatelessWidget {
  const ProjectLocationMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.poppins(
      color: const Color(0xFF282020),
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
    return BlocBuilder<AgencyAndMinistryNameBloc, AgencyAndMinistryNameState>(
      builder: (context, state) {
        String title = state is AgencyAndMinistryNameLoaded
            ? state.agencyAndMinistryInfo.agency.nameEn
            : "No Title Found";
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  string2Raw(title) ?? "No Title Found",
                  style: textStyle,
                ),
              ),
            ),
            const SizedBox(width: 10),
            LabelDecoratorWidget(
              text: 'PROJECT LOCATION MAP',
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              textStyle: GoogleFonts.lexend(
                color: AppStyle.textWhite,
                fontSize: 10,
              ),
            )
          ],
        );
      },
    );
  }
}
