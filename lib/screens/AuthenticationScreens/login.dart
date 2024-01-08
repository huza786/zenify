import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/Components/email_text_field.dart';
import 'package:zenify/screens/Components/head_text_widget.dart';
import 'package:zenify/screens/Components/helper_link.dart';
import 'package:zenify/screens/Components/icon_button_login_signup.dart';
import 'package:zenify/screens/Components/input_text_field.dart';
import 'package:zenify/screens/Components/login_signup_button.dart';
import 'package:zenify/utils/globalvariable.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailContoller = TextEditingController();
    TextEditingController passwordContoller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadText(headText: "LOGIN"),
                SizedBox(
                  height: 200.h,
                ),
                //Email textfield
                EmailTextField(
                    hintText: 'Email',
                    labelText: 'Email',
                    controller: emailContoller),

                //Password TextField
                InputTextField(
                    hintText: 'Password',
                    labelText: 'Password',
                    textEditingController: passwordContoller),
                //Forgot Password
                HelperLinkWidget(
                  helperText: 'Forgot Password',
                  icon: arrowIcon,
                  leftPadding: 196,
                  navigationfunction: () {
                    Navigator.pushNamed(context, '/forgotpassword');
                  },
                ),
                //Login Button
                const LoginSignUpButton(title: 'LOGIN'),
                //Or login with
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: const Center(
                    child: Text('or LOGIN with'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtonLogSign(
                        iconSymbol: googleIcon,
                        impementFunction: () {},
                      ),
                      IconButtonLogSign(
                        iconSymbol: phoneIcon,
                        impementFunction: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Column(
                          children: [
                            Text(
                              """Do not have an account?""",
                              style: headerStyle.copyWith(color: primaryRed),
                            ),
                            Text(
                              'Sign up',
                              style: headerStyle.copyWith(color: primaryRed),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
