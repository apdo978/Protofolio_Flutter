# 🚀 Abdelrhman's Portfolio - Flutter Cross-Platform App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![EmailJS](https://img.shields.io/badge/EmailJS-FF6B6B?style=for-the-badge&logo=gmail&logoColor=white)
![Web](https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

*A modern, responsive portfolio application built with Flutter, featuring a unique phone viewport for web and real email functionality*

[🌐 Live Demo](https://your-portfolio-url.com) • [📱 Download APK](https://your-portfolio-url.com/app.apk) • [📧 Contact](mailto:talktoboda01@gmail.com)

</div>

---

## 📱 **Project Overview**

This is a comprehensive portfolio application showcasing modern Flutter development with cross-platform capabilities. The app features a unique **dynamic phone viewport** for web users, providing a mobile-first experience that adapts to any screen size.

### 🎯 **Key Highlights**
- **Cross-Platform**: Runs on Web, Android, iOS, and Desktop
- **Responsive Design**: Mobile-first with dynamic phone viewport for web
- **Real Email Integration**: Contact forms with EmailJS and Arabic auto-replies
- **Modern UI/UX**: Dark/Light mode with smooth animations
- **Professional Portfolio**: Complete showcase of skills, projects, and experience

---

## ✨ **Features**

### 🎨 **UI/UX Features**
- ✅ **Dynamic Phone Viewport** - Web users see a realistic phone mockup
- ✅ **Responsive Design** - Adapts to all screen sizes
- ✅ **Dark/Light Mode** - Toggle between themes
- ✅ **Smooth Animations** - Professional animated text and transitions
- ✅ **Touch Gestures** - Swipe navigation on web phone mockup
- ✅ **Modern Design** - Clean, professional interface

### 📧 **Email Integration**
- ✅ **Real Email Functionality** - Powered by EmailJS
- ✅ **Auto-Reply System** - Automatic responses to clients
- ✅ **Arabic Email Templates** - Professional bilingual communication
- ✅ **Form Validation** - Complete input validation
- ✅ **Multiple Contact Methods** - Email, WhatsApp, LinkedIn integration

### 📱 **Cross-Platform Support**
- ✅ **Web Application** - Deployed and accessible online
- ✅ **Android APK** - Native mobile experience
- ✅ **iOS Ready** - Configured for App Store deployment
- ✅ **Progressive Web App** - PWA capabilities with offline support

---

## 🛠️ **Tech Stack**

### **Frontend**
- **Flutter 3.9+** - Cross-platform UI framework
- **Dart** - Programming language
- **Provider** - State management for theming
- **Material Design** - Google's design system

### **Animations & UI**
- **animated_text_kit** - Text animations
- **font_awesome_flutter** - Icon library
- **Custom Widgets** - Reusable component system

### **Backend Services**
- **EmailJS** - Email service integration
- **HTTP** - API communication
- **URL Launcher** - External link handling

### **Audio & Media**
- **AudioPlayers** - Sound effects and music

---

## 📋 **App Screens**

| Screen | Description | Features |
|--------|-------------|----------|
| 🏠 **Home** | Landing page with introduction | Animated text, theme toggle, navigation |
| 👨‍💻 **About** | Personal information and background | Professional summary, experience overview |
| 🛠️ **Skills** | Technical skills showcase | Categorized skill sets, proficiency levels |
| 🚀 **Projects** | Portfolio projects gallery | Project showcases, live demos, source code |
| 💼 **Experience** | Work history and achievements | Timeline, company details, responsibilities |
| 📞 **Contact** | Contact information and social links | Multiple contact methods, social media |
| 💼 **Hire Me** | Project inquiry form | EmailJS integration, detailed project forms |

---

## 🚀 **Quick Start**

### **Prerequisites**
```bash
Flutter SDK 3.9+
Dart SDK 2.19+
Android Studio / VS Code
Git
```

### **Installation**
```bash
# Clone the repository
git clone https://github.com/yourusername/flutter-portfolio.git

# Navigate to project directory
cd flutter-portfolio

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### **Building for Production**
```bash
# Build for Web
flutter build web --release

# Build for Android
flutter build apk --release

# Build for iOS
flutter build ios --release
```

---

## 🌐 **Deployment**

### **Web Deployment**
The app is optimized for various hosting platforms:

- **Netlify** - Recommended for auto-deployment
- **Vercel** - Great performance and custom domains
- **GitHub Pages** - Free hosting with GitHub integration
- **Firebase Hosting** - Google Cloud with analytics

### **Mobile Deployment**
- **Google Play Store** - Android distribution
- **Apple App Store** - iOS distribution
- **Direct APK** - Direct download for Android users

---

## 📧 **EmailJS Setup**

The app includes real email functionality. To set up:

1. Create an EmailJS account
2. Configure email service (Gmail recommended)
3. Create email templates
4. Update credentials in `lib/Screens/hire_me.dart`

*See [EMAILJS_SETUP.md](EMAILJS_SETUP.md) for detailed instructions*

---

## 🎨 **Dynamic Phone Viewport**

### **Unique Web Feature**
The app features a revolutionary **dynamic phone viewport** for web users:

- **Realistic Phone Mockup** - iPhone-style frame with status bar
- **Dynamic Sizing** - Adapts to any screen size
- **Touch Gestures** - Swipe navigation
- **Professional Presentation** - Perfect for showcasing to clients

### **Responsive Behavior**
```dart
// Automatically detects platform
if (kIsWeb) {
  // Show phone viewport wrapper
  return PhoneViewportWrapper(child: YourScreen());
} else {
  // Show native mobile layout
  return YourScreen();
}
```

---

## 🎯 **Key Components**

### **1. Theme System**
```dart
// Complete dark/light mode implementation
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    updateColors(_isDarkMode);
    notifyListeners();
  }
}
```

### **2. Phone Viewport Wrapper**
```dart
// Dynamic web phone mockup
class PhoneViewportWrapper extends StatelessWidget {
  final Widget child;
  
