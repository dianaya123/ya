import 'package:academix_polnep/backend/providers/userProvider.dart';
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
  final TextEditingController nomor_induk_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  String result = '';

  @override
  void dispose() {
    nomor_induk_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
            key: _formkey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Align(
                      child: Image.asset(
                    "assets/images/logo.png",
                    scale: 15,
                  )),
                  const Padding(padding: EdgeInsets.all(20)),
                  Text(
                    "Welcome !",
                    style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "Login To Your Account",
                    style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const Padding(padding: EdgeInsets.all(30)),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: nomor_induk_controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "NIM/NIP",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value!.contains(RegExp(r'([a-zA-Z])'))) {
                          return "Nim tidak boleh ada huruf";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: password_controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "PASSWORD",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^(?=.*[A-Z]).+$').hasMatch(value!)) {
                            return "password harus ada huruf kapital";
                          }
                          return null;
                        },
                      )),
                  const Padding(padding: EdgeInsets.all(10)),
                  Align(
                    alignment: const Alignment(0, 0),
                    child: RichText(
                        text: TextSpan(
                            text: "Forgot your Password?",
                            style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 15)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ForgetPassword();
                                }));
                              })),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(gradient: btnGradient, borderRadius: BorderRadius.circular(20), boxShadow: [
                      boxShadow
                    ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            bool success = await Provider.of<UserProvider>(context, listen: false).loginUser(nomor_induk_controller.text, password_controller.text);
                            if (success) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return const Pilihan();
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login failed')),
                              );
                            }
                          }
                        }
                        // () {
                        //   Provider.of<UserProvider>(context, listen: false).loginUser(nomor_induk_controller.text, password_controller.text);
                        //   if (_formkey.currentState!.validate() && Provider.of<UserProvider>(context, listen: false).loginUser(nomor_induk_controller.text, password_controller.text)) {
                        //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        //       return const Pilihan();
                        //     }));
                        //   }
                        // },
                        ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
