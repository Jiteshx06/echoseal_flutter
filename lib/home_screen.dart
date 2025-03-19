import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Video Recording',
      'icon': Icons.videocam_rounded,
      'screen': 'VideoRecord',
      'description': 'Capture and upload videos'
    },
    {
      'title': 'Voice Recording',
      'icon': Icons.mic_rounded,
      'screen': 'VoiceRecord',
      'description': 'Upload high-quality voice notes'
    },
    {
      'title': 'My Uploads',
      'icon': Icons.cloud_upload_rounded,
      'screen': 'Uploads',
      'description': 'View all your stored media'
    }
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, 'Home');
        break;
      case 1:
        Navigator.pushNamed(context, 'Messages');
        break;
      case 2:
        Navigator.pushNamed(context, 'Settings');
        break;
      case 3:
        Navigator.pushNamed(context, 'Support');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: FadeInDown(
          duration: Duration(milliseconds: 700),
          child: Text(
            'Echoseal',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          FadeInRight(
            duration: Duration(milliseconds: 800),
            child: IconButton(
              icon: CircleAvatar(
                radius: screenWidth * 0.06,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              onPressed: () => Navigator.pushNamed(context, 'Profile'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.03),
          BounceInDown(
            duration: Duration(milliseconds: 1200),
            child: Center(
              child: Text(
                "Features",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.045,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final feature = features[index];
                return FadeInUp(
                  duration: Duration(milliseconds: 800 + (index * 100)),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, feature['screen']),
                    child: Container(
                      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: Offset(0, 10),
                          ),
                        ],
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              feature['icon'],
                              size: screenWidth * 0.07,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feature['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                feature['description'],
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: screenWidth * 0.04, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FadeInRight(
        duration: Duration(milliseconds: 800),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () => Navigator.pushNamed(context, 'Chatbot'),
          child: Icon(Icons.smart_toy, size: screenWidth * 0.07, color: Colors.white),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF151A25),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey[500],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: screenWidth * 0.07), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.message, size: screenWidth * 0.07), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, size: screenWidth * 0.07), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.support_agent, size: screenWidth * 0.07), label: 'Support'),
          ],
        ),
      ),
    );
  }
}
