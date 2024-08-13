import 'package:academix_polnep/backend/providers/userProvider.dart';
import 'package:academix_polnep/views/helper/sessionManager.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';
import 'package:academix_polnep/views/login/forgetPassword.dart';
import 'package:academix_polnep/views/login/pilihan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool? checkValue = false;
  TextEditingController nomorIndukController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String result = '';

  @override
  void dispose() {
    nomorIndukController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<UserProvider>(
          builder: (context, provider, child) {
            return Form(
              key: _formkey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Align(
                      child: Image.asset(
                        "assets/images/logo.png",
                        scale: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Text(
                      "Welcome!",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(
                      "Login To Your Account",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(30)),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: nomorIndukController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "NIM/NIP",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.contains(RegExp(r'([a-zA-Z])'))) {
                            return "NIM should not contain letters";
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "PASSWORD",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Forgot your Password?",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgetPassword();
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: btnGradient,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          boxShadow
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            String nomorInduk = nomorIndukController.text.trim();
                            String password = passwordController.text.trim();

                            try {
                              var user = await provider.loginUser(nomorInduk, password);
                              if (user?.status == 200) {
                                writeSession(user?.token);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const Pilihan();
                                  }),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Login failed')),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
