import 'package:flutter/material.dart'; //to use the prepered widgets
import '../colors/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSCreen extends StatefulWidget {
  const AboutSCreen({Key? key}) : super(key: key);

  @override
  State<AboutSCreen> createState() => _AboutSCreenState();
}

class _AboutSCreenState extends State<AboutSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
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
            Spacer(),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "About",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Innovative and detail-oriented Full-Stack Web Developer with strong experience in front-end and back-end development.",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Who I Am Section
              _buildAboutSection(
                title: "Who I Am",
                content:
                    "A certified Full-Stack Web Developer from NTI with a passion for creating efficient, user-friendly applications. I hold a Bachelor's degree in Pharmacy and have transitioned my analytical skills to software development.",
                iconData: Icons.person,
              ),

              SizedBox(height: 30),

              // What I Do Section
              _buildAboutSection(
                title: "What I Do",
                content:
                    "I specialize in building full-stack web applications with a keen focus on performance, real-time communication, and seamless UI/UX. I apply best security practices and automation techniques in all my work.",
                iconData: Icons.code,
              ),

              SizedBox(height: 30),

              // My Approach Section
              _buildAboutSection(
                title: "My Approach",
                content:
                    "I believe in problem-solving, team collaboration, and adaptability. My multilingual background (Arabic, English, German) enhances my ability to work in diverse teams and communicate effectively.",
                iconData: Icons.lightbulb,
              ),

              SizedBox(height: 40),

              // Skills Preview
              Text(
                "Core Skills",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 20),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildSkillChip("Angular"),
                  _buildSkillChip("React.js"),
                  _buildSkillChip("Node.js"),
                  _buildSkillChip("Express.js"),
                  _buildSkillChip("MongoDB"),
                  _buildSkillChip("TypeScript"),
                  _buildSkillChip("Python"),
                  _buildSkillChip("RESTful APIs"),
                  _buildSkillChip("WebSockets"),
                ],
              ),

              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/skills');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text("View All Skills"),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection({
    required String title,
    required String content,
    required IconData iconData,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconData, color: secondaryColor, size: 30),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: textColor.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: cardColor,
      labelStyle: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      side: BorderSide(color: borderColor),
    );
  }
}
