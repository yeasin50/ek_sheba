import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';
import 'title_textfiled.dart';

class HealLineFormWidget extends StatefulWidget {
  const HealLineFormWidget({super.key});

  @override
  State<HealLineFormWidget> createState() => _HealLineFormWidgetState();
}

class _HealLineFormWidgetState extends State<HealLineFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _additionalInfoController = TextEditingController();
  

  void _onFormSubmit()async{

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TitleTextField(
                title: 'First Name',
                controller: _firstNameController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TitleTextField(
                title: 'Last Name',
                controller: _lastNameController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TitleTextField(
          title: 'Email',
          controller: _emailController,
        ),
        const SizedBox(height: 16),
        TitleTextField(
          title: 'Message',
          controller: _messageController,
          textFiledHeight: 100,
        ),
        const SizedBox(height: 16),
        TitleTextField(
          title: 'Additional Details',
          controller: _additionalInfoController,
          textFiledHeight: 100,
        ),
        const SizedBox(height: 42),
        AppButton(
          isFilled: true,
          text: 'Send',
          largeButton: true,
          onPressed: _onFormSubmit,
        ),
      ],
    );
  }
}
