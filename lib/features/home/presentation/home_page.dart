import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/footer_widget.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/stats_section.dart';
import 'sections/services_section.dart';
import 'sections/vision_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToContact = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (args == 'contact' && !_hasScrolledToContact) {
          _hasScrolledToContact = true;
          _scrollToKey(_contactKey);
        } else if (args == 'services') {
          _scrollToKey(_servicesKey);
        } else if (args == 'vision') {
          _scrollToKey(_visionKey);
        } else if (args == 'home') {
          _scrollToKey(_homeKey);
        }
      });
    }
  }

  // Section keys for navigation
  final _homeKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _visionKey = GlobalKey();
  final _contactKey = GlobalKey();

  List<GlobalKey> get _sectionKeys =>
      [_homeKey, _servicesKey, _visionKey, _contactKey];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for navbar height
                const SizedBox(height: 0),

                // HERO
                Container(key: _homeKey,
                  child: HeroSection(
                    onDiscoverServices: () => _scrollToKey(_servicesKey),
                    onVision: () => _scrollToKey(_visionKey),
                  ),
                ),

                // STATS
                const StatsSection(),

                // SERVICES (3 piliers)
                Container(key: _servicesKey,
                  child: const ServicesSection(),
                ),

                // VISION
                Container(key: _visionKey,
                  child: const VisionSection(),
                ),


                // CONTACT
                Container(key: _contactKey,
                  child: const ContactSection(),
                ),

                // FOOTER
                FooterWidget(
                  onNavigationSelected: (target) {
                    if (target == 'home') {
                      _scrollToKey(_homeKey);
                    } else if (target == 'services') {
                      _scrollToKey(_servicesKey);
                    } else if (target == 'vision') {
                      _scrollToKey(_visionKey);
                    } else if (target == 'contact') {
                      _scrollToKey(_contactKey);
                    }
                  },
                ),
              ],
            ),
          ),

          // Sticky Navbar (on top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarSection(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToKey(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }
}
