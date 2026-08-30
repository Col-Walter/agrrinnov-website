"use client";

import Image from "next/image";

interface OrbitalVisualProps {
  size?: number;
  showLogo?: boolean;
}

export default function OrbitalVisual({ size = 440, showLogo = true }: OrbitalVisualProps) {
  const s = size;
  const cx = s / 2;
  const cy = s / 2;
  const r1 = s * 0.45;
  const r2 = s * 0.45 * 0.72;
  const r3 = s * 0.45 * 0.45;

  return (
    <div
      className="relative flex items-center justify-center select-none shrink-0"
      style={{ width: s, height: s }}
    >
      {/* SVG rings */}
      <svg
        width={s}
        height={s}
        viewBox={`0 0 ${s} ${s}`}
        className="absolute inset-0"
        style={{ overflow: "visible" }}
      >
        {/* Outer ring */}
        <circle
          cx={cx} cy={cy} r={r1}
          fill="none"
          stroke="#1FA34A"
          strokeWidth={1}
          opacity={0.15}
        />
        {/* Middle ring */}
        <circle
          cx={cx} cy={cy} r={r2}
          fill="none"
          stroke="#FF6A00"
          strokeWidth={1}
          opacity={0.12}
        />
        {/* Inner ring */}
        <circle
          cx={cx} cy={cy} r={r3}
          fill="none"
          stroke="#1FA34A"
          strokeWidth={1}
          opacity={0.18}
        />

        {/* Electron 1 — outer — clockwise */}
        <g style={{ transformOrigin: `${cx}px ${cy}px`, animation: "spinOrbit 12s linear infinite" }}>
          <circle cx={cx + r1} cy={cy} r={6} fill="#1FA34A" opacity={0.9} />
          <circle cx={cx + r1} cy={cy} r={10} fill="#1FA34A" opacity={0.2} />
        </g>

        {/* Electron 2 — middle — counter-clockwise faster */}
        <g style={{ transformOrigin: `${cx}px ${cy}px`, animation: "spinOrbitReverse 9.2s linear infinite" }}>
          <circle cx={cx + r2} cy={cy} r={8} fill="#FF6A00" opacity={0.8} />
          <circle cx={cx + r2} cy={cy} r={14} fill="#FF6A00" opacity={0.2} />
        </g>

        {/* Electron 3 — inner — clockwise fastest */}
        <g style={{ transformOrigin: `${cx}px ${cy}px`, animation: "spinOrbit 6.7s linear infinite" }}>
          <circle cx={cx + r3} cy={cy} r={5} fill="#1FA34A" opacity={0.7} />
          <circle cx={cx + r3} cy={cy} r={9} fill="#1FA34A" opacity={0.15} />
        </g>

        {/* Centre glow */}
        <radialGradient id="centerGlow" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stopColor="#1FA34A" stopOpacity={0.15} />
          <stop offset="100%" stopColor="#1FA34A" stopOpacity={0} />
        </radialGradient>
        <circle cx={cx} cy={cy} r={r3 * 0.67} fill="url(#centerGlow)" />
      </svg>

      {/* Central logo circle */}
      {showLogo && (
        <div
          className="absolute rounded-full flex items-center justify-center animate-pulse-glow z-10"
          style={{
            width: s * 0.36,
            height: s * 0.36,
            background: "radial-gradient(circle, #1F2F22, #111111)",
            border: "2px solid rgba(31, 163, 74, 0.4)",
          }}
        >
          <div className="relative" style={{ width: s * 0.24, height: s * 0.24 }}>
            <Image
              src="/images/logo_icone.png"
              alt="Agrinnov"
              fill
              className="object-contain"
              priority
            />
          </div>
        </div>
      )}
    </div>
  );
}
