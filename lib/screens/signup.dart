import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
          const SizedBox(height: 64),
          //A circular widget to accept and show file/picture
          Stack(
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1499209974431-9dddcece7f88?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_a_photo)))
            ],
          ),
          const SizedBox(height: 24),
          //text field input for username
          TextFieldInput(
              textEditingController: _usernameController,
              hintText: 'Enter your name...',
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          //Text field for email
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email...',
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 24,
          ),
          //Text field password
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: 'Enter your password...',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(height: 24),
          //text field for bio
          TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter your bio...',
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          // Login Button
          InkWell(
            onTap: () async {
              String res = await AuthMethod().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text);
                  print(res);
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
              child: const Text('Signup'),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          // Transioning for login page to next screen
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text("Don't have an account?"),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
