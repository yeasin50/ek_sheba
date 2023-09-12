import 'package:ek_sheba/src/features/html_pdf_dashboard/domain/entities/session_param.dart';
import 'package:flutter/material.dart';

import '../features/html_pdf_dashboard/auth/auth_hanlder.dart';

class CreateSessionTest extends StatefulWidget {
  const CreateSessionTest({super.key});

  static const routeName = '/create-session-test';

  @override
  State<CreateSessionTest> createState() => _CreateSessionTestState();
}

class _CreateSessionTestState extends State<CreateSessionTest> {
  String? _sessionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _createSeasson),
      body: SafeArea(
        child: Column(
          children: [
            Text(_sessionId ?? 'No Session'),
          ],
        ),
      ),
    );
  }

  void _createSeasson() async {
    final PDfHandler pDfHandler = PDfHandler();
    final params = SeasonParams(
      sessionId: '90d51297-f153-49b9-861a-b9ccf58cf48e',
      accessToken:
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkdXR5VHlwZSI6IkRlc2tfT2ZmaWNlciIsInVzZXJfbmFtZSI6Im5pbGdfZGVza0BtYWlsLmNvbSIsInVzZXJOYW1lIjoibmlsZ19kZXNrQG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9HRVRfQUxMX0FQUFJPVkVEX0RQUC9UQVBQIiwiUk9MRV9HRVRfUFJPSkVDVF9DT05DRVBUX0xJU1RfRk9SX0ZTIiwiUk9MRV9DUkVBVEVfRlNfUFJPUE9TQUwiLCJST0xFX1ZJRVdfUFJPSkVDVF9DT05DRVBUX0RBU0hCT0FSRCIsIlJPTEVfVklFV19EUFAvVEFQUF9EQVNIQk9BUkQiLCJST0xFX0dFVF9SRFBQX1RBUFBfTElTVCIsIlJPTEVfUVVFU1RJT05fQU5TV0VSX0xJU1QiLCJST0xFX0NSRUFURV9QUk9KRUNUX0NPTkNFUFQiLCJST0xFX0VESVRfRFBQL1RBUFBfREFTSEJPQVJEIiwiUk9MRV9DUkVBVEVfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVF9GT1JfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVCIsIlJPTEVfQ1JFQVRFX0ZTX1JFUE9SVCIsIlJPTEVfRURJVF9QUk9KRUNUX0NPTkNFUFRfREFTSEJPQVJEIiwiUk9MRV9WSUVXX0ZTX0RBU0hCT0FSRCJdLCJjbGllbnRfaWQiOiJpYmNzcGxhbm5pbmdpZHNkcCIsImlzSW5zdGl0dXRpb25hbCI6bnVsbCwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sIm9yZ2FuaWdhdGlvbk5hbWUiOm51bGwsIm5hbWUiOiJOSUxHIERlc2sgT2ZmaWNlciIsImlkIjoiODciLCJ1c2VyVHlwZSI6bnVsbCwiZXhwIjoxNjk4MDYxMTQyLCJhcHBBY2Nlc3MiOlsiUFBTIl0sImp0aSI6ImVkNzAxZWE4LTg5YWUtNGU4ZC1iMDA3LTE5ZTA5MGUwODMwZSJ9.AuSEOZ1k6oz036vaWFC__KSVvpyyEVv06ouxTbtemKsBTyzVwiZAtziomDDVbR9uqpVzcTiJFP4Ja1eoI2i-ECBaxwZnjSjEI_8yrzkRXTOdmZ9yDBIFRT6t9x6N7pBcT0auANesxqLUZ2SLxXML4uu3qCyspNBdkRQCXIJ9ze4jCCxNBUCwlxzPngkBLFhY5MgfB3iovfx6XUT7VkGi0EQoD6-iuj7XRG7S8HVLZzB9fWqRnC_fsfQSbUUoMggWkn8uI7Pko7kShbm68A8wUe90fdD5uXRreUouzdSAQrccMSMG07aUhWE6hzxvef2NwHg3BHF7Fi7e5JO7HB6uwg',
      doptorToken: '',
    );
    final reuslt = await pDfHandler.createSession(params);
    print(reuslt);
    setState(() {
      _sessionId = reuslt?.sessionId;
    });
  }
}
