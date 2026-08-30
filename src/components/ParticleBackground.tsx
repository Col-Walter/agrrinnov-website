"use client";

import { useEffect, useRef } from "react";

interface Particle {
  x: number;
  y: number;
  size: number;
  speed: number;
  angle: number;
  opacity: number;
  color: string;
}

const COLORS = ["#1FA34A", "#FF6A00", "#FFC107"];

function createParticle(): Particle {
  return {
    x: Math.random(),
    y: Math.random(),
    size: Math.random() * 2 + 0.5,
    speed: Math.random() * 0.0003 + 0.0001,
    angle: Math.random() * Math.PI * 2,
    opacity: Math.random() * 0.3 + 0.05,
    color: COLORS[Math.floor(Math.random() * COLORS.length)],
  };
}

export default function ParticleBackground({ count = 40 }: { count?: number }) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const particlesRef = useRef<Particle[]>([]);
  const rafRef = useRef<number>(0);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    // Initialize particles
    particlesRef.current = Array.from({ length: count }, createParticle);

    const resize = () => {
      canvas.width = canvas.offsetWidth;
      canvas.height = canvas.offsetHeight;
    };
    resize();
    window.addEventListener("resize", resize);

    const draw = () => {
      if (!canvas || !ctx) return;
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      for (const p of particlesRef.current) {
        // Update position
        p.x += Math.cos(p.angle) * p.speed;
        p.y += Math.sin(p.angle) * p.speed;

        // Wrap around edges
        if (p.x < 0 || p.x > 1 || p.y < 0 || p.y > 1) {
          p.x = Math.random();
          p.y = Math.random();
          p.angle = Math.random() * Math.PI * 2;
        }

        // Draw blurred dot
        ctx.save();
        ctx.globalAlpha = p.opacity;
        ctx.fillStyle = p.color;
        ctx.shadowBlur = 4;
        ctx.shadowColor = p.color;
        ctx.beginPath();
        ctx.arc(p.x * canvas.width, p.y * canvas.height, p.size, 0, Math.PI * 2);
        ctx.fill();
        ctx.restore();
      }

      rafRef.current = requestAnimationFrame(draw);
    };

    draw();

    return () => {
      cancelAnimationFrame(rafRef.current);
      window.removeEventListener("resize", resize);
    };
  }, [count]);

  return (
    <canvas
      ref={canvasRef}
      className="absolute inset-0 w-full h-full pointer-events-none"
    />
  );
}
