import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // =====Image Login =====
                Image.asset(
                  'assets/images/login.png',
                  width: size.width * 0.65,
                ),
                // =====Text Login =====
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                // =====Form Login =====
                Form(
                  child: Column(
                    children: [
                      // =====Enter Field Email =====
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your email or password",
                          label: Text("Email or password"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular"
                          ),
                          prefixIcon: Icon(Icons.email),

                        ),
                      ),
                      SizedBox(height: 10.0),
                      // =====Enter Field Password =====
                      TextField(),
                      SizedBox(height: 15.0),
                      // =====Button Submit Login =====
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          height: 55.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_open, color: Colors.white),
                              SizedBox(width: 5.0),
                              Text(
                                "Sign In - App Account",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // =====Button Link Register =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Sign Up",
                        style: TextStyle(fontSize: 18.0, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
