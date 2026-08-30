import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_page.dart';
import 'features/services/presentation/pages/diaris_page.dart';
import 'features/services/presentation/pages/fare_page.dart';
import 'features/services/presentation/pages/advisory_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const AgrinnovApp());
}

class AgrinnovApp extends StatelessWidget {
  const AgrinnovApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrinnov — Innovation Agricole',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      scrollBehavior: const _CustomScrollBehavior(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/diaris': (context) => const DiarisPage(),
        '/fare': (context) => const FarePage(),
        '/advisory': (context) => const AdvisoryPage(),
      },
    );
  }
}

// Enable smooth scrolling on web with mouse and trackpad
class _CustomScrollBehavior extends MaterialScrollBehavior {
  const _CustomScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
