// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black.withOpacity(0.8)),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF213E60)),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Move the "Portfolio" title upwards
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF213E60),
                ),
              ),
            ),
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildAboutMeSection(),
            const SizedBox(height: 20),
            _buildSkillsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Color(0xFFFBB7B7), Color(0xFF213E60)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              'Intan Dewiasari Kaimudin',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: const Text(
              'intankaimudin22@gmail.com',
              style: TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home,
            text: 'Portfolio',
            onTap: () => Navigator.pop(context),
          ),
          _buildDrawerItem(
            icon: Icons.music_note,
            text: 'Music',
            onTap: () async {
              final Uri url = Uri.parse('https://open.spotify.com/');
              await launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          _buildDrawerItem(
            icon: Bootstrap.whatsapp,
            text: 'WhatsApp',
            onTap: () async {
              final Uri url =
                  Uri.parse('https://wa.me/6282238482847?text=Hello');
              await launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          _buildDrawerItem(
            icon: Bootstrap.instagram,
            text: 'Instagram',
            onTap: () async {
              final Uri url =
                  Uri.parse('https://www.instagram.com/intankaimudin');
              await launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          _buildDrawerItem(
            icon: Bootstrap.facebook,
            text: 'Facebook',
            onTap: () async {
              final Uri url = Uri.parse('https://facebook.com/');
              await launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Exit',
            color: Colors.red,
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Color(0xFFFBB7B7), Color(0xFF213E60)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Intan Dewiasari Kaimudin',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Informatics Engineering Student',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMeSection() {
    return _buildCard(
      title: 'About Me',
      content:
          'I am a fifth-semester Computer Science student with a strong passion for mobile and web application development. Currently, I am focused on learning modern frameworks like Flutter and Firebase. I am committed to growing in the tech field and aspire to become a software engineer who creates impactful digital solutions.',
      backgroundColor: Color(0xFFF2F9FC), // Light blue background color
    );
  }

  Widget _buildSkillsSection() {
    return _buildCard(
      title: 'My Skills',
      content:
          'Currently, I am learning and developing skills in the following areas:\n'
          '- Basics of Flutter for mobile app development.\n'
          '- Simple programming with Python.\n'
          '- Basic understanding of JavaScript and HTML.',
      backgroundColor: Color(0xFFF2F9FC), // Light blue background color
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    Color color = const Color(0xFF213E60),
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildCard({
    required String title,
    String? content,
    Widget? child,
    Color backgroundColor = Colors.white, // Default white background
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF213E60),
              ),
            ),
            const SizedBox(height: 12),
            if (content != null)
              Text(content,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.7))),
            if (child != null) child,
          ],
        ),
      ),
    );
  }
}
