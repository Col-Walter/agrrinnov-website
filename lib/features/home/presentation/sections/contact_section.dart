import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedService = 'DiARIS';
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A0A0A), Color(0xFF111111)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: AppTheme.spacingXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              ScrollReveal(
                child: Column(
                  children: [
                    Text(
                      'CONTACT',
                      style: AppTheme.labelLarge.copyWith(
                        color: AppTheme.green,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Parlons de votre\nprojet agricole',
                      style: AppTheme.displaySmall.copyWith(
                        fontSize: isMobile ? 30 : 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Notre équipe est à votre disposition pour vous accompagner\nvers l\'agriculture de demain.',
                      style: AppTheme.bodyLarge.copyWith(color: AppTheme.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),

              isMobile
                  ? Column(
                      children: [
                        _buildInfo(context),
                        const SizedBox(height: 40),
                        _buildForm(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: _buildInfo(context)),
                        const SizedBox(width: 64),
                        Expanded(flex: 3, child: _buildForm(context)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return ScrollReveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nos coordonnées',
            style: AppTheme.headlineLarge.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 32),
          _ContactInfoItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'contact@agrinnov.tech',
            color: AppTheme.green,
          ),
          const SizedBox(height: 20),
          _ContactInfoItem(
            icon: Icons.phone_outlined,
            label: 'Téléphone',
            value: '+229 01 40 79 37 31',
            color: AppTheme.orange,
          ),
          const SizedBox(height: 20),
          _ContactInfoItem(
            icon: Icons.location_on_outlined,
            label: 'Siège social',
            value: 'Godomey, Tankpè, Abomey-Calavi, Bénin',
            color: AppTheme.yellow,
          ),
          const SizedBox(height: 40),

          // Services list
          Text(
            'Nos services',
            style: AppTheme.headlineMedium.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ...[
            ('DiARIS', AppTheme.green, 'Agronomie de précision'),
            ('FARE', AppTheme.yellow, 'Incubateur agropreneurs'),
            ('Advisory', AppTheme.orange, 'Conseil agro-management'),
          ].map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: s.$2,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.$1,
                            style: AppTheme.labelMedium.copyWith(
                              color: s.$2,
                              fontSize: 14,
                            )),
                        Text(s.$3, style: AppTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return ScrollReveal(
      delay: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(color: AppTheme.greyBorder),
        ),
        child: _submitted
            ? _buildSuccessState()
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Envoyez-nous un message',
                      style: AppTheme.headlineMedium,
                    ),
                    const SizedBox(height: 28),

                    Row(
                      children: [
                        Expanded(
                          child: _FormField(
                            controller: _nameController,
                            label: 'Nom complet',
                            hint: 'Votre nom',
                            validator: (v) =>
                                v!.isEmpty ? 'Requis' : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _FormField(
                            controller: _emailController,
                            label: 'Email',
                            hint: 'votre@email.com',
                            validator: (v) {
                              if (v!.isEmpty) return 'Requis';
                              if (!v.contains('@')) return 'Email invalide';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Service selector
                    Text(
                      'Service concerné',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: ['DiARIS', 'FARE', 'Advisory', 'Général']
                          .map((s) {
                        final selected = _selectedService == s;
                        final color = s == 'DiARIS'
                            ? AppTheme.green
                            : s == 'FARE'
                                ? AppTheme.yellow
                                : s == 'Advisory'
                                    ? AppTheme.orange
                                    : AppTheme.grey;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => _selectedService = s),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: selected
                                    ? color.withOpacity(0.15)
                                    : Colors.transparent,
                                border: Border.all(
                                  color:
                                      selected ? color : AppTheme.greyBorder,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                s,
                                style: AppTheme.bodySmall.copyWith(
                                  color: selected ? color : AppTheme.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    _FormField(
                      controller: _messageController,
                      label: 'Message',
                      hint:
                          'Décrivez votre projet ou votre question...',
                      maxLines: 4,
                      validator: (v) => v!.isEmpty ? 'Requis' : null,
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      child: _SubmitButton(onTap: _submit),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildSuccessState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.greenGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.green.withOpacity(0.4),
                    blurRadius: 30,
                  )
                ],
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 24),
            Text('Message envoyé !', style: AppTheme.headlineLarge),
            const SizedBox(height: 12),
            Text(
              'Notre équipe vous répondra dans les 24 heures.',
              style: AppTheme.bodyLarge.copyWith(color: AppTheme.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ContactInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: AppTheme.bodySmall.copyWith(color: AppTheme.grey)),
            Text(value,
                style: AppTheme.headlineMedium.copyWith(fontSize: 15)),
          ],
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final int maxLines;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.grey,
              fontSize: 13,
            )),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: AppTheme.bodyMedium.copyWith(color: AppTheme.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.bodySmall.copyWith(color: AppTheme.grey),
            filled: true,
            fillColor: AppTheme.surfaceLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              borderSide: const BorderSide(color: AppTheme.greyBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              borderSide: const BorderSide(color: AppTheme.greyBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              borderSide: const BorderSide(color: AppTheme.green, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final VoidCallback onTap;
  const _SubmitButton({required this.onTap});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
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
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            gradient: _hovered ? AppTheme.greenGradient : AppTheme.greenGradient,
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.green.withOpacity(0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Envoyer le message',
                style: AppTheme.labelLarge.copyWith(fontSize: 16),
              ),
              const SizedBox(width: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()
                  ..translate(_hovered ? 4.0 : 0.0),
                child: const Icon(Icons.send_outlined,
                    color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
