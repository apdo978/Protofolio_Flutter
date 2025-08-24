import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PhoneViewportWrapper extends StatelessWidget {
  final Widget child;

  const PhoneViewportWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only apply phone viewport on web
    if (kIsWeb) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = MediaQuery.of(context).size;
          final isLandscape = screenSize.width > screenSize.height;

          // Calculate dynamic phone dimensions based on screen size
          double phoneWidth, phoneHeight;

          if (isLandscape) {
            // Landscape: smaller phone to fit better
            phoneWidth = (screenSize.width * 0.25).clamp(300.0, 380.0);
            phoneHeight = (screenSize.height * 0.85).clamp(500.0, 800.0);
          } else {
            // Portrait: larger phone
            phoneWidth = (screenSize.width * 0.45).clamp(320.0, 420.0);
            phoneHeight = (screenSize.height * 0.9).clamp(600.0, 900.0);
          }

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1a1a2e),
                    Color(0xFF16213e),
                    Color(0xFF0f3460),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  width: phoneWidth,
                  height: phoneHeight,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            // Dynamic status bar
                            Container(
                              height: (phoneHeight * 0.05).clamp(30.0, 50.0),
                              decoration: BoxDecoration(color: Colors.black),
                              child: Center(
                                child: Container(
                                  width: phoneWidth * 0.4,
                                  height: (phoneHeight * 0.03).clamp(
                                    20.0,
                                    35.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            // App content
                            Expanded(child: child),
                            // Home indicator area
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              },
                              onPanUpdate: (details) {
                                // إذا كان السحب من أسفل لأعلى
                                if (details.delta.dy < -5) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/',
                                    (route) => false,
                                  );
                                }
                              },
                              child: Container(
                                height: (phoneHeight * 0.04).clamp(25.0, 40.0),
                                child: Center(
                                  child: Container(
                                    width: phoneWidth * 0.35,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(2.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Floating Home Button
                        // Positioned(
                        //   bottom: 15,
                        //   right: 15,
                        //   child: FloatingActionButton(
                        //     onPressed: () {
                        //       Navigator.pushNamedAndRemoveUntil(
                        //         context,
                        //         '/',
                        //         (route) => false,
                        //       );
                        //     },
                        //     backgroundColor: Color(0xFF336ecc),
                        //     child: Icon(
                        //       Icons.home,
                        //       color: Colors.white,
                        //       size: 20,
                        //     ),
                        //     elevation: 8,
                        //     mini: true,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    // On mobile, add floating home button
    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        backgroundColor: Color(0xFF336ecc),
        child: Icon(Icons.home, color: Colors.white),
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
