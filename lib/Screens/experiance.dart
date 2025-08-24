import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperianceScreen extends StatelessWidget {
  const ExperianceScreen({Key? key}) : super(key: key);

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
                "Experience & Education",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "My professional journey, certifications, and educational background.",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Certifications
              Text(
                "Certifications",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 24),

              // Certificate 1
              _buildCertificateCard(
                title: "WebSocket Communications with Node and Angular",
                organization: "LinkedIn Learning",
                year: "2025",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/CertificateOfCompletion_WebSocket%20Communications%20with%20Node%20and%20Angular-BjwP9uHk.pdf",
              ),

              // Certificate 2
              _buildCertificateCard(
                title: "Computer Network Fundamentals",
                organization: "ComptiaN+ By Mahara-Tech",
                year: "2024",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Course_Certificate_En-Bpa8am8N.pdf",
              ),

              // Certificate 3
              _buildCertificateCard(
                title: "Ethical Hacking",
                organization: "Cisco e-jpwt By Mahara-Tech",
                year: "2024",
                description: "Ethical Hacking and Penetration Testing",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Course_Certificate_En%20(1)-DGuM0v6-.pdf",
              ),

              // Certificate 4
              _buildCertificateCard(
                title: "Python Programming",
                organization: "mahara-tech",
                year: "2024",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Course_Certificate_En%20(2)-j0nls0Tg.pdf",
              ),

              // Certificate 5
              _buildCertificateCard(
                title: "Implementation of Computer Network Fundamentals",
                organization: "Cisco By mahara-tech",
                year: "2024",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Course_Certificate_En%20(3)-CSB_7mPY.pdf",
              ),

              // Certificate 6
              _buildCertificateCard(
                title: "Red Hat System Administration I",
                organization: "Enterprise Linux by mahara-tech",
                year: "2024",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Course_Certificate_En%20(4)-C6VshCqJ.pdf",
              ),

              // Certificate 7
              _buildCertificateCard(
                title: "Web Security Certifications",
                organization: "PortSwigger Labs, eWAPT, EJPT",
                year: "2024",
              ),

              SizedBox(height: 40),

              // Education
              Text(
                "Education",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 24),

              // Education 1
              _buildEducationCard(
                title: "MEAN-Stack and Full-Web Application Developer",
                institution: "NTI-National Telecommunication Institute",
                year: "Graduated: Jan 2025",
                learnMoreUrl:
                    "https://abdelrhman-dev.me/Abdelrhman/assets/Abdelrhman%20Muhamed%20Abdelghafar%20Muhammed%20(1)-Bz-v3i9z.pdf",
              ),

              SizedBox(height: 40),

              // Languages
              Text(
                "Languages",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 24),

              // Language proficiencies
              ListTile(
                title: Text("Arabic"),
                subtitle: Text("Native"),
                leading: Icon(Icons.language, color: secondaryColor),
              ),
              Divider(),

              ListTile(
                title: Text("English"),
                subtitle: Text("Fluent"),
                leading: Icon(Icons.language, color: secondaryColor),
              ),
              Divider(),

              ListTile(
                title: Text("German"),
                subtitle: Text("Intermediate"),
                trailing: TextButton(
                  onPressed: () => _launchUrl(
                    "https://abdelrhman-dev.me/Abdelrhman/assets/CertificateOfCompletion_German%20for%20Absolute%20Beginners-C7StPe2y.pdf",
                  ),
                  child: Text("Learn More"),
                ),
                leading: Icon(Icons.language, color: secondaryColor),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCertificateCard({
    required String title,
    required String organization,
    required String year,
    String? description,
    String? learnMoreUrl,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        organization,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        year,
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor.withOpacity(0.6),
                        ),
                      ),
                      if (description != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor.withOpacity(0.7),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (learnMoreUrl != null)
                  TextButton(
                    onPressed: () => _launchUrl(learnMoreUrl),
                    child: Text("Learn More"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard({
    required String title,
    required String institution,
    required String year,
    String? learnMoreUrl,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        institution,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        year,
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                if (learnMoreUrl != null)
                  TextButton(
                    onPressed: () => _launchUrl(learnMoreUrl),
                    child: Text("Learn More"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
