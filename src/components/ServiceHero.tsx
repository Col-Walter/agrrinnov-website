"use client";

interface ServiceHeroProps {
  badge: string;
  title: string;
  subtitle: string;
  color: string;
}

export default function ServiceHero({ badge, title, subtitle, color }: ServiceHeroProps) {
  return (
    <section
      className="relative flex items-center justify-center overflow-hidden"
      style={{
        height: "420px",
        background: `linear-gradient(to bottom, #111111, ${color}0D, #111111)`,
      }}
    >
      {/* Grid background */}
      <svg
        className="absolute inset-0 w-full h-full pointer-events-none opacity-[0.12]"
        xmlns="http://www.w3.org/2000/svg"
      >
        <defs>
          <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
            <path d="M 40 0 L 0 0 0 40" fill="none" stroke={color} strokeWidth="0.8" />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#grid)" />
      </svg>

      {/* Radial glow */}
      <div
        className="absolute top-0 left-1/2 -translate-x-1/2 w-[500px] h-[500px] rounded-full pointer-events-none"
        style={{
          background: `radial-gradient(circle, ${color}20 0%, transparent 70%)`,
          transform: "translate(-50%, -40%)",
        }}
      />

      {/* Content */}
      <div className="relative z-10 text-center px-6 max-w-[900px] mx-auto">
        <div
          className="inline-flex items-center px-4 py-1.5 rounded-full mb-6 text-xs font-semibold tracking-widest uppercase animate-fade-up"
          style={{
            background: color + "1E",
            border: `1px solid ${color}4D`,
            color,
            fontFamily: "var(--font-jakarta)",
          }}
        >
          {badge}
        </div>
        <h1
          className="font-extrabold leading-tight text-white animate-fade-up delay-100"
          style={{
            fontFamily: "var(--font-jakarta)",
            fontSize: "clamp(42px, 8vw, 80px)",
          }}
        >
          {title}
        </h1>
        <p
          className="text-[#8A8A8A] mt-4 animate-fade-up delay-200 max-w-[700px] mx-auto"
          style={{ fontSize: "clamp(16px, 2vw, 20px)" }}
        >
          {subtitle}
        </p>
      </div>
    </section>
  );
}
