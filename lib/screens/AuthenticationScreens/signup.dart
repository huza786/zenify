import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/AuthenticationScreens/components/email_text_field.dart';
import 'package:zenify/screens/AuthenticationScreens/components/head_text_widget.dart';
import 'package:zenify/screens/AuthenticationScreens/components/helper_link.dart';
import 'package:zenify/screens/AuthenticationScreens/components/icon_button_login_signup.dart';
import 'package:zenify/screens/AuthenticationScreens/components/input_text_field.dart';
import 'package:zenify/screens/AuthenticationScreens/components/login_signup_button.dart';
import 'package:zenify/utils/globalvariable.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadText(headText: "SignUp"),
                SizedBox(
                  height: 150.h,
                ),
                //name textfield
                EmailTextField(
                    hintText: 'Name',
                    labelText: 'Name',
                    controller: nameController),
                //Email textfield
                InputTextField(
                    hintText: 'Email',
                    labelText: 'Email',
                    textEditingController: emailController),

                //Password TextField
                InputTextField(
                    hintText: 'Password',
                    labelText: 'Password',
                    textEditingController: passwordController),
                //Already have an account?
                HelperLinkWidget(
                  helperText: 'Already have an account?',
                  navigationfunction: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  icon: arrowIcon,
                  leftPadding: 155,
                ),
                //Login Button
                const LoginSignUpButton(title: 'SignUp'),
                //Or login with
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: const Center(
                    child: Text('or SignUp with'),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
