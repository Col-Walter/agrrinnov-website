import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ServiceHeader extends StatelessWidget implements PreferredSizeWidget {
  const ServiceHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  void _goHome(BuildContext context, {String? targetSection}) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(targetSection);
    } else {
      Navigator.of(context).pushReplacementNamed('/', arguments: targetSection);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.85),
            border: const Border(
              bottom: BorderSide(color: AppTheme.greyBorder, width: 1),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.sectionPadding(context),
          ),
          child: Row(
            children: [
              // Back Button
              TextButton.icon(
                onPressed: () => _goHome(context),
                icon: const Icon(Icons.arrow_back, color: AppTheme.green, size: 20),
                label: isMobile
                    ? const SizedBox.shrink()
                    : Text(
                        'Accueil',
                        style: AppTheme.labelLarge.copyWith(
                          color: AppTheme.white,
                          fontSize: 14,
                        ),
                      ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppTheme.greyBorder.withOpacity(0.5)),
                  ),
                ),
              ),
              const Spacer(),

              // Logo in the center/right
              GestureDetector(
                onTap: () => _goHome(context),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Image.asset(
                    'assets/images/logo_principal.png',
                    height: 58,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),

              const Spacer(),

              // Contact CTA button
              ElevatedButton(
                onPressed: () => _goHome(context, targetSection: 'contact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.orange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Nous Contacter',
                  style: AppTheme.labelLarge.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
