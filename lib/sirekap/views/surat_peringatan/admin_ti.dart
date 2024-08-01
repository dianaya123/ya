import 'package:flutter/material.dart';

class AdminTI extends StatefulWidget {
  const AdminTI({super.key});

  @override
  State<AdminTI> createState() => _AdminTIState();
}

class _AdminTIState extends State<AdminTI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Header Container
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff158AD4),
                  Color(0xFF39EADD),
                ],
              )),
            ),

            // Main Container
            Expanded(
              child: Row(
                children: [
                  // First Column
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Column 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Second Column
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Column 2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}