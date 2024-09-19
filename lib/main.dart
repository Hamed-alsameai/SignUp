import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height:25),
                  Text('Sign Up', style: TextStyle(color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height:35),
                  CustomTextField(
                    labelText: "Name",
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'Wrong name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:15),
                  CustomTextField(
                    labelText: "Number",
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^\d{9}$').hasMatch(value)) {
                        return 'Wrong name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:15),
                  CustomTextField(
                    labelText: "Password",
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^(?=.*\d).{9,}$').hasMatch(value)) {
                        return 'Wrong name';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height:25),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green.shade300),
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Submit'),
                                content: Text('Your submission was successful!'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Submit',
                        style: TextStyle(
                          fontSize: 15,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey.shade700),
      ),
      validator: validator,
    );
  }
}

