import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:potholedetect/custom_widgets/textfield.dart';
import 'package:potholedetect/utils/api/forgotpasswordApi.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, this.email});
  final email;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otp = '';
  TextEditingController _newpassController = TextEditingController();
  bool isOtpFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                // Handle OTP changes if needed
              },
              onSubmit: (String code) {
                // This function will be called when all OTP fields are filled
                setState(() {
                  otp = code;
                  isOtpFilled = true;
                });
              },
            ),
            if (isOtpFilled)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: customtextfield(
                  label: 'New Paswsword',
                  controller: _newpassController,
                 
                ),
              ),
            if (isOtpFilled)
              ElevatedButton(
                onPressed: ()async {
             await    sendOtpAndPass(widget.email,_newpassController.text,otp,context);
                },
                child: Text('Submit'),
              ),
          ],
        ),
      ),
    );
  }
}
