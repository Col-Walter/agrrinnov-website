import type { Metadata } from "next";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import ServiceHero from "@/components/ServiceHero";
import AnimatedCounter from "@/components/AnimatedCounter";
import ScrollReveal from "@/components/ScrollReveal";

export const metadata: Metadata = {
  title: "Advisory — Conseil en Agro-Management | Agrinnov",
  description:
    "AGRINNOV Advisory accompagne les entrepreneurs agroalimentaires, PME agricoles et investisseurs dans la structuration, le pilotage stratégique et la rentabilité de leurs projets.",
};

const expertise = [
  {
    num: "01", icon: "💼",
    title: "Ingénierie d'Affaires",
    desc: "Études de faisabilité, business plans de haut niveau, structuration financière pour création de nouvelles exploitations ou restructurations.",
  },
  {
    num: "02", icon: "📈",
    title: "Pilotage Stratégique",
    desc: "Conseil en gestion continue, optimisation des chaînes de production et d'approvisionnement, et sécurisation de la rentabilité.",
  },
  {
    num: "03", icon: "📊",
    title: "Conformité & Investisseurs",
    desc: "Mise en place de processus de gestion rigoureux et d'outils de reporting conformes aux attentes des institutions financières et du marché international.",
  },
];

export default function AdvisoryPage() {
  return (
    <>
      <Navbar />
      <main className="bg-[#111111] pt-[70px]">
        <ServiceHero
          badge="CONSEIL EN AGRO-MANAGEMENT"
          title="AGRINNOV Advisory"
          subtitle="Transformer vos exploitations agricoles en entreprises rentables, hautement structurées, résilientes et bancables."
          color="#FF6A00"
        />

        {/* Overview + Stats */}
        <section className="py-20 max-w-[1200px] mx-auto px-6 md:px-16">
          <div className="flex flex-col md:flex-row gap-20">
            <ScrollReveal className="flex-[3]">
              <p className="text-xs font-semibold text-[#FF6A00] tracking-widest uppercase mb-4">Pilotage Stratégique</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-6">
                Sécurisez la croissance globale de vos projets agroalimentaires
              </h2>
              <p className="text-lg text-[#CCCCCC] leading-relaxed mb-4">
                AGRINNOV Advisory est le pôle de conseil en gestion, d&apos;ingénierie d&apos;affaires et de pilotage
                stratégique d&apos;AGRINNOV. Il vise à accompagner les entrepreneurs agroalimentaires, les PME
                agricoles, les investisseurs et les coopératives dans la transformation de leurs exploitations en
                entreprises rentables, hautement structurées, résilientes et bancables.
              </p>
              <p className="text-[#8A8A8A] leading-relaxed">
                Que ce soit pour créer une nouvelle exploitation, restructurer une PME agricole existante ou déployer
                un projet d&apos;envergure, AGRINNOV Advisory pilote la croissance globale, sécurise la rentabilité à
                long terme et garantit une gestion d&apos;entreprise rigoureuse répondant aux exigences des
                investisseurs et du marché.
              </p>
            </ScrollReveal>

            <ScrollReveal delay={150} className="flex-[2]">
              <div
                className="rounded-2xl border border-[#2E2E2E] p-8 flex flex-col gap-6"
                style={{ background: "#1A1A1A" }}
              >
                <AnimatedCounter end={6}   suffix=""  label={"Grands projets et PME accompagnés"} color="#FF6A00" />
                <div className="h-px bg-[#2E2E2E]" />
                <AnimatedCounter end={360} suffix="°" label={"Accompagnement managérial et financier"} color="#FF6A00" />
                <div className="h-px bg-[#2E2E2E]" />
                <div className="text-center">
                  <p className="text-xs text-[#8A8A8A] mb-2">Profil d&apos;accompagnement</p>
                  <p className="font-semibold text-[#FF6A00] text-base">Investisseurs & Coopératives</p>
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>

        {/* Expertise */}
        <section style={{ background: "#0F0F0F" }} className="py-20">
          <div className="max-w-[1200px] mx-auto px-6 md:px-16">
            <ScrollReveal className="text-center mb-12">
              <p className="text-xs font-semibold text-[#FF6A00] tracking-widest uppercase mb-3">Expertise</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white">
                Nos Domaines d&apos;Intervention
              </h2>
            </ScrollReveal>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {expertise.map((e, i) => (
                <ScrollReveal key={e.num} delay={i * 120}>
                  <div
                    className="rounded-2xl border border-[#2E2E2E] p-7 h-full flex flex-col"
                    style={{ background: "#1A1A1A" }}
                  >
                    <div className="flex items-center justify-between mb-6">
                      <span
                        className="px-3 py-1 rounded-full text-xs font-semibold"
                        style={{ background: "rgba(255,106,0,0.12)", color: "#FF6A00" }}
                      >
                        {e.num}
                      </span>
                      <span className="text-2xl">{e.icon}</span>
                    </div>
                    <h3 className="font-semibold text-white text-lg mb-3">{e.title}</h3>
                    <p className="text-[#8A8A8A] text-sm leading-relaxed">{e.desc}</p>
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
              <div
                className="rounded-[32px] border p-10 md:p-14 text-center"
                style={{
                  background: "linear-gradient(135deg,#1A1A1A,rgba(255,106,0,0.06))",
                  borderColor: "rgba(255,106,0,0.3)",
                }}
              >
                <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-4">
                  Structurez votre projet agricole avec nos conseillers
                </h2>
                <p className="text-[#8A8A8A] text-lg mb-8 max-w-lg mx-auto">
                  Bénéficiez d&apos;une expertise rigoureuse pour sécuriser vos levées de fonds et accroître votre
                  rentabilité de marché.
                </p>
                <a
                  href="/#contact?service=advisory"
                  className="inline-flex px-8 py-4 rounded-full text-sm font-semibold text-white transition-all hover:scale-105"
                  style={{
                    background: "linear-gradient(135deg,#FF6A00,#FF8534)",
                    fontFamily: "var(--font-jakarta)",
                  }}
                >
                  Planifier un entretien conseil
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
