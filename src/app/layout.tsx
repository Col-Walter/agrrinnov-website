import type { Metadata } from "next";
import { Plus_Jakarta_Sans, Outfit } from "next/font/google";
import "./globals.css";

const jakarta = Plus_Jakarta_Sans({
  subsets: ["latin"],
  weight: ["400", "600", "700", "800"],
  variable: "--font-jakarta",
  display: "swap",
});

const outfit = Outfit({
  subsets: ["latin"],
  weight: ["400", "600"],
  variable: "--font-outfit",
  display: "swap",
});

const BASE_URL = "https://agrinnov.tech";

export const metadata: Metadata = {
  metadataBase: new URL(BASE_URL),

  /* ── Titre & Description ───────────────────────────────────────── */
  title: {
    default: "Agrinnov — L'innovation au cœur de l'agriculture de demain",
    template: "%s | Agrinnov",
  },
  description:
    "Agrinnov est le hub d'agriculture intelligente au Bénin. Découvrez DiARIS (agronomie de précision par IA), FARE (incubateur agropreneurs) et Advisory (conseil en agro-management).",

  /* ── Mots-clés ─────────────────────────────────────────────────── */
  keywords: [
    "agrinnov",
    "agriculture bénin",
    "agronomie de précision",
    "DiARIS analyse de sol",
    "FARE formation agropreneurs",
    "conseil agro-management",
    "agtech afrique",
    "innovation agricole bénin",
    "agriculture intelligente",
    "agroécologie bénin",
    "incubateur agricole afrique de l'ouest",
    "soil analysis benin",
  ],

  /* ── Canonical & Alternate ─────────────────────────────────────── */
  alternates: {
    canonical: BASE_URL,
    languages: {
      "fr-BJ": BASE_URL,
      "fr": BASE_URL,
    },
  },

  /* ── OpenGraph ─────────────────────────────────────────────────── */
  openGraph: {
    title: "Agrinnov — L'innovation au cœur de l'agriculture de demain",
    description:
      "Hub d'agriculture intelligente au Bénin : analyse de sol (DiARIS), incubateur agropreneurs (FARE) et conseil en agro-management (Advisory).",
    url: BASE_URL,
    siteName: "Agrinnov",
    type: "website",
    locale: "fr_BJ",
    images: [
      {
        url: "/images/og-image.png",
        width: 1200,
        height: 630,
        alt: "Agrinnov — Agriculture intelligente au Bénin",
      },
    ],
  },

  /* ── Twitter Card ──────────────────────────────────────────────── */
  twitter: {
    card: "summary_large_image",
    title: "Agrinnov — L'innovation au cœur de l'agriculture de demain",
    description:
      "DiARIS · FARE · Advisory — Les 3 piliers de l'agriculture intelligente au Bénin.",
    images: ["/images/og-image.png"],
  },

  /* ── Robots ────────────────────────────────────────────────────── */
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },

  /* ── Icônes ────────────────────────────────────────────────────── */
  icons: {
    icon: "/images/favicon.ico",
    apple: "/images/apple-touch-icon.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="fr"
      className={`${jakarta.variable} ${outfit.variable} scroll-smooth overflow-x-hidden`}
    >
      <head>
        {/* ── JSON-LD : Organisation ─────────────────────────────── */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "Organization",
              name: "Agrinnov",
              url: BASE_URL,
              logo: `${BASE_URL}/images/logo_principal.png`,
              description:
                "Hub d'agriculture intelligente au Bénin proposant des solutions AgTech, formation et conseil en agro-management.",
              address: {
                "@type": "PostalAddress",
                streetAddress: "Godomey, Tankpè",
                addressLocality: "Abomey-Calavi",
                addressCountry: "BJ",
              },
              contactPoint: {
                "@type": "ContactPoint",
                telephone: "+229-01-40-79-37-31",
                email: "contact@agrinnov.tech",
                contactType: "customer service",
                availableLanguage: ["French"],
              },
              sameAs: [],
              hasOfferCatalog: {
                "@type": "OfferCatalog",
                name: "Services Agrinnov",
                itemListElement: [
                  {
                    "@type": "Offer",
                    itemOffered: {
                      "@type": "Service",
                      name: "DiARIS",
                      description:
                        "Solution d'agronomie de précision : analyse de sol par spectrométrie NIR et recommandations sur mesure.",
                      url: `${BASE_URL}/diaris`,
                    },
                  },
                  {
                    "@type": "Offer",
                    itemOffered: {
                      "@type": "Service",
                      name: "FARE",
                      description:
                        "Programme d'incubation pratique pour les jeunes agropreneurs au Bénin.",
                      url: `${BASE_URL}/fare`,
                    },
                  },
                  {
                    "@type": "Offer",
                    itemOffered: {
                      "@type": "Service",
                      name: "Advisory",
                      description:
                        "Conseil en agro-management, ingénierie d'affaires et pilotage stratégique.",
                      url: `${BASE_URL}/advisory`,
                    },
                  },
                ],
              },
            }),
          }}
        />

        {/* ── JSON-LD : WebSite (SearchAction) ──────────────────── */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "WebSite",
              name: "Agrinnov",
              url: BASE_URL,
            }),
          }}
        />
      </head>
      <body className="bg-[#111111] text-white antialiased overflow-x-hidden">
        {children}
      </body>
    </html>
  );
}
