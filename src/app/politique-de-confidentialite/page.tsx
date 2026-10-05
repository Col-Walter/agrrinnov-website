import type { Metadata } from "next";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import ShareBar from "@/components/ShareBar";
import { privacySections } from "@/data/legalContent";

const PAGE_URL = "https://agrinnov.tech/politique-de-confidentialite/";

export const metadata: Metadata = {
  title: "Politique de Confidentialité — Agrinnov",
  description:
    "Consultez la politique de confidentialité et de protection des données personnelles d'Agrinnov, conformément au Code du Numérique du Bénin.",
  keywords: [
    "politique de confidentialité agrinnov",
    "protection des données bénin",
    "code du numérique bénin",
    "vie privée agrinnov",
    "confidentialité agriculture bénin",
  ],
  alternates: {
    canonical: PAGE_URL,
  },
  openGraph: {
    title: "Politique de Confidentialité — Agrinnov",
    description:
      "Engagement d'Agrinnov pour la protection et la confidentialité de vos données personnelles et agronomiques.",
    url: PAGE_URL,
    type: "website",
    locale: "fr_BJ",
    images: [
      {
        url: "/images/og-image.png",
        width: 1200,
        height: 630,
        alt: "Agrinnov — Politique de Confidentialité",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Politique de Confidentialité — Agrinnov",
    description:
      "Engagement d'Agrinnov pour la protection et la confidentialité de vos données personnelles et agronomiques.",
    images: ["/images/og-image.png"],
  },
};

const jsonLd = {
  "@context": "https://schema.org",
  "@type": "WebPage",
  name: "Politique de Confidentialité — Agrinnov",
  description:
    "Politique de protection des données à caractère personnel d'Agrinnov, conforme au Code du Numérique du Bénin.",
  url: PAGE_URL,
  publisher: {
    "@type": "Organization",
    name: "Agrinnov",
    url: "https://agrinnov.tech",
    logo: "https://agrinnov.tech/images/logo_principal.png",
  },
};

export default function PrivacyPolicyPage() {
  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <Navbar />

      <main className="min-h-screen bg-[#111111] text-white pt-28 md:pt-36 pb-20">
        <div className="max-w-[920px] mx-auto px-6 md:px-12">
          {/* Breadcrumb */}
          <nav aria-label="Fil d'Ariane" className="mb-6">
            <ol className="flex items-center gap-2 text-xs text-[#8A8A8A] font-[family-name:var(--font-jakarta)]">
              <li>
                <Link href="/" className="hover:text-white transition-colors">
                  Accueil
                </Link>
              </li>
              <li>/</li>
              <li className="text-[#27C55B] font-medium" aria-current="page">
                Politique de Confidentialité
              </li>
            </ol>
          </nav>

          {/* Page Header */}
          <header className="mb-8">
            <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#27C55B] bg-[#1FA34A]/10 border border-[#1FA34A]/30 mb-4">
              <span className="w-2 h-2 rounded-full bg-[#1FA34A]" />
              Protection des Données & Vie Privée
            </div>
            <h1 className="font-[family-name:var(--font-jakarta)] font-extrabold text-3xl sm:text-4xl md:text-5xl tracking-tight text-white mb-4">
              Politique de Confidentialité
            </h1>
            <p className="text-sm md:text-base text-[#8A8A8A] leading-relaxed max-w-2xl">
              Cette politique décrit la manière dont Agrinnov collecte, traite et protège vos données personnelles conformément à la réglementation en vigueur en République du Bénin.
            </p>
            <div className="flex items-center gap-3 mt-4 text-xs text-[#666666]">
              <span>Dernière mise à jour : 2026</span>
              <span>•</span>
              <span>Temps de lecture estimé : 3 min</span>
            </div>
          </header>

          {/* Interactive Share / Action Bar */}
          <ShareBar
            pageUrl={PAGE_URL}
            pageTitle="Politique de Confidentialité — Agrinnov"
            alternateSlug="/mentions-legales"
            alternateLabel="Mentions Légales & CGU"
          />

          {/* Privacy Content Sections */}
          <div className="flex flex-col gap-8">
            {privacySections.map((section, idx) => (
              <section
                key={idx}
                className="p-6 md:p-8 rounded-3xl bg-[#171717] border border-[#262626] transition-all hover:border-[#333333]"
              >
                {section.title && (
                  <h2 className="text-[#1FA34A] font-[family-name:var(--font-jakarta)] font-bold text-lg md:text-xl mb-4 flex items-center gap-2">
                    {section.title}
                  </h2>
                )}
                <div className="flex flex-col gap-3">
                  {section.paragraphs.map((p, pIdx) => (
                    <p
                      key={pIdx}
                      className="text-sm md:text-[15px] text-[#D1D1D1] leading-[1.8]"
                    >
                      {p}
                    </p>
                  ))}
                </div>
              </section>
            ))}

            {/* Direct Contact & DPO Card */}
            <section className="p-6 md:p-8 rounded-3xl bg-gradient-to-br from-[#18261C] to-[#121A14] border border-[#1FA34A]/30">
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-xl text-white mb-2">
                Une question sur vos données personnelles ?
              </h2>
              <p className="text-sm text-[#AAAAAA] leading-relaxed mb-6">
                Pour toute demande d'exercice de vos droits (accès, rectification, effacement) ou pour signaler une préoccupation relative à vos données, contactez notre équipe dédiée :
              </p>
              <div className="flex flex-wrap items-center gap-4">
                <a
                  href="mailto:contact@agrinnov.tech"
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white bg-[#1FA34A] hover:bg-[#27C55B] transition-colors"
                >
                  <span>✉️ Écrire à contact@agrinnov.tech</span>
                </a>
                <a
                  href="https://wa.me/22940793731"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-[#CCCCCC] bg-[#222222] hover:bg-[#2A2A2A] border border-[#333333] transition-colors"
                >
                  <span>💬 WhatsApp : +229 01 40 79 37 31</span>
                </a>
              </div>
            </section>
          </div>
        </div>
      </main>

      <Footer />
    </>
  );
}
