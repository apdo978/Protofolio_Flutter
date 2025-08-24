import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

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
                "Projects",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Some of my recent projects showcasing my full-stack development skills.",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Project 1
              _buildProjectCard(
                title: "Full Social Media App",
                description:
                    "A dynamic, real-time social media web application built with the MEAN stack "
                    "(MongoDB, Express.js, Angular, Node.js). Designed for seamless communication and "
                    "user engagement, SocialApp offers a modern social networking experience with core features.",
                features: [
                  "📢 Live Notifications and user activity tracking",
                  "🟢 Online / Offline Status Monitoring",
                  "📨 Read / Unread Message System",
                  "👥 Friend Requests & User Connections",
                  "📄 Post Creation, Likes, and Comments",
                ],
                demoUrl: "https://apdo978.github.io/SocialApp/landing",
                codeUrl: "https://github.com/apdo978/SocialApp",
                imageUrl:
                    "images/Screenshot 2025-07-26 183848.png", // Placeholder image
                tags: ["Angular", "Express.js", "MongoDB", "JWT"],
              ),
              SizedBox(height: 30),

              // Project 2
              _buildProjectCard(
                title: "Full E-Commerce Web App",
                description:
                    "A comprehensive e-commerce platform with dynamic dashboard and product management.",
                features: [
                  "Developed a full single-page application with dynamic dashboard",
                  "Backend built using RESTful APIs in Node.js with JWT and OAuth",
                  "Frontend with reusable Angular components focusing on clean UX",
                  "Used MongoDB and followed MVC pattern",
                ],
                demoUrl: "https://apdo978.github.io/E-commerce-MEAN/home",
                codeUrl:
                    "https://github.com/apdo978/full-e-commerce-for-nti-with-mean-technology",
                imageUrl:
                    "images/Screenshot 2025-07-26 185531.png", // Placeholder image
                tags: ["Node.js", "Angular", "TypeScript", "WebSocket"],
              ),
              SizedBox(height: 30),

              // Project 3
              _buildProjectCard(
                title: "Full Real-time Chat App",
                description:
                    "A WebSocket-based chat application with real-time messaging capabilities.",
                features: [
                  "Used WebSocket, Node.js with TypeScript (OOP, modules, and type libraries)",
                  "Angular - AngularComponent (TypeScript - OOP)",
                  "Single repo architecture for maintainability",
                ],
                demoUrl: "https://apdo978.github.io/webappchat/",
                codeUrl:
                    "https://github.com/apdo978/chatback?tab=License-1-ov-file",
                imageUrl:
                    "images/ecbc22a4-cc19-43e1-97ba-beecee6cfc29.png", // Placeholder image
                tags: ["React", "Ts", "GSAP", "Git"],
              ),
              SizedBox(height: 30),

              // Project 4
              _buildProjectCard(
                title: "Business Portfolio - REACTJS",
                description:
                    "A responsive, multi-language portfolio website to showcase projects and skills.",
                features: [
                  "Built with HTML, CSS, JavaScript, and GSAP for animation",
                  "Features include dark/light mode toggling, smooth scrolling",
                  "Interactive projects previews",
                ],
                demoUrl: "https://apdo978.github.io/Abdelrhman/",
                codeUrl: "https://github.com/apdo978/Abdelrhman",
                imageUrl:
                    "images/Screenshot 2025-07-26 191322.png", // Placeholder image
                tags: ["React", "JavaScript", "CSS", "HTML"],
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required List<String> features,
    required String demoUrl,
    required String codeUrl,
    required String imageUrl,
    required List<String> tags,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
            ),
            SizedBox(height: 16),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "• $feature",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: cardColor,
                      labelStyle: TextStyle(color: textColor),
                      side: BorderSide(color: borderColor),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _launchUrl(demoUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Live Demo"),
                ),
                ElevatedButton(
                  onPressed: () => _launchUrl(codeUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cardColor,
                    foregroundColor: textColor,
                    side: BorderSide(color: borderColor),
                    elevation: 2,
                  ),
                  child: Text("Source Code"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
