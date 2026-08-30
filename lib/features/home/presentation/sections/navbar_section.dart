import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NavbarSection extends StatefulWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavbarSection({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<NavbarSection> createState() => _NavbarSectionState();
}

class _NavbarSectionState extends State<NavbarSection> {
  bool _isScrolled = false;
  bool _mobileMenuOpen = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 60;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  void _scrollToSection(int index) {
    if (index < widget.sectionKeys.length) {
      final ctx = widget.sectionKeys[index].currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
    setState(() => _mobileMenuOpen = false);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppTheme.black.withOpacity(0.92)
            : Colors.transparent,
        boxShadow: _isScrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)]
            : [],
        border: _isScrolled
            ? Border(
                bottom: BorderSide(
                  color: AppTheme.greyBorder.withOpacity(0.5), width: 1))
            : null,
      ),
      child: ClipRect(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.sectionPadding(context),
            vertical: _isScrolled ? 12 : 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Logo
                  GestureDetector(
                    onTap: () => _scrollToSection(0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Image.asset(
                        'assets/images/logo_principal.png',
                        height: 70,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (!isMobile) ...[
                    _NavItem('Accueil', () => _scrollToSection(0)),
                    _NavItem('Nos Services', () => _scrollToSection(1)),
                    _NavItem('Vision', () => _scrollToSection(2)),
                    _NavItem('Contact', () => _scrollToSection(3)),
                    const SizedBox(width: 24),
                    _CTAButton('Prendre contact', () => _scrollToSection(3)),
                  ] else
                    IconButton(
                      onPressed: () =>
                          setState(() => _mobileMenuOpen = !_mobileMenuOpen),
                      icon: Icon(
                        _mobileMenuOpen ? Icons.close : Icons.menu,
                        color: AppTheme.white,
                      ),
                    ),
                ],
              ),
              if (isMobile && _mobileMenuOpen) ...[
                const SizedBox(height: 16),
                _MobileMenu(onTap: _scrollToSection),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem(this.label, this.onTap);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: _hovered ? AppTheme.green : AppTheme.grey,
              fontWeight: _hovered ? FontWeight.w600 : FontWeight.w400,
              fontSize: 15,
              fontFamily: 'Plus Jakarta Sans',
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _CTAButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _CTAButton(this.label, this.onTap);

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: _hovered
                ? AppTheme.orangeGradient
                : const LinearGradient(
                    colors: [AppTheme.orange, AppTheme.orange]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.orange.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: AppTheme.labelLarge.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final Function(int) onTap;
  const _MobileMenu({required this.onTap});

  @override
  Widget build(BuildContext context) {
    const items = ['Accueil', 'Nos Services', 'Vision', 'Contact'];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.greyBorder),
      ),
      child: Column(
        children: items.asMap().entries.map((e) {
          return InkWell(
            onTap: () => onTap(e.key),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Text(e.value,
                      style: AppTheme.bodyLarge.copyWith(color: AppTheme.white)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,
                      size: 14, color: AppTheme.grey),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
