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

export const metadata: Metadata = {
  title: "Agrinnov — L'innovation au cœur de l'agriculture de demain",
  description:
    "Agrinnov est le centre de l'agriculture intelligente au Bénin. Découvrez DiARIS (agronomie de précision), FARE (formation agropreneurs) et nos services de conseil en agro-management.",
  keywords: [
    "agrinnov",
    "agriculture bénin",
    "agronomie de précision",
    "DiARIS",
    "FARE",
    "agtech",
    "conseil agricole",
    "innovation agricole",
  ],
  openGraph: {
    title: "Agrinnov — L'innovation au cœur de l'agriculture de demain",
    description:
      "Solutions technologiques et d'accompagnement pour les entrepreneurs agricoles en Afrique de l'Ouest.",
    type: "website",
    locale: "fr_BJ",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr" className={`${jakarta.variable} ${outfit.variable} scroll-smooth overflow-x-hidden`}>
      <body className="bg-[#111111] text-white antialiased overflow-x-hidden">{children}</body>
    </html>
  );
}
