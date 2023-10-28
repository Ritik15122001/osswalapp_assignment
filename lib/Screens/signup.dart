import 'package:firebase_auth/firebase_auth.dart';
import 'package:osswalapp/Screens/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:osswalapp/component/Button.dart';
import 'package:osswalapp/component/TextFiled_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../component/TextField.dart';
import 'package:osswalapp/FirebaseAuthImplementation/firebase_auth_services.dart';
import 'HomeScreen.dart';
class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final FirebaseAuthServices _auth =FirebaseAuthServices();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context, true);
            }
        ),
        title: Row(
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ],
        ),
        backgroundColor: Colors.white, //<-- SEE HERE
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                // welcome back, you've been missed!
                Text(
                  'Your Journey Begins Here - Sign Up Now',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                MyTextField2(
                  controller: _usernameController,
                  hintText: 'Name',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                // username textfield
                MyTextField2(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?


                const SizedBox(height: 25),

                // sign in button
                GestureDetector(
                  onTap: () =>_signUp(),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Text(
                          'Thanks For Your Registration',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password =_passwordController.text;
    User? user =await _auth.signUpWithEmailAndPassword(email, password);
    if(user!=null){
      print('User is Created Successfully Created');
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
        return new login_screen();
      }));
    }
  }
}




