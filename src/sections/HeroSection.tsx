"use client";

import Image from "next/image";
import Link from "next/link";
import ParticleBackground from "@/components/ParticleBackground";
import OrbitalVisual from "@/components/OrbitalVisual";

export default function HeroSection() {
  const scrollTo = (id: string) => {
    document.getElementById(id)?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <section
      id="home"
      className="relative min-h-screen flex items-center overflow-hidden"
      style={{
        background: "linear-gradient(135deg, #0A0A0A, #111111, #0D1A10)",
      }}
    >
      {/* Particles */}
      <ParticleBackground count={40} />

      {/* Bottom fade */}
      <div
        className="absolute bottom-0 left-0 right-0 h-48 pointer-events-none z-10"
        style={{
          background: "linear-gradient(to bottom, transparent, #111111)",
        }}
      />

      {/* Content */}
      <div className="relative z-20 w-full max-w-[1200px] mx-auto px-6 md:px-16 pt-28 pb-16">
        <div className="flex flex-col md:flex-row items-center gap-12 md:gap-16">
          {/* Left text */}
          <div className="flex-1 flex flex-col items-start">
            {/* Badge */}
            <div
              className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full mb-6 animate-fade-up"
              style={{
                background: "rgba(31,163,74,0.12)",
                border: "1px solid rgba(31,163,74,0.3)",
              }}
            >
              <span className="w-2 h-2 rounded-full bg-[#1FA34A] animate-pulse" />
              <span className="text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#27C55B] tracking-widest uppercase">
                Agriculture & Innovation
              </span>
            </div>

            {/* Headline */}
            <h1
              className="font-[family-name:var(--font-jakarta)] font-extrabold leading-[1.05] text-white mb-6 animate-fade-up delay-100"
              style={{ fontSize: "clamp(38px, 6vw, 72px)" }}
            >
              L&apos;innovation <br />
              au coeur de <br />
              l&apos;Agriculture<br />
              <span style={{ color: "#1FA34A" }}>de Demain</span>
            </h1>

            {/* Subtitle */}
            <p className="text-lg text-[#8A8A8A] leading-relaxed mb-8 max-w-lg animate-fade-up delay-200">
              Agrinnov accompagne les entrepreneurs agricoles vers la performance,
              la durabilité et la rentabilité grâce à trois services complémentaires.
            </p>

            {/* CTAs */}
            <div className="flex flex-wrap gap-4 animate-fade-up delay-300">
              <a
                href="#services"
                onClick={(e) => {
                  e.preventDefault();
                  scrollTo("services");
                }}
                className="px-7 py-3.5 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white transition-all duration-200 hover:scale-105 hover:shadow-xl flex items-center justify-center cursor-pointer"
                style={{
                  background: "linear-gradient(135deg,#1FA34A,#27C55B)",
                  boxShadow: "0 0 0 rgba(31,163,74,0)",
                }}
                onMouseEnter={(e) => {
                  (e.currentTarget as HTMLElement).style.boxShadow =
                    "0 8px 30px rgba(31,163,74,0.4)";
                }}
                onMouseLeave={(e) => {
                  (e.currentTarget as HTMLElement).style.boxShadow = "none";
                }}
              >
                Découvrir nos services
              </a>
              <a
                href="#vision"
                onClick={(e) => {
                  e.preventDefault();
                  scrollTo("vision");
                }}
                className="px-7 py-3.5 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white border border-[#2E2E2E] hover:border-[#1FA34A] hover:text-[#1FA34A] transition-all duration-200 flex items-center justify-center cursor-pointer"
              >
                Notre vision →
              </a>
            </div>
          </div>

          {/* Right orbital */}
          <div className="shrink-0 hidden md:flex items-center justify-center animate-fade-in delay-400">
            <OrbitalVisual size={440} showLogo />
          </div>
          {/* Mobile orbital (smaller) */}
          <div className="md:hidden flex items-center justify-center animate-fade-in delay-300">
            <OrbitalVisual size={300} showLogo />
          </div>
        </div>
      </div>

      {/* Scroll indicator */}
      <div className="absolute bottom-8 left-0 right-0 flex flex-col items-center gap-1 z-20 animate-bounce-y">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="#1FA34A">
          <path d="M7 10l5 5 5-5z" />
        </svg>
        <svg width="16" height="16" viewBox="0 0 24 24" fill="#1FA34A" opacity={0.5}>
          <path d="M7 10l5 5 5-5z" />
        </svg>
      </div>
    </section>
  );
}
