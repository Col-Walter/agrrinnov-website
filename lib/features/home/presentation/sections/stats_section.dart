import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      color: const Color(0xFF0F1F14),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Divider with label
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: AppTheme.greyBorder),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'NOS RÉSULTATS',
                      style: AppTheme.labelMedium.copyWith(
                        color: AppTheme.green,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(height: 1, color: AppTheme.greyBorder),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              isMobile
                  ? Column(
                      children: _buildStats()
                          .map((w) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: w,
                              ))
                          .toList(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _buildStats().map((w) => Expanded(child: Center(child: w))).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStats() {
    return [
      const AnimatedCounter(
        endValue: 6,
        suffix: '',
        label: 'Entrepreneurs\naccompagnés',
        color: AppTheme.green,
      ),
      const _Divider(),
      const AnimatedCounter(
        endValue: 5,
        suffix: '+',
        label: 'Années\nd\'existence',
        color: AppTheme.orange,
      ),
      const _Divider(),
      const AnimatedCounter(
        endValue: 98,
        suffix: '%',
        label: 'Taux de\nsatisfaction',
        color: AppTheme.yellow,
      ),
      const _Divider(),
      const AnimatedCounter(
        endValue: 10,
        suffix: '+',
        label: 'Élèves formés\nFARE',
        color: AppTheme.green,
      ),
    ];
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    if (AppTheme.isMobile(context)) return const SizedBox.shrink();
    return Container(width: 1, height: 80, color: AppTheme.greyBorder);
  }
}
