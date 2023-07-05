import 'package:ek_sheba/src/common/widgets/app_dialog.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/validators.dart';
import '../../../../common/widgets/app_button.dart';
import '../../data/repositories/helpline_repo_impl.dart';
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

  void _clearAllFiled() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _messageController.clear();
    _additionalInfoController.clear();
  }

  void _onFormSubmit() async {
    if (_firstNameController.text.isEmpty) {
      showSampleDialog(context: context, message: 'First Name is required');
    } else if (_lastNameController.text.isEmpty) {
      showSampleDialog(context: context, message: 'Last Name is required');
    } else if (_emailController.text.isEmpty) {
      showSampleDialog(context: context, message: 'Email is required');
    } else if (_messageController.text.isEmpty) {
      showSampleDialog(context: context, message: 'Message is required');
    } else {
      showSampleDialog(context: context, message: 'Sending Message', hasLoading: true);
      final result = await locator.get<HelplineRepositoryImpl>().sendMessage({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'message': _messageController.text,
        'additional_info': _additionalInfoController.text.isEmpty,
      });
      if (context.mounted) Navigator.pop(context);
      result.fold(
        (l) => showSampleDialog(context: context, message: 'Failed to send message'),
        (r) {
          showSampleDialog(context: context, message: 'Message sent successfully').then(
            (value) => _clearAllFiled(),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TitleTextField(
                  title: 'First Name',
                  controller: _firstNameController,
                  // validator: TextFiledValidator.emptyValidator,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TitleTextField(
                  title: 'Last Name',
                  controller: _lastNameController,
                  // validator: TextFiledValidator.emptyValidator,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TitleTextField(
            title: 'Email',
            controller: _emailController,
            // validator: TextFiledValidator.emptyValidator,
          ),
          const SizedBox(height: 16),
          TitleTextField(
            title: 'Message',
            controller: _messageController,
            // validator: TextFiledValidator.emptyValidator,
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
      ),
    );
  }
}
