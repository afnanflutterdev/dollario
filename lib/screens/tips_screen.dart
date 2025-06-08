import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/responsive_layout.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0A0A0A),
            const Color(0xFF1A1A1A),
            const Color(0xFF2A2A2A).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
            ).createShader(bounds),
            child: Text(
              'Tips & Help',
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
        body: ResponsiveLayout(
          mobile: _buildContent(context),
          tablet: Center(
            child: SizedBox(
              width: 600,
              child: _buildContent(context),
            ),
          ),
          desktop: Center(
            child: SizedBox(
              width: 800,
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        _TipSection(
          title: 'Getting Started',
          tips: [
            'Enter the USD amount you received from your client',
            'Select the platform you used (PayPal, Fiverr, etc.)',
            'Choose your local currency',
            'Click Convert to see the breakdown',
          ],
        ),
        _TipSection(
          title: 'Understanding Fees',
          tips: [
            'Platform fees vary by service (PayPal, Fiverr, Upwork, etc.)',
            'Fees include both percentage and fixed amounts',
            'The app calculates net amount after platform fees',
            'Final amount includes exchange rate conversion',
          ],
        ),
        _TipSection(
          title: 'Best Practices',
          tips: [
            'Save frequent conversions to history',
            'Set your default currency and platform in settings',
            'Check exchange rates regularly',
            'Consider platform fees when pricing your services',
          ],
        ),
        _TipSection(
          title: 'Features',
          tips: [
            'History: View and manage past conversions',
            'Favorites: Star important conversions',
            'Settings: Customize app behavior',
            'Dark Mode: Switch between light and dark themes',
          ],
        ),
      ],
    );
  }
}

class _TipSection extends StatelessWidget {
  final String title;
  final List<String> tips;

  const _TipSection({
    required this.title,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.lightbulb_outline_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...tips.map((tip) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_right, size: 20, color: Color(0xFF00D4FF)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tip,
                          style: GoogleFonts.inter(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
} 