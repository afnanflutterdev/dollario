import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF121212),
            const Color(0xFF1E1E2F),
            const Color(0xFF1E1E2F).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFF00FFFF)],
            ).createShader(bounds),
            child: Text(
              'Privacy Policy',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E2F),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Privacy Policy', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))),
                  const SizedBox(height: 16),
                  Text('Your privacy is important to us. Dollario does not collect or share your personal data. All calculations are performed locally on your device.', style: GoogleFonts.inter(color: Color(0xFFECEFF1), fontSize: 18)),
                  const SizedBox(height: 24),
                  Text('For more information, contact us at support@dollario.app', style: GoogleFonts.inter(color: Color(0xFFB0BEC5), fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 