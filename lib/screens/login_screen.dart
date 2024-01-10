import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/dimensions.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          //svg image
          SvgPicture.asset('assets/ic_instagram.svg',
              color: primaryColor, height: 64),
          verticalSpacing(18),
          //Text field for email
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email...',
              textInputType: TextInputType.emailAddress),
          verticalSpacing(15),
          //Text field password
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: 'Enter your password...',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          verticalSpacing(18),
          // Login Button
          InkWell(
            onTap: () {
              
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                color: blueColor,
              ),
              child: const Text('Login'),
            ),
          ),
          verticalSpacing(18),
          Flexible(flex: 2, child: Container(), ),
          // Transioning for login page to next screen
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child:const Text("Don't have an account?"),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child:const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
