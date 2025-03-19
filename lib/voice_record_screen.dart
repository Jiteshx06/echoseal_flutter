import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class VoiceRecordScreen extends StatelessWidget {
  void _pickAudio() async {
    await FilePicker.platform.pickFiles(type: FileType.audio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: FadeInDown(
          duration: Duration(milliseconds: 700),
          child: Text(
            'Voice Recording',
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: BounceInUp(
        duration: Duration(milliseconds: 800),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: _pickAudio,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Center(
        child: FadeIn(
          duration: Duration(milliseconds: 800),
          child: Text(
            'Record or Upload Audio',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
