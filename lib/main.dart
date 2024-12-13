// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: const BoxDecoration(),
              child: AppBar(
                iconTheme: const IconThemeData(color: Color(0xFF000080)),
                backgroundColor:
                    Colors.white, // Transparent untuk menunjukkan gradient
                elevation: 0, // Menghapus shadow
                centerTitle: true,
                title: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF000080),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Intan Dewiasari Kaimudin',
                    style: TextStyle(
                        color: Color(0xFF000080),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text('intankaimudin22@gmail.com',
                      style: TextStyle(color: Color(0xFF000080))),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/logo.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Color(0xFFF5F5DC),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1095.jpg'))),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people_alt,
                    color: Color(0xFF000080),
                  ),
                  title: const Text('Portfolio'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Color(0xFF000080),
                  ),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6282196108804?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.instagram,
                      color: Color(0xFF000080)),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.instagram.com/intankaimudin_?igsh=MTc3cTR0MG41bnZo');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1, // Ketebalan garis
                  color: Colors.blue, // Warna garis
                  indent: 16, // Jarak dari sisi kiri
                  endIndent: 16, // Jarak dari sisi kanan
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card Content
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          // Profile Avatar
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Colors.purple,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),

                            padding:
                                const EdgeInsets.all(4), // Ketebalan outline
                            child: const CircleAvatar(
                              radius: 100, // Ukuran lingkaran avatar
                              backgroundImage: AssetImage('assets/logo.jpg'),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Intan Dewiasari Kaimudin',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000080), // Warna indigo 700
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            'Informatics Engineering Student',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey, // Warna indigo 700
                            ),
                          ),

                          Card(
                            margin: EdgeInsets.all(10),
                            color: Color(0xFFF5F5DC),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Skill Saya',
                                      style: TextStyle(
                                        color: Color(0xFF000080),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'I am a fifth-semester Computer Science student with a strong passion for mobile and web application development. '
                                      'Currently, I am focused on learning modern frameworks like Flutter and Firebase. '
                                      'I am committed to growing in the tech field and aspire to become a software engineer who creates impactful digital solutions.',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            color: Color(0xFFF5F5DC),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skill Saya',
                                    style: TextStyle(
                                      color: Color(0xFF000080),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign:
                                        TextAlign.center, // Pusatkan teks judul
                                  ),
                                  Wrap(
                                    spacing:
                                        10, // Jarak horizontal antar elemen
                                    runSpacing:
                                        10, // Jarak vertikal antar elemen
                                    alignment: WrapAlignment.center,
                                    children: const [
                                      Text(
                                        'Currently, I am learning and developing skills in the following areas:\n'
                                        '- Basics of Flutter for mobile app development.\n'
                                        '- Simple programming with Python.\n'
                                        '- Basic understanding of JavaScript and HTML.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              14, // Ukuran teks bisa disesuaikan
                                        ),
                                      ),
                                      Icon(
                                        Icons.flutter_dash,
                                        color: Colors.blue,
                                        size: 40, // Ukuran ikon
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.python, // Ikon Python
                                        color: Colors.blueAccent,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.js, // Ikon JavaScript
                                        color: Colors.yellow,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.html5, // Ikon HTML
                                        color: Colors.orange,
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
