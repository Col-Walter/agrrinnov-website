"use client";

import AnimatedCounter from "@/components/AnimatedCounter";

const stats = [
  { end: 6,  suffix: "",  label: "Entrepreneurs\naccompagnés",  color: "#1FA34A" },
  { end: 5,  suffix: "+", label: "Années\nd'existence",        color: "#FF6A00" },
  { end: 98, suffix: "%", label: "Taux de\nsatisfaction",      color: "#FFC107" },
  { end: 10, suffix: "+", label: "Élèves formés\nFARE",        color: "#1FA34A" },
];

export default function StatsSection() {
  return (
    <section style={{ background: "#0F1F14" }} className="py-16">
      <div className="max-w-[1200px] mx-auto px-6 md:px-16">
        {/* Divider with label */}
        <div className="flex items-center gap-6 mb-12">
          <div className="flex-1 h-px bg-[#2E2E2E]" />
          <span className="text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#1FA34A] tracking-[3px] uppercase whitespace-nowrap">
            Nos Résultats
          </span>
          <div className="flex-1 h-px bg-[#2E2E2E]" />
        </div>

        {/* Stats grid */}
        <div className="flex flex-col md:flex-row items-center md:justify-around gap-10">
          {stats.map((s, i) => (
            <div key={i} className="flex flex-col md:flex-row items-center gap-10 w-full md:w-auto">
              <AnimatedCounter end={s.end} suffix={s.suffix} label={s.label} color={s.color} />
              {i < stats.length - 1 && (
                <div className="hidden md:block w-px h-20 bg-[#2E2E2E]" />
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
