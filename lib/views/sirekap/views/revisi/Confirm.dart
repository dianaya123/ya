import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagesUpdated extends StatefulWidget {
  const PagesUpdated({super.key});

  @override
  State<PagesUpdated> createState() => _PagesUpdatedState();
}

class _PagesUpdatedState extends State<PagesUpdated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
          0xFF00A8E8), // Set background color to match the gradient blue
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20), // Rounded corners for card
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: const Color(
                          0xFF00C853), // Green color to match the check mark
                      size: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Pembaruan Berhasil",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    detailPembaruan(),
                    const SizedBox(height: 20),
                    Text(
                      "Mohon menunggu konfirmasi dari dosen yang bersangkutan",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: const Color(0xFF00A8E8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Kembali",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailPembaruan() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00A8E8), width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: const Color(0xFF00A8E8)),
              const SizedBox(width: 10),
              Text(
                "Kamis, 18 Juli 2024",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, color: const Color(0xFF00A8E8)),
              const SizedBox(width: 10),
              Text(
                "09.45 WIB",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Pembaruan Presensi",
        style: GoogleFonts.poppins(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
