"use client";

import { useState } from "react";

interface Tab {
  label: string;
  sections: Section[];
}

interface Section {
  title: string;
  paragraphs: string[];
}

const legalSections: Section[] = [
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
    ],
  },
  {
    title: "1.3 Hébergement",
    paragraphs: [
      "Le site est hébergé par Cloudflare, Inc.",
      "• Site web de l'hébergeur : https://cloudflare.com",
    ],
  },
  {
    title: "2. CONDITIONS GÉNÉRALES D'UTILISATION",
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
    title: "2.2 Modalités de Paiement",
    paragraphs: [
      "Le site propose la souscription et le paiement en ligne de services (via des passerelles sécurisées par Mobile Money). AGRINNOV ne conserve pas directement les données financières sensibles des utilisateurs.",
    ],
  },
];

const privacySections: Section[] = [
  {
    title: "3. POLITIQUE DE CONFIDENTIALITÉ",
    paragraphs: [
      "Conformément à la réglementation sur la protection des données personnelles (Code du Numérique du Bénin et standards internationaux), AGRINNOV s'engage à préserver la confidentialité des données collectées.",
    ],
  },
  {
    title: "3.1 Données collectées",
    paragraphs: [
      "Nous collectons des informations personnelles via nos formulaires de contact, d'inscription et de commande :",
      "• Identité : Nom, prénom, e-mail, téléphone.",
      "• Informations professionnelles : Nom de l'entreprise/ferme, localisation, spéculations cultivées.",
    ],
  },
  {
    title: "3.2 Finalité de la collecte",
    paragraphs: [
      "• Traiter vos demandes de renseignements, devis ou inscriptions.",
      "• Exécuter nos services (Analyses DiARIS, Formations FARE, Accompagnement Conseil).",
      "• Assurer la gestion de la relation client, la facturation et le suivi.",
    ],
  },
  {
    title: "3.3 Utilisation des Cookies",
    paragraphs: [
      "• Google Analytics : Analyse statistique de la fréquentation et de l'utilisation du site web.",
      "• Facebook Pixel : Mesure de l'efficacité des campagnes publicitaires.",
      "Vous pouvez configurer votre navigateur pour refuser tout ou partie des cookies.",
    ],
  },
  {
    title: "3.4 Vos Droits",
    paragraphs: [
      "Vous disposez d'un droit d'accès, de rectification, d'opposition et de suppression des données vous concernant.",
      "Pour exercer ce droit, contactez-nous à : contact@agrinnov.tech.",
    ],
  },
];

const tabs: Tab[] = [
  { label: "Mentions légales & CGU", sections: legalSections },
  { label: "Politique de confidentialité", sections: privacySections },
];

interface LegalModalProps {
  initialTab?: number;
  onClose: () => void;
}

export default function LegalModal({ initialTab = 0, onClose }: LegalModalProps) {
  const [activeTab, setActiveTab] = useState(initialTab);

  return (
    <div
      className="fixed inset-0 z-[100] flex items-center justify-center p-4 md:p-12"
      style={{ background: "rgba(0,0,0,0.87)" }}
      onClick={onClose}
    >
      <div
        className="w-full max-w-[860px] max-h-[780px] flex flex-col rounded-3xl border border-[#2E2E2E] overflow-hidden"
        style={{ background: "#111111" }}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="px-7 pt-6 pb-0 border-b border-[#2E2E2E]">
          <div className="flex items-center justify-between mb-4">
            <h2
              className="font-[family-name:var(--font-jakarta)] font-bold text-xl text-white"
            >
              Informations légales
            </h2>
            <button
              onClick={onClose}
              className="text-[#8A8A8A] hover:text-white transition-colors text-2xl leading-none w-8 h-8 flex items-center justify-center"
            >
              ×
            </button>
          </div>
          {/* Tabs */}
          <div className="flex gap-6">
            {tabs.map((tab, i) => (
              <button
                key={i}
                onClick={() => setActiveTab(i)}
                className="pb-3 text-sm font-[family-name:var(--font-jakarta)] font-semibold transition-colors duration-200 border-b-2"
                style={{
                  color: activeTab === i ? "#1FA34A" : "#8A8A8A",
                  borderColor: activeTab === i ? "#1FA34A" : "transparent",
                }}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        {/* Content */}
        <div className="overflow-y-auto flex-1 p-7">
          {tabs[activeTab].sections.map((section, i) => (
            <div key={i} className="mb-7">
              {section.title && (
                <h3 className="text-[#1FA34A] font-[family-name:var(--font-jakarta)] font-semibold text-base mb-2">
                  {section.title}
                </h3>
              )}
              {section.paragraphs.map((p, j) => (
                <p key={j} className="text-sm text-[#CCCCCC] leading-[1.7] mb-2">
                  {p}
                </p>
              ))}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
