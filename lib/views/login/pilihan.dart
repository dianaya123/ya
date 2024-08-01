import 'package:academix_polnep/views/sihadir/navigation.dart';
import 'package:flutter/material.dart';
import 'package:academix_polnep/views/helper/styleHelper.dart';
import 'package:google_fonts/google_fonts.dart';

class Pilihan extends StatefulWidget {
  const Pilihan({super.key});

  @override
  State<Pilihan> createState() => _PilihanState();
}

class _PilihanState extends State<Pilihan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGradient),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0)),
                RichText(
                    text: TextSpan(
                  text: "MENUJU KE",
                  style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                )),
                const Padding(padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0)),
                Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
                      boxShadow
                    ]),
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0)),
                        RichText(
                            text: TextSpan(
                          text: "SIHADIR",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                        )),
                        const Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 15,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return const Navbar();
                            }));
                          },
                        ),
                      ],
                    )),
                const Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
                Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
                      boxShadow
                    ]),
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0)),
                        RichText(
                            text: TextSpan(
                          text: "SIREKAP",
                          style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                        )),
                        const Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 15,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return const Navbar();
                            }));
                          },
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
