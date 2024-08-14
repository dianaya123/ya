import 'package:academix_polnep/views/helper/getter.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';
import 'package:academix_polnep/views/login/login.dart';
import 'package:academix_polnep/views/sihadir/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController indukController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  bool? checkValue = false;

  @override
  void initState() {
    super.initState();
    namaController.text = userName();
    indukController.text = nomorInduk();
    // pwdController.text = name;
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
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(
                          text: "<- Kembali",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const Navbar();
                              }));
                            })),
                ),
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
                      boxShadow
                    ]),
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                          onPressed: Placeholder.new,
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 1,
                          ),
                        ),
                      ],
                    )),
                // add image here
                const Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    enabled: false,
                    controller: namaController,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    enabled: false,
                    controller: indukController,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "sandi baru",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "kata sandi tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Row(
                  children: <Widget>[
                    Container(
                      width: 170,
                      decoration: BoxDecoration(gradient: btnGradient, borderRadius: BorderRadius.circular(20), boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 2, offset: const Offset(0, 3))
                      ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                        child: Text(
                          "Keluar",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
                        },
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 170,
                      decoration: BoxDecoration(gradient: btnGradient, borderRadius: BorderRadius.circular(20), boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 2, offset: const Offset(0, 3))
                      ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                        child: Text(
                          "Ganti sandi",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return const Login();
                            }));
                          }
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
