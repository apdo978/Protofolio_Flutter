import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  // Option 1: Send email using mailto (opens default email client)
  Future<void> _sendEmailMessage() async {
    final String subject = Uri.encodeComponent(
      'Contact Form Message from ${_nameController.text}',
    );
    final String body = Uri.encodeComponent('''
Name: ${_nameController.text}
Email: ${_emailController.text}

Message:
${_messageController.text}

---
Sent from Portfolio App
''');

    final String emailUrl =
        'mailto:talktoboda01@gmail.com?subject=$subject&body=$body';
    await _launchUrl(emailUrl);
  }

  // Option 2: Send via WhatsApp
  Future<void> _sendWhatsAppMessage() async {
    final String message = Uri.encodeComponent('''
*New Contact Form Message*

*Name:* ${_nameController.text}
*Email:* ${_emailController.text}

*Message:*
${_messageController.text}
''');

    final String whatsappUrl =
        'https://api.whatsapp.com/send/?phone=201271175532&text=$message';
    await _launchUrl(whatsappUrl);
  }

  // Option 3: Copy to clipboard
  void _copyToClipboard() {
    final String message =
        '''
Name: ${_nameController.text}
Email: ${_emailController.text}
Message: ${_messageController.text}
''';

    Clipboard.setData(ClipboardData(text: message));

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Message copied to clipboard!')));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
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
                "Get In Touch",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Have a project in mind or want to discuss potential opportunities? Feel free to reach out!",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Contact Information Section
              Text(
                "Contact Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 24),

              // Email
              _buildContactItem(
                icon: Icons.email,
                title: "Email",
                content: "talktoboda01@gmail.com",
                onTap: () => _launchUrl("mailto:talktoboda01@gmail.com"),
              ),

              // Phone
              _buildContactItem(
                icon: Icons.phone,
                title: "Phone",
                content: "+20 127 117 5532",
                onTap: () => _launchUrl("tel:+201271175532"),
              ),

              // Location
              _buildContactItem(
                icon: Icons.location_on,
                title: "Location",
                content: "6th of October City, Giza, Egypt",
              ),

              SizedBox(height: 30),

              // Social Links
              Text(
                "Connect with me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // GitHub
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () => _launchUrl("https://github.com/apdo978"),
                    iconSize: 30,
                    color: textColor,
                  ),
                  SizedBox(width: 16),

                  // LinkedIn
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () =>
                        _launchUrl("https://linkedin.com/in/apdo978/"),
                    iconSize: 30,
                    color: Colors.blue[800],
                  ),
                  SizedBox(width: 16),

                  // Facebook
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    onPressed: () =>
                        _launchUrl("https://www.facebook.com/apdo9788"),
                    iconSize: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 16),

                  // WhatsApp
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.whatsapp),
                    onPressed: () => _launchUrl(
                      "https://api.whatsapp.com/send/?phone=0201271175532&text&type=phone_number&app_absent=0",
                    ),
                    iconSize: 30,
                    color: Colors.green,
                  ),
                ],
              ),

              SizedBox(height: 40),

              // Contact Form
              Text(
                "Send Me a Message",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 20),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Your Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Your Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Message Field
                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelText: "Your Message",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.message),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),

                    // Submit Button Options
                    Column(
                      children: [
                        // Primary Email Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await _sendEmailMessage();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Opening email client...'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // Clear form after successful send
                                  _nameController.clear();
                                  _emailController.clear();
                                  _messageController.clear();
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Error: Could not open email client',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            icon: Icon(Icons.email),
                            label: Text("Send via Email"),
                          ),
                        ),

                        SizedBox(height: 12),

                        // WhatsApp Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await _sendWhatsAppMessage();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Opening WhatsApp...'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // Clear form after successful send
                                  _nameController.clear();
                                  _emailController.clear();
                                  _messageController.clear();
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Error: Could not open WhatsApp',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Color(0xFF25D366),
                              side: BorderSide(color: Color(0xFF25D366)),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            icon: FaIcon(FontAwesomeIcons.whatsapp),
                            label: Text("Send via WhatsApp"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              // Footer section with quick links
              Divider(),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abdelrhman.dev",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Full-Stack Web Developer specializing in MEAN stack development with a passion for creating efficient, user-friendly applications.",
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.github, size: 20),
                              onPressed: () =>
                                  _launchUrl("https://github.com/apdo978"),
                              color: textColor,
                              constraints: BoxConstraints(
                                minWidth: 30,
                                minHeight: 30,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin, size: 20),
                              onPressed: () => _launchUrl(
                                "https://linkedin.com/in/apdo978/",
                              ),
                              color: textColor,
                              constraints: BoxConstraints(
                                minWidth: 30,
                                minHeight: 30,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.envelope, size: 20),
                              onPressed: () =>
                                  _launchUrl("mailto:talktoboda01@gmail.com"),
                              color: textColor,
                              constraints: BoxConstraints(
                                minWidth: 30,
                                minHeight: 30,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  // Quick Links
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quick Links",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildQuickLink(
                          "About",
                          () => Navigator.pushNamed(context, '/about'),
                        ),
                        _buildQuickLink(
                          "Skills",
                          () => Navigator.pushNamed(context, '/skills'),
                        ),
                        _buildQuickLink(
                          "Projects",
                          () => Navigator.pushNamed(context, '/Projects'),
                        ),
                        _buildQuickLink(
                          "Experience",
                          () => Navigator.pushNamed(context, '/Experiance'),
                        ),
                        _buildQuickLink(
                          "Contact",
                          () => Navigator.pushNamed(context, '/contact'),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  // Contact Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Info",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildContactInfoItem(
                          "Email:",
                          "talktoboda01@gmail.com",
                        ),
                        _buildContactInfoItem("Phone:", "+20 127 117 5532"),
                        _buildContactInfoItem(
                          "Location:",
                          "6th of October City, Giza, Egypt",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Center(
                child: Text(
                  "© 2025 Abdelrhman Muhamed. All rights reserved.",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    Function()? onTap,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: secondaryColor, size: 30),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
        ),
        subtitle: Text(
          content,
          style: TextStyle(color: textColor.withOpacity(0.7)),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildQuickLink(String text, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.8)),
        ),
      ),
    );
  }

  Widget _buildContactInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14, color: textColor),
          children: [
            TextSpan(
              text: label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: " $value"),
          ],
        ),
      ),
    );
  }
}
