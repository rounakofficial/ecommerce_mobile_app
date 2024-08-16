import 'package:ecommerce_mobile_app/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      print("Email and password cannot be empty");
      return;
    }

    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print("Account created successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomNavBar();
        }));
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the keyboard height
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Image.asset("assets/online.png"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 43,
              ),
              GestureDetector(
                onTap: () {
                  login(emailController.text, passwordController.text);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("____________ or sign up with ____________"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/google logo.png"),
                  Image.asset("assets/Group.png"),
                  Image.asset("assets/vector.png"),
                ],
              ),
              // Adjust the bottom padding to accommodate the keyboard
              SizedBox(height: keyboardHeight),
            ],
          ),
        ),
      ),
    );
  }
}
