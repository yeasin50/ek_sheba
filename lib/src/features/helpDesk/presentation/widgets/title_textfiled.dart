import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.textFiledHeight = 42,
  });

  final String title;
  final TextEditingController controller;
  final double textFiledHeight;

  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppStyle.textBlack,
    );

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppStyle.outlineColor,
        width: 1,
      ),
    );

    final errorBorder = border.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: textFiledHeight,
          child: TextFormField(
            validator: validator,
            controller: controller,
            textAlignVertical: TextAlignVertical.top,
            expands: textFiledHeight == 42 ? false : true,
            maxLines: textFiledHeight == 42 ? 1 : null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              disabledBorder: border,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
          ),
        ),
      ],
    );
  }
}
