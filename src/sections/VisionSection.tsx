"use client";

import { useState } from "react";
import ScrollReveal from "@/components/ScrollReveal";
import OrbitalVisual from "@/components/OrbitalVisual";
import ParticleBackground from "@/components/ParticleBackground";

const pillars = [
  {
    icon: "💡",
    color: "#FFC107",
    title: "Innovation",
    description: "Adopter les technologies les plus avancées pour transformer les pratiques agricoles traditionnelles.",
  },
  {
    icon: "📈",
    color: "#1FA34A",
    title: "Évolution",
    description: "Accompagner chaque agriculteur dans sa progression vers une agriculture toujours plus performante.",
  },
  {
    icon: "⚓",
    color: "#FF6A00",
    title: "Conservation",
    description: "Préserver les savoirs ancestraux et les équilibres naturels qui fondent l'agriculture durable.",
  },
];

function PillarCard({
  icon, color, title, description, delay,
}: { icon: string; color: string; title: string; description: string; delay: number }) {
  const [hovered, setHovered] = useState(false);
  return (
    <ScrollReveal delay={delay} className="flex-1">
      <div
        className="p-7 rounded-2xl border transition-all duration-300 h-full"
        style={{
          background: hovered ? color + "0D" : "#1A1A1A80",
          borderColor: hovered ? color + "66" : "#2E2E2E",
          transform: `translateY(${hovered ? -6 : 0}px)`,
        }}
        onMouseEnter={() => setHovered(true)}
        onMouseLeave={() => setHovered(false)}
      >
        <div className="text-3xl mb-4">{icon}</div>
        <h3
          className="font-[family-name:var(--font-jakarta)] font-bold text-xl mb-3"
          style={{ color }}
        >
          {title}
        </h3>
        <p className="text-[15px] text-[#CCCCCC] leading-relaxed">{description}</p>
      </div>
    </ScrollReveal>
  );
}

export default function VisionSection() {
  return (
    <section
      id="vision"
      className="relative py-28 overflow-hidden"
      style={{
        background: "linear-gradient(135deg, #111111, #0A1A0D, #111111)",
      }}
    >
      <ParticleBackground count={50} />

      <div className="relative z-10 max-w-[1200px] mx-auto px-6 md:px-16">
        {/* Heading */}
        <ScrollReveal className="text-center mb-16">
          <p className="text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#FF6A00] tracking-[4px] uppercase mb-4">
            Notre Vision
          </p>
          <h2
            className="font-[family-name:var(--font-jakarta)] font-extrabold text-white"
            style={{ fontSize: "clamp(32px,5vw,56px)" }}
          >
            Le Noyau<br />Agrinnov
          </h2>
        </ScrollReveal>

        {/* Content: text left + orbital right */}
        <div className="flex flex-col md:flex-row items-center gap-16 mb-20">
          <ScrollReveal className="flex-1">
            <blockquote className="text-[#FF6A00] italic text-xl leading-relaxed mb-6">
              &ldquo;Agrinnov est le centre vers lequel tout converge et duquel tout rayonne.&rdquo;
            </blockquote>
            <p className="text-[#CCCCCC] text-lg leading-relaxed mb-5">
              Solide, indéfectible, Agrinnov constitue le socle sur lequel repose l&apos;agriculture de demain — non
              pas une contrainte, mais un point d&apos;ancrage qui libère.
            </p>
            <p className="text-[#CCCCCC] text-lg leading-relaxed mb-5">
              De ce noyau partent des prolongements infinis : des explorations, des découvertes, des innovations sans
              limites. Agrinnov ne freine jamais le mouvement ; il l&apos;initie, le guide et l&apos;amplifie.
            </p>
            <p className="text-[#8A8A8A] leading-relaxed mb-8">
              Parce que l&apos;innovation véritable ne naît pas du vide — elle émerge de racines profondes, de savoirs
              accumulés, de pratiques éprouvées. Agrinnov honore ces acquis tout en ouvrant les portes de l&apos;avenir.
            </p>
            <div
              className="pl-5 py-3"
              style={{ borderLeft: "3px solid #1FA34A", background: "rgba(31,163,74,0.05)" }}
            >
              <p className="text-white italic leading-relaxed">
                &ldquo;Inspirer l&apos;innovation, favoriser l&apos;évolution, et préserver les acquis tangibles qui
                constituent le socle de l&apos;humanité.&rdquo;
              </p>
            </div>
          </ScrollReveal>

          {/* Orbital */}
          <div className="shrink-0 hidden md:flex">
            <OrbitalVisual size={440} showLogo />
          </div>
          <div className="md:hidden flex justify-center w-full">
            <OrbitalVisual size={300} showLogo />
          </div>
        </div>

        {/* Pillars */}
        <div className="flex flex-col md:flex-row gap-6">
          {pillars.map((p, i) => (
            <PillarCard key={p.title} {...p} delay={i * 150} />
          ))}
        </div>
      </div>
    </section>
  );
}
