"use client";

import { useEffect, useRef, useState, ReactNode } from "react";

interface ScrollRevealProps {
  children: ReactNode;
  delay?: number;
  className?: string;
}

export default function ScrollReveal({
  children,
  delay = 0,
  className = "",
}: ScrollRevealProps) {
  const ref = useRef<HTMLDivElement>(null);
  const [revealed, setRevealed] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    const el = ref.current;
    if (!el) return;

    // Safety fallback: if it doesn't reveal in 1.2s, reveal it anyway
    const safetyTimeout = setTimeout(() => {
      setRevealed(true);
    }, 1200);

    if (typeof window === "undefined" || !("IntersectionObserver" in window)) {
      setRevealed(true);
      clearTimeout(safetyTimeout);
      return;
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setTimeout(() => {
            setRevealed(true);
            clearTimeout(safetyTimeout);
          }, delay);
          observer.unobserve(el);
        }
      },
      { threshold: 0.02 } // Trigger as soon as 2% is visible
    );

    observer.observe(el);

    return () => {
      observer.disconnect();
      clearTimeout(safetyTimeout);
    };
  }, [delay]);

  // Keep it visible by default during SSR for SEO,
  // and only apply opacity 0 when mounted and not yet revealed.
  const isVisible = !mounted || revealed;

  return (
    <div
      ref={ref}
      className={className}
      style={{
        opacity: isVisible ? 1 : 0,
        transform: isVisible ? "translateY(0)" : "translateY(24px)",
        transition: "opacity 0.8s cubic-bezier(0.16, 1, 0.3, 1), transform 0.8s cubic-bezier(0.16, 1, 0.3, 1)",
      }}
    >
      {children}
    </div>
  );
}
