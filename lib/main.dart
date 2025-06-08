import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/platform_config.dart';
import 'widgets/responsive_layout.dart';
import 'screens/converter_screen.dart';
import 'screens/history_screen.dart';
import 'screens/tips_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/terms_screen.dart';
import 'screens/contact_screen.dart';
import 'services/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final settingsProvider = FutureProvider<SettingsService>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return SettingsService(prefs);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final settingsService = SettingsService(prefs);
  runApp(
    ProviderScope(
      child: DollarioApp(settingsService: settingsService),
    ),
  );
}

class DollarioApp extends ConsumerStatefulWidget {
  final SettingsService settingsService;
  const DollarioApp({super.key, required this.settingsService});
  @override
  ConsumerState<DollarioApp> createState() => _DollarioAppState();
}

class _DollarioAppState extends ConsumerState<DollarioApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        final settingsAsync = ref.watch(settingsProvider);
        return settingsAsync.when(
          data: (settings) {
            final isDarkMode = settings.themeMode == 'dark';
            return MaterialApp(
              title: 'Dollario',
              theme: _buildLightTheme(),
              darkTheme: _buildDarkTheme(),
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: FadeTransition(
                opacity: _fadeAnimation,
                child: const MainScaffold(),
              ),
            );
          },
          loading: () => MaterialApp(
            theme: _buildDarkTheme(),
            home: const Scaffold(
              backgroundColor: Color(0xFF0A0A0A),
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF00D4FF),
                ),
              ),
            ),
          ),
          error: (error, stack) => MaterialApp(
            theme: _buildDarkTheme(),
            home: Scaffold(
              backgroundColor: const Color(0xFF0A0A0A),
              body: Center(
                child: Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF00D4FF),
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212), // Dark Charcoal
      cardColor: const Color(0xFF1E1E2F), // Midnight Blue
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E2F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // XL radius
          borderSide: BorderSide(color: const Color(0xFF00897B).withOpacity(0.2)),
        ),
        labelStyle: GoogleFonts.inter(color: const Color(0xFFB0BEC5)), // Platinum Gray
        hintStyle: GoogleFonts.inter(color: const Color(0xFFB0BEC5)),
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData(brightness: Brightness.dark).textTheme).copyWith(
        bodyLarge: GoogleFonts.inter(color: const Color(0xFFECEFF1)), // Ivory White
        bodyMedium: GoogleFonts.inter(color: const Color(0xFFB0BEC5)), // Platinum Gray
        titleMedium: GoogleFonts.inter(color: const Color(0xFFECEFF1)),
        titleLarge: GoogleFonts.inter(color: const Color(0xFFECEFF1)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFECEFF1)),
        titleTextStyle: TextStyle(color: Color(0xFFECEFF1), fontSize: 20, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF00FFFF)), // Electric Cyan for icons
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF00897B), // Royal Teal
        secondary: Color(0xFF00FFFF), // Electric Cyan
        surface: Color(0xFF1E1E2F), // Midnight Blue
        background: Color(0xFF121212), // Dark Charcoal
        onPrimary: Color(0xFFECEFF1), // Ivory White
        onSecondary: Color(0xFFB0BEC5), // Platinum Gray
        error: Color(0xFFFF5252), // Error Red
        onError: Color(0xFFECEFF1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00897B), // Royal Teal
          foregroundColor: const Color(0xFFECEFF1), // Ivory White
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: const Color(0xFF00897B).withOpacity(0.3),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF1E1E2F),
        contentTextStyle: TextStyle(color: Color(0xFFECEFF1)),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      dialogBackgroundColor: const Color(0xFF1E1E2F),
      dividerColor: const Color(0xFF00897B).withOpacity(0.2),
      highlightColor: const Color(0xFFFFD700), // Gold
      splashColor: const Color(0xFF00FFFF).withOpacity(0.1), // Electric Cyan
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _bottomNavController;
  late Animation<double> _bottomNavAnimation;

  final List<Widget> _screens = [
    const ConverterScreen(),
    const HistoryScreen(),
  ];

  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  void initState() {
    super.initState();
    _bottomNavController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _bottomNavAnimation = CurvedAnimation(
      parent: _bottomNavController,
      curve: Curves.easeInOut,
    );
    _bottomNavController.forward();
  }

  @override
  void dispose() {
    _bottomNavController.dispose();
    super.dispose();
  }

  void _onDrawerItemTap(int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(_createRoute(const TipsScreen()));
        break;
      case 1:
        Navigator.of(context).push(_createRoute(const SettingsScreen()));
        break;
      case 2:
        Navigator.of(context).push(_createRoute(const AboutScreen()));
        break;
      case 3:
        Navigator.of(context).push(_createRoute(const PrivacyPolicyScreen()));
        break;
      case 4:
        Navigator.of(context).push(_createRoute(const TermsScreen()));
        break;
      case 5:
        Navigator.of(context).push(_createRoute(const ContactScreen()));
        break;
    }
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: DrawerMenu(onItemTap: _onDrawerItemTap),
      mainScreen: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
                ).createShader(bounds),
                child: Text(
                  'Dollario',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
                onPressed: () => _drawerController.toggle?.call(),
              ),
              actions: [],
            ),
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xFF00D4FF).withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: SalomonBottomBar(
                backgroundColor: Colors.transparent,
                currentIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.currency_exchange_rounded),
                    title: Text('Convert', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                    selectedColor: const Color(0xFF00D4FF),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.history_rounded),
                    title: Text('History', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                    selectedColor: const Color(0xFF6C5CE7),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final void Function(int) onItemTap;
  const DrawerMenu({required this.onItemTap, super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.lightbulb_outline, 'title': 'Tips', 'gradient': [0xFF00D4FF, 0xFF0099CC]},
      {'icon': Icons.settings_outlined, 'title': 'Settings', 'gradient': [0xFF6C5CE7, 0xFF5A4FCF]},
      {'icon': Icons.info_outline, 'title': 'About', 'gradient': [0xFF4ECDC4, 0xFF44A08D]},
      {'icon': Icons.privacy_tip_outlined, 'title': 'Privacy Policy', 'gradient': [0xFFFF6B6B, 0xFFEE5A24]},
      {'icon': Icons.article_outlined, 'title': 'Terms of Service', 'gradient': [0xFFFFA726, 0xFFFF8F00]},
      {'icon': Icons.contact_mail_outlined, 'title': 'Contact', 'gradient': [0xFF9C27B0, 0xFF7B1FA2]},
    ];

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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00D4FF).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
                      ).createShader(bounds),
                      child: Text(
                        'Menu',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explore currency features',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              // Menu Items
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    final gradientColors = item['gradient'] as List<int>?;

                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 500 + (index * 100)),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(30 * (1 - value), 0),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors != null && gradientColors.length >= 2
                                    ? [
                                  Color(gradientColors[0]),
                                  Color(gradientColors[1]),
                                ]
                                    : [
                                  const Color(0xFF00D4FF),
                                  const Color(0xFF6C5CE7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            item['title'] as String,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white.withOpacity(0.5),
                            size: 16,
                          ),
                          onTap: () => onItemTap(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Footer
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.currency_exchange,
                        color: Color(0xFF00D4FF),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dollario',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'v1.0.0',
                          style: GoogleFonts.inter(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}