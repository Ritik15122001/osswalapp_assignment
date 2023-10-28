import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool passToggle =true;
  final _formfield = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: _formfield,
        child: Column(
          children: [
            TextFormField(
              controller: widget.controller,
              obscureText: passToggle,
              decoration: InputDecoration(
                  border:InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon:IconButton(onPressed: () {}, icon: Icon(Icons.password_outlined)),
                  suffixIcon: InkWell(
                  onTap: (){
                    setState((){
                      passToggle=!passToggle;
                    });
                  },child:Icon(passToggle? Icons.visibility:Icons.visibility_off) ,
                )
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Enter Password";
                }else if(widget.controller.toString().length<6){
                   return "than 6 Character";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}