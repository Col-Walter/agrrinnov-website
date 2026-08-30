import type { Metadata } from "next";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import ServiceHero from "@/components/ServiceHero";
import AnimatedCounter from "@/components/AnimatedCounter";
import ScrollReveal from "@/components/ScrollReveal";

const PAGE_URL = "https://agrinnov.tech/fare";

export const metadata: Metadata = {
  title: "Programme FARE — Incubateur Agropreneurs au Bénin",
  description:
    "Le Programme FARE d'Agrinnov forme et accompagne les jeunes agropreneurs au Bénin : immersion terrain, transfert de fiches techniques, réseau Alumni et accompagnement à la réussite entrepreneuriale.",
  keywords: [
    "FARE agropreneurs",
    "formation agricole bénin",
    "incubateur agricole",
    "entrepreneur agricole",
    "jeunes agriculteurs bénin",
    "formation terrain agriculture",
    "réseau alumni agro",
  ],
  alternates: { canonical: PAGE_URL },
  openGraph: {
    title: "Programme FARE — Incubateur Agropreneurs | Agrinnov",
    description:
      "Formez-vous sur le terrain et lancez votre exploitation agricole avec le Programme FARE d'Agrinnov au Bénin.",
    url: PAGE_URL,
    type: "website",
    locale: "fr_BJ",
    images: [{ url: "/images/og-fare.png", width: 1200, height: 630, alt: "Programme FARE — Incubateur Agropreneurs" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "Programme FARE — Incubateur Agropreneurs | Agrinnov",
    description: "Formation terrain, transfert de compétences et réseau Alumni pour agropreneurs au Bénin.",
    images: ["/images/og-fare.png"],
  },
};

const pillars = [
  {
    num: "01", icon: "🌱",
    title: "Formation Pratique de Terrain",
    desc: "Immersions directes sur des sites de référence chez des entreprises agricoles et institutions partenaires intervenant au Bénin, axées sur des filières stratégiques à haute valeur ajoutée.",
  },
  {
    num: "02", icon: "🔄",
    title: "Accompagnement & Transfert",
    desc: "Transmission de fiches techniques opérationnelles, d'itinéraires techniques précis et de méthodes de production résilientes pour être immédiatement prêt à lancer son exploitation.",
  },
  {
    num: "03", icon: "👥",
    title: "Réseautage & Écosystème (Alumni)",
    desc: "Mise en relation directe entre apprenants, experts-formateurs et partenaires techniques. Une communauté solidaire post-formation pour briser l'isolement des agripreneurs.",
  },
];

const jsonLd = {
  "@context": "https://schema.org",
  "@type": "EducationalOrganization",
  name: "Programme FARE — Agrinnov",
  description: "Incubateur pratique pour jeunes agropreneurs au Bénin : formation terrain, transfert de fiches techniques et réseau Alumni.",
  url: PAGE_URL,
  provider: { "@type": "Organization", name: "Agrinnov", url: "https://agrinnov.tech" },
  areaServed: { "@type": "Country", name: "Bénin" },
};

export default function FarePage() {
  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <Navbar />
      <main className="bg-[#111111] pt-[70px]">
        <ServiceHero
          badge="PROGRAMME AGRINNOV"
          title="Programme FARE"
          subtitle="Formation et Accompagnement à la Réussite Entrepreneuriat Agricole."
          color="#FFC107"
        />

        {/* Overview + Stats */}
        <section className="py-20 max-w-[1200px] mx-auto px-6 md:px-16">
          <div className="flex flex-col md:flex-row gap-20">
            <ScrollReveal className="flex-[3]">
              <p className="text-xs font-semibold text-[#FFC107] tracking-widest uppercase mb-4">L'incubateur pratique</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-6">
                Sécuriser vos investissements par le savoir-faire terrain
              </h2>
              <p className="text-lg text-[#CCCCCC] leading-relaxed mb-4">
                Le Programme FARE est une initiative portée par AGRINNOV, développée en partenariat avec des entreprises agricoles et institutions intervenant au Bénin. Il est conçu comme un incubateur pratique et un accélérateur de compétences destiné aux jeunes agropreneurs, producteurs et porteurs de projets agricoles.
              </p>
              <h4 className="font-semibold text-white text-lg mb-2">Objectif Principal</h4>
              <p className="text-[#8A8A8A] leading-relaxed">
                Le programme vise à démystifier la production agricole et à sécuriser les investissements des porteurs de projets en leur fournissant à la fois des compétences techniques de pointe, de la pratique terrain éprouvée et des outils de gestion entrepreneuriale.
              </p>
            </ScrollReveal>
            <ScrollReveal delay={150} className="flex-[2]">
              <div className="rounded-2xl border border-[#2E2E2E] p-8 flex flex-col gap-6" style={{ background: "#1A1A1A" }}>
                <AnimatedCounter end={10}  suffix="+"  label={"Élèves & Agropreneurs formés"} color="#FFC107" />
                <div className="h-px bg-[#2E2E2E]" />
                <AnimatedCounter end={100} suffix="%" label={"Pratique immersive sur site"}   color="#FFC107" />
                <div className="h-px bg-[#2E2E2E]" />
                <div className="text-center">
                  <p className="text-xs text-[#8A8A8A] mb-2">Réseau Partenarial</p>
                  <p className="font-semibold text-[#FFC107] text-base">Entreprises & Institutions du Bénin</p>
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>

        {/* 3 Pillars */}
        <section style={{ background: "#0F0F0F" }} className="py-20">
          <div className="max-w-[1200px] mx-auto px-6 md:px-16">
            <ScrollReveal className="text-center mb-12">
              <p className="text-xs font-semibold text-[#FFC107] tracking-widest uppercase mb-3">Structure</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white">Les 3 Piliers du Programme</h2>
            </ScrollReveal>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {pillars.map((p, i) => (
                <ScrollReveal key={p.num} delay={i * 120}>
                  <div className="rounded-2xl border border-[#2E2E2E] p-7 h-full flex flex-col" style={{ background: "#1A1A1A" }}>
                    <div className="flex items-center justify-between mb-6">
                      <span className="px-3 py-1 rounded-full text-xs font-semibold" style={{ background: "rgba(255,193,7,0.12)", color: "#FFC107" }}>{p.num}</span>
                      <span className="text-2xl">{p.icon}</span>
                    </div>
                    <h3 className="font-semibold text-white text-lg mb-3">{p.title}</h3>
                    <p className="text-[#8A8A8A] text-sm leading-relaxed">{p.desc}</p>
                  </div>
                </ScrollReveal>
              ))}
            </div>
          </div>
        </section>

        {/* CTA */}
        <section className="py-20 px-6 md:px-16">
          <div className="max-w-[1000px] mx-auto">
            <ScrollReveal>
              <div className="rounded-[32px] border p-10 md:p-14 text-center"
                style={{ background: "linear-gradient(135deg,#1A1A1A,rgba(255,193,7,0.06))", borderColor: "rgba(255,193,7,0.3)" }}>
                <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-4">Rejoignez la prochaine cohorte FARE</h2>
                <p className="text-[#8A8A8A] text-lg mb-8 max-w-lg mx-auto">
                  Passez du projet théorique à l&apos;exploitation agricole structurée et rentable grâce à notre accompagnement pratique.
                </p>
                <a href="/#contact?service=fare"
                  className="inline-flex px-8 py-4 rounded-full text-sm font-semibold transition-all hover:scale-105"
                  style={{ background: "linear-gradient(135deg,#FFC107,#FFD54F)", color: "#111111", fontFamily: "var(--font-jakarta)" }}>
                  S&apos;inscrire / Demander des infos
                </a>
              </div>
            </ScrollReveal>
          </div>
        </section>

        <Footer />
      </main>
    </>
  );
}
