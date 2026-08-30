"use client";

import { useEffect, useRef, useState } from "react";

interface AnimatedCounterProps {
  end: number;
  suffix?: string;
  label: string;
  color: string;
  duration?: number;
  decimals?: number;
}

export default function AnimatedCounter({
  end,
  suffix = "",
  label,
  color,
  duration = 1800,
  decimals = 0,
}: AnimatedCounterProps) {
  const [value, setValue] = useState(0);
  const [started, setStarted] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = ref.current;
    if (!el) return;

    // Safety fallback: start animation after 800ms if observer didn't fire
    const safetyTimeout = setTimeout(() => {
      setStarted(true);
    }, 800);

    if (typeof window === "undefined" || !("IntersectionObserver" in window)) {
      setStarted(true);
      clearTimeout(safetyTimeout);
      return;
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting && !started) {
          setStarted(true);
          clearTimeout(safetyTimeout);
        }
      },
      { threshold: 0.01 } // Trigger immediately when a single pixel is visible
    );

    observer.observe(el);

    return () => {
      observer.disconnect();
      clearTimeout(safetyTimeout);
    };
  }, [started]);

  useEffect(() => {
    if (!started) return;
    let startTime: number;

    const step = (ts: number) => {
      if (!startTime) startTime = ts;
      const progress = Math.min((ts - startTime) / duration, 1);
      // easeOutExpo for smoother ending
      const eased = progress === 1 ? 1 : 1 - Math.pow(2, -10 * progress);
      setValue(eased * end);
      if (progress < 1) requestAnimationFrame(step);
    };
    requestAnimationFrame(step);
  }, [started, end, duration]);

  const display = value.toFixed(decimals);

  return (
    <div ref={ref} className="flex flex-col items-center text-center">
      <div className="flex items-baseline gap-1">
        <span
          className="font-[family-name:var(--font-jakarta)] font-extrabold leading-none"
          style={{ fontSize: "52px", color }}
        >
          {display}
        </span>
        {suffix && (
          <span
            className="font-[family-name:var(--font-jakarta)] font-bold text-3xl"
            style={{ color }}
          >
            {suffix}
          </span>
        )}
      </div>
      <p className="mt-2 text-[#8A8A8A] text-sm leading-snug whitespace-pre-line">
        {label}
      </p>
    </div>
  );
}
