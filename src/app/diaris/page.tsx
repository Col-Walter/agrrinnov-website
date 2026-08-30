import type { Metadata } from "next";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import ServiceHero from "@/components/ServiceHero";
import AnimatedCounter from "@/components/AnimatedCounter";
import ScrollReveal from "@/components/ScrollReveal";

export const metadata: Metadata = {
  title: "DiARIS — Agronomie de Précision | Agrinnov",
  description:
    "DiARIS est la solution d'agronomie de précision d'Agrinnov : analyse de sol NIR, diagnostics rapides et recommandations sur mesure pour régénérer vos terres agricoles.",
};

const steps = [
  { num: "01", title: "Collecte d'échantillon", desc: "Prélèvement standardisé par nos techniciens sur votre parcelle." },
  { num: "02", title: "Analyse spectrale",      desc: "Scan par spectrométrie proche infrarouge (NIR) et traitement IA." },
  { num: "03", title: "Rapport & Diagnostic",   desc: "Rapport clair avec score de santé de sol livré en 72 h." },
  { num: "04", title: "Plan d'action",          desc: "Recommandations d'amendements et d'itinéraires culturaux sur mesure." },
];

const features = [
  { icon: "🧬", title: "Agronomie connectée",         desc: "Analyses immédiates de la composition minérale et organique de vos parcelles sans destruction de sol." },
  { icon: "🌿", title: "Régénération agroécologique", desc: "Plans de fertilisation et restauration écologique pensés pour la durabilité et la santé biologique de la terre." },
  { icon: "🎯", title: "Recommandations sur mesure",  desc: "Traduction directe des données complexes en conseils d'action simples, applicables par tous les producteurs." },
];

export default function DiarisPage() {
  return (
    <>
      <Navbar />
      <main className="bg-[#111111] pt-[70px]">
        {/* Hero */}
        <ServiceHero
          badge="AGRONOMIE DE PRÉCISION (AGTECH)"
          title="DiARIS"
          subtitle="Démocratiser l'analyse de sol et accompagner la régénération agroécologique des terres agricoles."
          color="#1FA34A"
        />

        {/* Details + Stats */}
        <section className="py-20 max-w-[1200px] mx-auto px-6 md:px-16">
          <div className="flex flex-col md:flex-row gap-20">
            {/* Description */}
            <ScrollReveal className="flex-[3]">
              <p className="text-xs font-semibold text-[#1FA34A] tracking-widest uppercase mb-4">Présentation générale</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-6">
                Combler le fossé entre la science et le terrain
              </h2>
              <p className="text-lg text-[#CCCCCC] leading-relaxed mb-4">
                DiARIS est une solution technologique innovante (AgTech) d'agronomie de précision développée par AGRINNOV, conçue pour démocratiser l'analyse de sol et accompagner la régénération agroécologique des terres agricoles.
              </p>
              <p className="text-[#8A8A8A] leading-relaxed mb-8">
                Son objectif principal est de combler le fossé entre la recherche scientifique, les données complexes du sol et les besoins pratiques des producteurs sur le terrain, en fournissant des diagnostics rapides, accessibles et des recommandations sur mesure.
              </p>
              <div className="flex flex-col gap-5">
                {features.map((f) => (
                  <div key={f.title} className="flex gap-4">
                    <div className="w-10 h-10 rounded-xl flex items-center justify-center shrink-0 text-xl" style={{ background: "rgba(31,163,74,0.12)" }}>{f.icon}</div>
                    <div>
                      <p className="font-semibold text-white mb-1">{f.title}</p>
                      <p className="text-sm text-[#8A8A8A] leading-relaxed">{f.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </ScrollReveal>

            {/* Stats */}
            <ScrollReveal delay={150} className="flex-[2]">
              <div className="rounded-2xl border border-[#2E2E2E] p-8 flex flex-col gap-6" style={{ background: "#1A1A1A" }}>
                <AnimatedCounter end={98}  suffix="%" label={"Précision d'analyse spectral"} color="#1FA34A" />
                <div className="h-px bg-[#2E2E2E]" />
                <AnimatedCounter end={72}  suffix="h" label={"Temps de livraison du rapport"} color="#1FA34A" />
                <div className="h-px bg-[#2E2E2E]" />
                <AnimatedCounter end={120} suffix="+" label={"Parcelles cartographiées"}       color="#1FA34A" />
              </div>
            </ScrollReveal>
          </div>
        </section>

        {/* Steps */}
        <section style={{ background: "#0F0F0F" }} className="py-20">
          <div className="max-w-[1200px] mx-auto px-6 md:px-16">
            <ScrollReveal className="text-center mb-12">
              <p className="text-xs font-semibold text-[#1FA34A] tracking-widest uppercase mb-3">Processus</p>
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white">Comment fonctionne DiARIS ?</h2>
            </ScrollReveal>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
              {steps.map((s, i) => (
                <ScrollReveal key={s.num} delay={i * 100}>
                  <div className="text-center p-6">
                    <div className="w-14 h-14 rounded-full flex items-center justify-center mx-auto mb-4 border"
                      style={{ background: "rgba(31,163,74,0.12)", borderColor: "rgba(31,163,74,0.3)" }}>
                      <span className="font-bold text-[#1FA34A]">{s.num}</span>
                    </div>
                    <p className="font-semibold text-white mb-2">{s.title}</p>
                    <p className="text-sm text-[#8A8A8A] leading-relaxed">{s.desc}</p>
                  </div>
                </ScrollReveal>
              ))}
            </div>
          </div>
        </section>

        {/* CTA */}
        <CtaBanner
          title="Optimisez la santé de vos sols dès aujourd'hui"
          subtitle="Prenez contact avec nos experts agronomes pour organiser une analyse de vos parcelles."
          cta="Demander une analyse DiARIS"
          color="#1FA34A"
          gradient="linear-gradient(135deg,#1FA34A,#27C55B)"
        />

        <Footer />
      </main>
    </>
  );
}

function CtaBanner({ title, subtitle, cta, color, gradient }: { title: string; subtitle: string; cta: string; color: string; gradient: string }) {
  return (
    <section className="py-20 px-6 md:px-16">
      <div className="max-w-[1000px] mx-auto">
        <ScrollReveal>
          <div className="rounded-[32px] border p-10 md:p-14 text-center"
            style={{ background: `linear-gradient(135deg, #1A1A1A, ${color}14)`, borderColor: color + "4D" }}>
            <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-3xl text-white mb-4">{title}</h2>
            <p className="text-[#8A8A8A] text-lg mb-8 max-w-lg mx-auto">{subtitle}</p>
            <a
              href="/#contact?service=diaris"
              className="inline-flex px-8 py-4 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white transition-all duration-200 hover:scale-105"
              style={{ background: gradient }}
            >
              {cta}
            </a>
          </div>
        </ScrollReveal>
      </div>
    </section>
  );
}
