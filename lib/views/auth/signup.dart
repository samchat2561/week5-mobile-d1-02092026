
import 'package:flutter/material.dart';
import 'package:flutter_week15/views/auth/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPass = false;
  bool showPass2 = false;

  final formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ===== Validate Email =====
  bool isEmailValid(String email) {
    RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return regex.hasMatch(email);
  }

  void signUp(){
    if(formState.currentState!.validate()){
      debugPrint(nameController.text);
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
      debugPrint(confirmPasswordController.text);
    }
  }

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
                  'assets/images/register.png',
                  width: size.width * 0.65,
                ),
                // =====Text Login =====
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Register",
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
                  key: formState,
                  child: Column(
                    children: [
                      // ===== Enter Full name =====
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint("Name is empty");
                            return "Name is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your full name ",
                          label: Text("Full name"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                          ),
                          prefixIcon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // =====Enter Field Email =====
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint("Email is empty");
                            return "Email is empty";
                          } else if(!isEmailValid(value)){
                            debugPrint("Error is email");
                            return "Error is email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email ",
                          label: Text("Email"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                          ),
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // =====Enter Field Password =====
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint("Password is empty");
                            return "Password is empty";
                          } else if(value.length < 6){
                            debugPrint("Password too short");
                            return "Password too short";
                          }
                          return null;
                        },
                        obscureText: !showPass,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          label: Text("password"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                          ),
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(
                              showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // =====Enter Field confirm Password =====
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: !showPass2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            debugPrint("Confirm password is empty");
                            return "Confirm password is empty";
                          } else if(passwordController.text != confirmPasswordController.text){
                            debugPrint("ERROR: password do not match");
                            return "ERROR: password do not match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your confirm password",
                          label: Text("Confirm password"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                          ),
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPass2 = !showPass2;
                              });
                            },
                            icon: Icon(
                              showPass2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // =====Button Submit Login =====
                      InkWell(
                        onTap: () {
                          setState(() {
                            signUp();
                          });
                        },
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
                                "Sign Up",
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
                      "Already have an account?",
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        });
                      },
                      child: Text(
                        " Sign In",
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