  // Adapts to screen size and provides phone-like experience
}
```

### **3. EmailJS Integration**
```dart
// Real email functionality
static const String _serviceId = 'YOUR_SERVICE_ID';
static const String _templateId = 'YOUR_TEMPLATE_ID';
static const String _publicKey = 'YOUR_PUBLIC_KEY';
```

---

## 📊 **Project Statistics**

- **7 Complete Screens** - Full portfolio coverage
- **50+ Custom Widgets** - Reusable component library
- **Dark/Light Themes** - Complete theming system
- **Multi-Language Support** - English and Arabic emails
- **Cross-Platform** - Web, Android, iOS, Desktop ready
- **Production Ready** - Optimized builds and deployment

---

## 🎉 **Live Demo**

### **Try It Now!**
- 🌐 **Web Version**: [https://your-portfolio-url.com](https://your-portfolio-url.com)
- 📱 **Mobile App**: [Download APK](https://your-portfolio-url.com/app.apk)
- 📧 **Contact Form**: Test the real email functionality
- 🌙 **Dark Mode**: Toggle between light and dark themes
- 📱 **Phone Mockup**: Experience the unique web phone viewport

---

## 🤝 **Contributing**

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 **Contact**

**Abdelrhman Muhamed** - Full Stack Developer

- 📧 Email: [talktoboda01@gmail.com](mailto:talktoboda01@gmail.com)
- 💼 LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/yourprofile)
- 🌐 Portfolio: [https://your-portfolio-url.com](https://your-portfolio-url.com)
- 📱 WhatsApp: [Contact on WhatsApp](https://wa.me/yourphonenumber)

---

## 🙏 **Acknowledgments**

- Flutter team for the amazing framework
- EmailJS for reliable email services
- Font Awesome for beautiful icons
- Material Design for the design system
- The Flutter community for inspiration and support

---

<div align="center">

**⭐ Star this repo if you found it helpful!**

Made with ❤️ by Abdelrhman Muhamed

</div>
