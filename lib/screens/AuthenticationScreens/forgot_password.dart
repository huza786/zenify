import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/AuthenticationScreens/components/email_text_field.dart';
import 'package:zenify/screens/AuthenticationScreens/components/head_text_widget.dart';
import 'package:zenify/screens/AuthenticationScreens/components/login_signup_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailContoller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadText(headText: "Forgot Password"),
                SizedBox(
                  height: 200.h,
                ),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: const Center(
                    child: Text(
                        'Please, enter your email address. You will receive a link to create a new password via email.'),
                  ),
                ),
                //Email textfield
                EmailTextField(
                    hintText: 'Email',
                    labelText: 'Email',
                    controller: emailContoller),

                //send link Button
                const LoginSignUpButton(title: 'SEND LINK'),
                //Or login with
              ],
            ),
          ),
        ),
      ),
    );
  }
}
