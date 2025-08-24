import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

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
                "Technical Skills",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "My technical toolkit spans frontend, backend, databases, and security.",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Frontend
              _buildSkillCategory("Frontend", [
                "Angular",
                "React.js",
                "HTML5",
                "CSS3",
                "Bootstrap",
                "Tailwind CSS",
                "Flutter",
              ]),

              // Backend
              _buildSkillCategory("Backend", [
                "Node.js",
                "Express.js",
                "REST APIs",
                "Python Core",
                "Django",
                "PHP Native",
                "NestJS",
              ]),

              // Databases
              _buildSkillCategory("Databases", ["SQL", "NOSQL"]),

              // DevOps
              _buildSkillCategory("DevOps", [
                "Docker",
                "Kubernetes",
                "CI/CD",
                "GitHub Actions",
              ]),

              // Languages
              _buildSkillCategory("Languages", [
                "JavaScript",
                "TypeScript",
                "NodeJS",
                "Python",
                "PHP",
                "C++",
                "SQL",
                "Bash",
                "HTML,CSS,Sass",
              ]),

              // Design Principles
              _buildSkillCategory("Design Principles", ["OOP", "MVC", "MVVM"]),

              // Version Control
              _buildSkillCategory("Version Control", ["Git", "GitHub"]),

              // Security
              _buildSkillCategory("Security", [
                "OAuth",
                "JWT",
                "OWASP",
                "eWAPT",
                "EJPT",
              ]),

              // Cloud
              _buildSkillCategory("Cloud", ["AWS", "Google Cloud", "Firebase"]),

              // Other categories
              _buildSkillCategory("Testing", ["Postman"]),
              _buildSkillCategory("WebRTC", ["Socket.io", "WebRTC"]),
              _buildSkillCategory("Frameworks", [
                "Flask",
                "Django",
                "NestJS",
                "Express.js",
                "FastAPI",
                "Laravel",
              ]),
              _buildSkillCategory("Web Technologies", [
                "REST APIs",
                "GraphQL",
                "WebSockets",
              ]),
              _buildSkillCategory("Mobile Development", [
                "React Native",
                "Flutter",
              ]),
              _buildSkillCategory("UI/UX", ["Adobe XD"]),
              _buildSkillCategory("SEO", [
                "Google Analytics",
                "Google Search Console",
              ]),
              _buildSkillCategory("APIs", ["RESTful APIs", "GraphQL APIs"]),
              _buildSkillCategory("Authentication", ["OAuth2", "JWT"]),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(String category, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "### $category",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: secondaryColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        skill,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
