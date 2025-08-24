import 'package:flutter/material.dart'; //to use the prepered widgets
import 'package:provider/provider.dart';
import '../colors/colors.dart'; // to use the colors defined in colors.dart
import '../theme/theme_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.3, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    // Start the animation after a short delay
    Timer(Duration(milliseconds: 200), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarChildren = [
      Text(
        "Abdelrhman",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      Text(
        "-Dev",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
      ),
      Spacer(), // to push the buttons to the right
      IconButton(
        icon: Icon(Icons.language, color: textColor),
        onPressed: () {},
        tooltip: "Language",
      ),
      SizedBox(width: 5),
      Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: themeProvider.isDarkMode ? "Light Mode" : "Dark Mode",
          );
        },
      ),
      SizedBox(width: 5),
      PopupMenuButton<String>(
        icon: Icon(Icons.menu, color: textColor),
        onSelected: (value) {
          print(value);
        },

        itemBuilder: (context) => [
          PopupMenuItem(
            child: Center(child: Text("About")),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/about',
              ); // Navigate to About screen
            },
          ),
          PopupMenuItem(
            child: Center(child: Text("Skills")),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/skills',
              ); // Navigate to About screen
            },
          ),
          PopupMenuItem(
            child: Center(child: Text("Projects")),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Projects',
              ); // Navigate to About screen
            },
          ),
          PopupMenuItem(
            child: Center(child: Text("Experiance")),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/Experiance',
              ); // Navigate to About screen
            },
          ),
          PopupMenuItem(
            child: Center(child: Text("Contact")),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/contact',
              ); // Navigate to About screen
            },
          ),
          PopupMenuItem(
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Center(
                child: Text(
                  "Hire Me",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/hireMe',
              ); // Navigate to About screen
            },
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Row(children: appBarChildren),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
          decoration: BoxDecoration(color: backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            secondaryColor,
                            Color.fromARGB(255, 39, 55, 77),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffcad6e9).withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "AM",
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.4, 0.8, curve: Curves.easeOut),
                        ),
                      ),
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Hello, I am Abdelrhman Muhamed',
                          textStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                            letterSpacing: 1.2,
                          ),
                          speed: Duration(milliseconds: 80),
                        ),
                        TypewriterAnimatedText(
                          'Full Stack Developer',
                          textStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                            letterSpacing: 1.2,
                          ),
                          speed: Duration(milliseconds: 80),
                        ),
                        TypewriterAnimatedText(
                          'MEAN Stack Specialist',
                          textStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                            letterSpacing: 1.2,
                          ),
                          speed: Duration(milliseconds: 80),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Text(
                      "NTI-Certified",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor),
                  ),
                  child: Text(
                    "Innovative and detail-oriented developer with strong experience in front-end and back-end development using Angular, Node.js, React, Python and PHP. Passionate about building scalable and secure web applications.",
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 40),

              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.6, 1.0, curve: Curves.easeOut),
                        ),
                      ),
                  child: Center(
                    child: Column(
                      children: [
                        // First row with Get in Touch and View Projects buttons
                        Row(
                          children: [
                            // Get in Touch button
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: secondaryColor,
                                  foregroundColor: backgroundColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 4,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/contact');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.mail_outline, size: 18),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        "Get in Touch",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 12),

                            // View Projects button
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: textColor,
                                  side: BorderSide(color: secondaryColor),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Projects');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.visibility, size: 18),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        "View Projects",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        // Second row with Download CV button (full width)
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                            icon: Icon(Icons.download, size: 18),
                            label: Text(
                              "Download CV",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: secondaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: secondaryColor.withOpacity(0.3),
                                ),
                              ),
                            ),
                            onPressed: () => _launchUrl(
                              "https://abdelrhman-dev.me/Abdelrhman/assets/cv%20(1)-qWc_HrQv.pdf",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Social links
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Connect with me",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            _buildSocialButton(
                              icon: FontAwesomeIcons.github,
                              color: Colors.black87,
                              url: "https://github.com/apdo978",
                              tooltip: "GitHub Profile",
                            ),
                            _buildSocialButton(
                              icon: FontAwesomeIcons.linkedin,
                              color: Color(0xFF0A66C2),
                              url: "https://www.linkedin.com/in/apdo978/",
                              tooltip: "LinkedIn Profile",
                            ),
                            _buildSocialButton(
                              icon: FontAwesomeIcons.envelope,
                              color: Colors.red.shade700,
                              url: "mailto:talktoboda01@gmail.com",
                              tooltip: "Send Email",
                            ),
                            _buildSocialButton(
                              icon: FontAwesomeIcons.whatsapp,
                              color: Color(0xFF25D366),
                              url:
                                  "https://api.whatsapp.com/send/?phone=0201271175532",
                              tooltip: "WhatsApp Contact",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required String url,
    required String tooltip,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color),
        iconSize: 24,
        onPressed: () => _launchUrl(url),
        tooltip: tooltip,
        constraints: BoxConstraints.tightFor(width: 50, height: 50),
        padding: EdgeInsets.zero,
        splashRadius: 24,
      ),
    );
  }
}
