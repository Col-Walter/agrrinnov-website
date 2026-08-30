"use client";

import { useState } from "react";
import ScrollReveal from "@/components/ScrollReveal";

interface ServiceCardProps {
  tag: string;
  title: string;
  subtitle: string;
  description: string;
  features: string[];
  color: string;
  gradient: string;
  href: string;
  isCenter?: boolean;
  delay?: number;
}

function ServiceCard({
  tag, title, subtitle, description, features, color, gradient, href, isCenter = false, delay = 0,
}: ServiceCardProps) {
  const [hovered, setHovered] = useState(false);

  return (
    <ScrollReveal delay={delay} className="flex-1">
      <a
        href={href}
        onMouseEnter={() => setHovered(true)}
        onMouseLeave={() => setHovered(false)}
        className={`flex flex-col h-full rounded-3xl p-8 cursor-pointer transition-all duration-300 no-underline transform ${
          isCenter
            ? "[--card-y:0px] hover:[--card-y:-8px] md:[--card-y:-16px] md:hover:[--card-y:-24px]"
            : "[--card-y:0px] hover:[--card-y:-8px]"
        }`}
        style={{
          background: hovered ? "#242424" : "#1A1A1A",
          border: `1.5px solid ${hovered ? color + "80" : "#2E2E2E"}`,
          boxShadow: hovered ? `0 12px 40px ${color}40` : "0 4px 20px rgba(0,0,0,0.2)",
          transform: `translateY(var(--card-y))`,
        }}
      >
        {/* Tag + Icon */}
        <div className="flex items-center justify-between mb-6">
          <span
            className="px-3 py-1 rounded-full text-xs font-[family-name:var(--font-jakarta)] font-semibold"
            style={{ background: color + "26", color }}
          >
            {tag}
          </span>
          <div
            className="w-10 h-10 rounded-xl flex items-center justify-center transition-all duration-300"
            style={{
              background: hovered ? gradient : color + "1A",
            }}
          >
            {/* Icon placeholder — replaced by emoji equivalents */}
            <span className="text-lg">{tag === "01" ? "🧬" : tag === "02" ? "🎓" : "💼"}</span>
          </div>
        </div>

        {/* Title */}
        <h3
          className="font-[family-name:var(--font-jakarta)] font-extrabold text-3xl mb-1 transition-colors"
          style={{ color }}
        >
          {title}
        </h3>
        <p className="text-sm text-[#8A8A8A] mb-4">{subtitle}</p>

        {/* Description */}
        <p className="text-[15px] text-[#CCCCCC] leading-relaxed mb-6">{description}</p>

        {/* Features */}
        <ul className="flex flex-col gap-2.5 mb-8 flex-1">
          {features.map((f) => (
            <li key={f} className="flex items-center gap-3">
              <span
                className="w-1.5 h-1.5 rounded-full shrink-0"
                style={{ background: color }}
              />
              <span className="text-sm text-[#CCCCCC]">{f}</span>
            </li>
          ))}
        </ul>

        {/* CTA */}
        <div className="flex items-center gap-2 mt-auto">
          <span
            className="text-sm font-[family-name:var(--font-jakarta)] font-semibold"
            style={{ color }}
          >
            En savoir plus
          </span>
          <span
            className="text-sm transition-transform duration-200"
            style={{ color, transform: hovered ? "translateX(4px)" : "translateX(0)" }}
          >
            →
          </span>
        </div>
      </a>
    </ScrollReveal>
  );
}

const services = [
  {
    tag: "01",
    title: "DiARIS",
    subtitle: "Agronomie de précision (AgTech)",
    description:
      "Solution technologique d'agronomie de précision conçue pour démocratiser l'analyse de sol et accompagner la régénération agroécologique des terres agricoles.",
    features: ["Analyse de sol rapide", "Recommandations sur mesure", "Régénération des terres", "Diagnostic accessible"],
    color: "#1FA34A",
    gradient: "linear-gradient(135deg,#1FA34A,#27C55B)",
    href: "/diaris",
  },
  {
    tag: "02",
    title: "FARE",
    subtitle: "Incubateur pratique de terrain",
    description:
      "Programme d'accompagnement pratique en partenariat avec des entreprises agricoles et institutions intervenant au Bénin pour sécuriser vos investissements par la pratique.",
    features: ["Pratique de terrain immersive", "Transfert de fiches techniques", "Réseau Alumni solidaire", "Filières à haute valeur"],
    color: "#FFC107",
    gradient: "linear-gradient(135deg,#FFC107,#FFD54F)",
    href: "/fare",
    isCenter: true,
  },
  {
    tag: "03",
    title: "Advisory",
    subtitle: "Conseil en Agro-Management",
    description:
      "Pôle de conseil en gestion, d'ingénierie d'affaires et de pilotage stratégique pour transformer vos exploitations en entreprises rentables, résilientes et bancables.",
    features: ["Ingénierie d'affaires", "Pilotage stratégique", "Rentabilité sécurisée", "Exigences du marché"],
    color: "#FF6A00",
    gradient: "linear-gradient(135deg,#FF6A00,#FF8534)",
    href: "/advisory",
  },
];

export default function ServicesSection() {
  return (
    <section id="services" className="py-24" style={{ background: "#111111" }}>
      <div className="max-w-[1200px] mx-auto px-6 md:px-16">
        {/* Header */}
        <ScrollReveal className="text-center mb-16">
          <p className="text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#1FA34A] tracking-[4px] uppercase mb-4">
            Nos Services
          </p>
          <h2
            className="font-[family-name:var(--font-jakarta)] font-extrabold text-white mb-4"
            style={{ fontSize: "clamp(28px,4vw,42px)" }}
          >
            Nos 3 Piliers<br />d&apos;Innovation
          </h2>
          <p className="text-[#8A8A8A] text-lg max-w-xl mx-auto">
            Trois services complémentaires pour accompagner les agriculteurs vers la performance et la durabilité.
          </p>
        </ScrollReveal>

        {/* Cards */}
        <div className="flex flex-col md:flex-row gap-6 items-stretch">
          {services.map((s, i) => (
            <ServiceCard key={s.tag} {...s} delay={i * 150} />
          ))}
        </div>
      </div>
    </section>
  );
}
