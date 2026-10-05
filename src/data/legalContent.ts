export interface Section {
  title: string;
  paragraphs: string[];
}

export interface Tab {
  id: string;
  label: string;
  slug: string;
  sections: Section[];
}

export const legalSections: Section[] = [
  {
    title: "1. MENTIONS LÉGALES",
    paragraphs: [],
  },
  {
    title: "1.1 Éditeur du site",
    paragraphs: [
      "Le présent site web est édité par :",
      "• Raison sociale / Nom commercial : AGRINNOV",
      "• Forme juridique : Établissement (ETS)",
      "• Siège social : Godomey, Tankpè, Commune d'Abomey-Calavi, Bénin",
      "• Immatriculation : RCCM sous le numéro RB/ABC/21 A 32227 (Cotonou)",
      "• Directeur de la publication : M. Gbetigan C. W. DATONGNON, Gérant.",
    ],
  },
  {
    title: "1.2 Contact",
    paragraphs: [
      "• Par e-mail : contact@agrinnov.tech",
      "• Par téléphone : +229 01 40 79 37 31",
      "• Adresse : Tankpè, Abomey-Calavi, République du Bénin",
    ],
  },
  {
    title: "1.3 Hébergement",
    paragraphs: [
      "Le site est hébergé par Cloudflare, Inc.",
      "• Adresse : 101 Townsend St, San Francisco, CA 94107, USA",
      "• Site web de l'hébergeur : https://cloudflare.com",
    ],
  },
  {
    title: "2. CONDITIONS GÉNÉRALES D'UTILISATION (CGU)",
    paragraphs: [],
  },
  {
    title: "2.1 Propriété intellectuelle",
    paragraphs: [
      "L'ensemble des contenus présents sur le site d'AGRINNOV (textes, graphismes, logos, images, vidéos, icônes, marque AGRINNOV, ainsi que les concepts liés aux services FARE, DiARIS et AGRINNOV Advisory) est la propriété exclusive d'AGRINNOV ou de ses partenaires, et est protégé par les lois relatives à la propriété intellectuelle.",
      "Toute reproduction, représentation, modification, publication, adaptation de tout ou partie des éléments du site est interdite sans autorisation écrite préalable d'AGRINNOV.",
    ],
  },
  {
    title: "2.2 Modalités de Paiement & Services",
    paragraphs: [
      "Le site propose la souscription et le paiement en ligne de services (via des passerelles sécurisées par Mobile Money et cartes bancaires). AGRINNOV ne conserve pas directement les données financières sensibles des utilisateurs.",
    ],
  },
];

export const privacySections: Section[] = [
  {
    title: "3. POLITIQUE DE CONFIDENTIALITÉ",
    paragraphs: [
      "Conformément à la réglementation sur la protection des données personnelles (Loi n° 2017-20 portant Code du Numérique en République du Bénin et standards internationaux en vigueur), AGRINNOV s'engage à préserver la confidentialité, l'intégrité et la sécurité des données collectées auprès de ses utilisateurs et clients.",
    ],
  },
  {
    title: "3.1 Données collectées",
    paragraphs: [
      "Nous collectons des informations personnelles via nos formulaires de contact, d'inscription, de devis et de commande :",
      "• Données d'identification : Nom, prénom, adresse e-mail, numéro de téléphone (WhatsApp).",
      "• Informations professionnelles & d'exploitation : Nom de l'entreprise/ferme, localisation géographique, spéculations cultivées, superficie, besoins agronomiques.",
      "• Données techniques : Adresse IP, données de navigation anonymisées et identifiants techniques liés à l'utilisation du site.",
    ],
  },
  {
    title: "3.2 Finalités de la collecte",
    paragraphs: [
      "Les informations recueillies font l'objet d'un traitement informatique destiné à :",
      "• Traiter et répondre à vos demandes de renseignements, diagnostics, devis ou inscriptions.",
      "• Exécuter nos services opérationnels : analyses de sol NIR (DiARIS), formations agropreneurs (FARE), accompagnement et conseil stratégique (Advisory).",
      "• Assurer la relation client, la gestion administrative, la facturation et le suivi personnalisé.",
      "• Vous informer des actualités, webinaires, programmes d'incubation et innovations développés par AGRINNOV (sous réserve de votre consentement).",
    ],
  },
  {
    title: "3.3 Utilisation des Cookies et Technologies Similaires",
    paragraphs: [
      "Le site utilise des traceurs pour améliorer l'expérience utilisateur et mesurer l'audience :",
      "• Google Analytics : Analyse statistique agrégée de la fréquentation et de l'utilisation du site web.",
      "• Facebook Pixel (Meta) : Mesure de l'efficacité de nos campagnes de sensibilisation et d'acquisition.",
      "Vous pouvez à tout moment configurer votre navigateur pour bloquer ou supprimer ces cookies sans altérer votre accès aux contenus essentiels du site.",
    ],
  },
  {
    title: "3.4 Partage et Confidentialité des Données",
    paragraphs: [
      "AGRINNOV ne vend, ne loue, ni ne cède vos données personnelles à des tiers à des fins commerciales.",
      "Les données peuvent uniquement être transmises à des prestataires techniques de confiance strictement nécessaires au bon fonctionnement de nos services (hébergement sécurisé, passerelles de paiement certifiées, services de messagerie), tous soumis à de strictes obligations de confidentialité.",
    ],
  },
  {
    title: "3.5 Vos Droits et Contact",
    paragraphs: [
      "Conformément au Code du Numérique du Bénin, vous disposez à tout moment d'un droit d'accès, de rectification, de portabilité, d'opposition et de suppression de vos données personnelles.",
      "Pour exercer l'un de ces droits ou pour toute question relative au traitement de vos données, vous pouvez contacter notre équipe à : contact@agrinnov.tech ou par courrier au siège d'AGRINNOV à Godomey Tankpè, Abomey-Calavi.",
    ],
  },
];

export const legalTabs: Tab[] = [
  { id: "mentions-legales", label: "Mentions légales & CGU", slug: "/mentions-legales", sections: legalSections },
  { id: "confidentialite", label: "Politique de confidentialité", slug: "/politique-de-confidentialite", sections: privacySections },
];
