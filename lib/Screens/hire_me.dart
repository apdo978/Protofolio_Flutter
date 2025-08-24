import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HireMeScreen extends StatefulWidget {
  const HireMeScreen({Key? key}) : super(key: key);

  @override
  State<HireMeScreen> createState() => _HireMeScreenState();
}

class _HireMeScreenState extends State<HireMeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _budgetController = TextEditingController();
  final _projectDetailsController = TextEditingController();

  // EmailJS Configuration
  static const String _serviceId = 'service_67kb1dc';
  static const String _templateId = 'template_253woyl'; // Main template
  static const String _autoReplyTemplateId =
      'template_v27b7ps'; // Auto-reply template
  static const String _publicKey = 'pTJXgAYxxtFObHDBu';

  bool _isLoading = false;

  String? _selectedProjectType;
  final List<String> _projectTypes = [
    'Web Application',
    'Mobile Application',
    'E-commerce Website',
    'Portfolio Website',
    'API Development',
    'Database Design',
    'Other',
  ];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  // EmailJS Integration - Send project inquiry via email
  Future<bool> _sendProjectInquiry() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final templateParams = {
        'from_name': _nameController.text,
        'from_email': _emailController.text,
        'company': _companyController.text.isEmpty
            ? 'Not specified'
            : _companyController.text,
        'project_type': _selectedProjectType ?? 'Not specified',
        'budget': _budgetController.text.isEmpty
            ? 'Not specified'
            : '\$${_budgetController.text}',
        'project_details': _projectDetailsController.text,
        'to_email': 'talktoboda01@gmail.com', // Your email
        'reply_to': _emailController.text,
      };

      // Send main email to you
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
          'Origin': 'https://yourdomain.com',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
        },
        body: json.encode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': templateParams,
        }),
      );

      // Send auto-reply to client
      final autoReplyResponse = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
          'Origin': 'https://yourdomain.com',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
        },
        body: json.encode({
          'service_id': _serviceId,
          'template_id': _autoReplyTemplateId,
          'user_id': _publicKey,
          'template_params': templateParams,
        }),
      );

      // print('Main email response: ${response.body}');
      // print('Auto-reply response: ${autoReplyResponse.body}');

      setState(() {
        _isLoading = false;
      });

      return response.statusCode == 200 && autoReplyResponse.statusCode == 200;
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // print('Error sending email: $e');
      return false;
    }
  }

  // Alternative method using mailto as fallback
  Future<void> _sendViaEmail() async {
    final String subject = Uri.encodeComponent(
      'Project Inquiry from ${_nameController.text}',
    );
    final String body = Uri.encodeComponent('''
Hello Abdelrhman,

I'm interested in working with you on a project. Here are the details:

Name: ${_nameController.text}
Email: ${_emailController.text}
Company: ${_companyController.text.isEmpty ? 'Not specified' : _companyController.text}
Project Type: ${_selectedProjectType ?? 'Not specified'}
Budget: ${_budgetController.text.isEmpty ? 'Not specified' : '\$${_budgetController.text}'}

Project Details:
${_projectDetailsController.text}

Looking forward to hearing from you!

Best regards,
${_nameController.text}
''');

    final String emailUrl =
        'mailto:talktoboda01@gmail.com?subject=$subject&body=$body';
    await _launchUrl(emailUrl);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _budgetController.dispose();
    _projectDetailsController.dispose();
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
                "Hire Me",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Let's collaborate on your next project! Fill out the form below with your project details.",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 40),

              // Services section
              Text(
                "Services I Offer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 20),

              // Services grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildServiceCard("Full-Stack Web Development", Icons.web),
                  _buildServiceCard(
                    "Mobile App Development",
                    Icons.phone_android,
                  ),
                  _buildServiceCard("API Development", Icons.api),
                  _buildServiceCard("Database Design", Icons.storage),
                  _buildServiceCard("UI/UX Design", Icons.design_services),
                  _buildServiceCard(
                    "E-commerce Solutions",
                    Icons.shopping_cart,
                  ),
                ],
              ),

              SizedBox(height: 40),

              // Project Inquiry Form
              Text(
                "Project Inquiry Form",
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

                    // Company Field (optional)
                    TextFormField(
                      controller: _companyController,
                      decoration: InputDecoration(
                        labelText: "Company (optional)",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.business),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Project Type Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedProjectType,
                      decoration: InputDecoration(
                        labelText: "Project Type",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.category),
                      ),
                      items: _projectTypes.map((String type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedProjectType = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a project type';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Budget Field
                    TextFormField(
                      controller: _budgetController,
                      decoration: InputDecoration(
                        labelText: "Budget (USD)",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.monetization_on),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),

                    // Project Details Field
                    TextFormField(
                      controller: _projectDetailsController,
                      decoration: InputDecoration(
                        labelText: "Project Details",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide some project details';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),

                    // Submit Buttons
                    Column(
                      children: [
                        // Primary EmailJS Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      // Try EmailJS first
                                      bool emailSent =
                                          await _sendProjectInquiry();

                                      if (emailSent) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Project inquiry sent successfully!',
                                            ),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 3),
                                          ),
                                        );

                                        // Clear form
                                        _nameController.clear();
                                        _emailController.clear();
                                        _companyController.clear();
                                        _budgetController.clear();
                                        _projectDetailsController.clear();
                                        setState(() {
                                          _selectedProjectType = null;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Failed to send. Try alternative method below.',
                                            ),
                                            backgroundColor: Colors.orange,
                                            duration: Duration(seconds: 3),
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
                            icon: _isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(Icons.send),
                            label: Text(
                              _isLoading ? "Sending..." : "Submit Inquiry ",
                            ),
                          ),
                        ),

                        SizedBox(height: 12),

                        // Fallback Email Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await _sendViaEmail();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Opening email client...'),
                                      backgroundColor: Colors.blue,
                                    ),
                                  );

                                  // Clear form
                                  _nameController.clear();
                                  _emailController.clear();
                                  _companyController.clear();
                                  _budgetController.clear();
                                  _projectDetailsController.clear();
                                  setState(() {
                                    _selectedProjectType = null;
                                  });
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
                            style: OutlinedButton.styleFrom(
                              foregroundColor: secondaryColor,
                              side: BorderSide(color: secondaryColor),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            icon: Icon(Icons.email),
                            label: Text("Send via Gmail"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Alternative contact methods
              Text(
                "Or Connect Directly",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 16),

              // Email button
              ElevatedButton.icon(
                onPressed: () => _launchUrl("mailto:talktoboda01@gmail.com"),
                icon: Icon(Icons.email),
                label: Text("Send Email"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cardColor,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              // LinkedIn button
              ElevatedButton.icon(
                onPressed: () => _launchUrl("https://linkedin.com/in/apdo978/"),
                icon: FaIcon(FontAwesomeIcons.linkedin),
                label: Text("Connect on LinkedIn"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String service, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: secondaryColor, size: 40),
            SizedBox(height: 10),
            Text(
              service,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
