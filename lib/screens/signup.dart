import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/dimensions.dart';
import 'package:instagram_clone/utils/utils.dart';
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
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
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
          verticalSpacing(12),
          //A circular widget to accept and show file/picture
          SingleChildScrollView(
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
                      ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo)))
              ],
            ),
          ),

          verticalSpacing(12),
          //text field input for username
          TextFieldInput(
              textEditingController: _usernameController,
              hintText: 'Enter your name...',
              textInputType: TextInputType.text),
          verticalSpacing(12),
          //Text field for email
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email...',
              textInputType: TextInputType.emailAddress),
          verticalSpacing(12),
          //Text field password
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: 'Enter your password...',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          verticalSpacing(12), //text field for bio
          TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter your bio...',
              textInputType: TextInputType.text),
          verticalSpacing(12),
          // Login Button
          InkWell(
            onTap: () async {
              String res = await AuthMethod().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                  file : _image!,);
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
          verticalSpacing(12),
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
