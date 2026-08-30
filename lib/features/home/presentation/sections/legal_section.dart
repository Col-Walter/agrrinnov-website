import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Shows the legal notice modal dialog.
void showLegalModal(BuildContext context, {bool showPrivacy = false}) {
  showDialog(
    context: context,
    barrierColor: Colors.black87,
    builder: (ctx) => LegalModal(initialTab: showPrivacy ? 1 : 0),
  );
}

class LegalModal extends StatefulWidget {
  final int initialTab;
  const LegalModal({super.key, this.initialTab = 0});

  @override
  State<LegalModal> createState() => _LegalModalState();
}

class _LegalModalState extends State<LegalModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 48,
        vertical: isMobile ? 24 : 48,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 860, maxHeight: 780),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(color: AppTheme.greyBorder),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(28, 24, 16, 0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppTheme.greyBorder),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Informations légales',
                          style: AppTheme.headlineLarge.copyWith(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close, color: AppTheme.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppTheme.green,
                    labelColor: AppTheme.green,
                    unselectedLabelColor: AppTheme.grey,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'Mentions légales & CGU'),
                      Tab(text: 'Politique de confidentialité'),
                    ],
                  ),
                ],
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _LegalContent(sections: _legalSections),
                  _LegalContent(sections: _privacySections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegalContent extends StatelessWidget {
  final List<_LegalSection> sections;
  const _LegalContent({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sections.map((s) => _LegalSectionWidget(section: s)).toList(),
      ),
    );
  }
}

class _LegalSectionWidget extends StatelessWidget {
  final _LegalSection section;
  const _LegalSectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (section.title.isNotEmpty) ...[
            Text(
              section.title,
              style: AppTheme.headlineMedium.copyWith(
                color: AppTheme.green,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
          ],
          ...section.paragraphs.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  p,
                  style: AppTheme.bodyMedium.copyWith(
                    color: const Color(0xFFCCCCCC),
                    height: 1.7,
                    fontSize: 14,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class _LegalSection {
  final String title;
  final List<String> paragraphs;
  const _LegalSection(this.title, this.paragraphs);
}

// ============================================================
// CONTENT: MENTIONS LÉGALES & CGU
// ============================================================
const _legalSections = [
  _LegalSection('1. MENTIONS LÉGALES', []),
  _LegalSection('1.1 Éditeur du site', [
    'Le présent site web, accessible à l\'adresse www.agrinnov.tech (ou tout autre domaine affilié), est édité par :',
    '• Raison sociale / Nom commercial : AGRINNOV',
    '• Forme juridique : Établissement (ETS)',
    '• Siège social : Godomey, Tankpè, Commune d\'Abomey-Calavi, Bénin',
    '• Immatriculation : Immatriculée au Registre du Commerce et du Crédit Mobilier (RCCM) sous le numéro RB/ABC/21 A 32227 (Cotonou)',
    '• Directeur de la publication : M. Gbetigan C. W. DATONGNON, en sa qualité de Gérant.',
  ]),
  _LegalSection('1.2 Contact', [
    'Pour toute question ou demande d\'information concernant le site ou les services offerts :',
    '• Par e-mail : contact@agrinnov.tech',
    '• Par téléphone : +229 01 40 79 37 31',
  ]),
  _LegalSection('1.3 Hébergement', [
    'Le site est hébergé par la plateforme cloud Google Firebase :',
    '• Hébergeur : Google LLC / Google Ireland Limited',
    '• Adresse de l\'hébergeur : Gordon House, Barrow Street, Dublin 4, Irlande',
    '• Site web de l\'hébergeur : https://firebase.google.com',
  ]),
  _LegalSection('2. CONDITIONS GÉNÉRALES D\'UTILISATION (CGU)', []),
  _LegalSection('2.1 Propriété intellectuelle', [
    'L\'ensemble des contenus présents sur le site d\'AGRINNOV (textes, graphismes, logos, images, vidéos, icônes, architecture, bases de données, marque AGRINNOV, ainsi que les concepts et visuels liés aux services FARE, DiARIS et AGRINNOV Advisory) est la propriété exclusive d\'AGRINNOV ou de ses partenaires, et est protégé par les lois relatives à la propriété intellectuelle.',
    'Toute reproduction, représentation, modification, publication, adaptation de tout ou partie des éléments du site, quel que soit le moyen ou le procédé utilisé, est interdite, sauf autorisation écrite préalable d\'AGRINNOV.',
  ]),
  _LegalSection('2.2 Modalités de Paiement', [
    'Le site propose la souscription et le paiement direct en ligne de services/prestations (notamment via des passerelles de paiement sécurisées par Mobile Money).',
    'Les transactions financières sont sécurisées et exécutées par nos prestataires de paiement agréés. AGRINNOV ne conserve pas directement les données financières sensibles des utilisateurs.',
  ]),
];

// ============================================================
// CONTENT: POLITIQUE DE CONFIDENTIALITÉ
// ============================================================
const _privacySections = [
  _LegalSection('3. POLITIQUE DE CONFIDENTIALITÉ ET DE PROTECTION DES DONNÉES', [
    'Conformément à la réglementation sur la protection des données personnelles (notamment le Code du Numérique en République du Bénin et les standards internationaux), AGRINNOV s\'engage à préserver la confidentialité des données collectées.',
  ]),
  _LegalSection('3.1 Données collectées', [
    'Nous collectons des informations personnelles lorsque vous utilisez nos formulaires de contact, d\'inscription aux formations ou de commande de services (diagnostic, conseil) :',
    '• Informations d\'identification : Nom, prénom, adresse e-mail, numéro de téléphone.',
    '• Informations professionnelles/agronomiques : Nom de l\'entreprise/ferme, localisation géographique, spéculations cultivées, détails sur l\'exploitation.',
  ]),
  _LegalSection('3.2 Finalité de la collecte', [
    'Les données collectées sont utilisées pour :',
    '• Traiter vos demandes de renseignements, devis ou inscriptions.',
    '• Exécuter la fourniture de nos services (Analyses DiARIS, Formations FARE, Accompagnement Conseil).',
    '• Assurer la gestion de la relation client, la facturation et le suivi.',
    '• Envoyer des communications d\'information ou des offres promotionnelles (si vous y avez consenti).',
  ]),
  _LegalSection('3.3 Utilisation des Cookies et Traçage', [
    'Le site utilise des cookies et technologies de suivi tiers pour améliorer l\'expérience utilisateur et mesurer l\'audience :',
    '• Google Analytics : Analyse statistique de la fréquentation et de l\'utilisation du site web.',
    '• Facebook Pixel (Meta) : Mesure de l\'efficacité des campagnes publicitaires et ciblage pertinent sur les réseaux sociaux.',
    'Vous pouvez configurer votre navigateur internet pour refuser tout ou partie des cookies.',
  ]),
  _LegalSection('3.4 Vos Droits (Accès, Rectification, Suppression)', [
    'Conformément à la loi, vous disposez d\'un droit d\'accès, de rectification, d\'opposition et de suppression des données personnelles vous concernant.',
    'Pour exercer ce droit, il vous suffit de contacter le responsable du traitement des données par e-mail à : contact@agrinnov.tech.',
  ]),
];
