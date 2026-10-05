"use client";

import { useState } from "react";
import Link from "next/link";

interface ShareBarProps {
  pageUrl: string;
  pageTitle: string;
  alternateSlug: string;
  alternateLabel: string;
}

export default function ShareBar({
  pageUrl,
  pageTitle,
  alternateSlug,
  alternateLabel,
}: ShareBarProps) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      if (typeof navigator !== "undefined" && navigator.clipboard) {
        await navigator.clipboard.writeText(pageUrl);
        setCopied(true);
        setTimeout(() => setCopied(false), 2500);
      }
    } catch {
      setCopied(false);
    }
  };

  const handleShare = async () => {
    if (typeof navigator !== "undefined" && navigator.share) {
      try {
        await navigator.share({
          title: pageTitle,
          url: pageUrl,
        });
        return;
      } catch {
        // user cancelled or share failed, fallback to copy
      }
    }
    handleCopy();
  };

  const handlePrint = () => {
    if (typeof window !== "undefined") {
      window.print();
    }
  };

  return (
    <div className="flex flex-wrap items-center justify-between gap-4 p-4 md:p-5 rounded-2xl bg-[#1A1A1A] border border-[#2E2E2E] mb-12">
      <div className="flex flex-wrap items-center gap-2">
        {/* Copy link button */}
        <button
          onClick={handleCopy}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs md:text-sm font-[family-name:var(--font-jakarta)] font-semibold transition-all duration-200 cursor-pointer"
          style={{
            background: copied ? "rgba(31,163,74,0.2)" : "#242424",
            border: `1px solid ${copied ? "#1FA34A" : "#383838"}`,
            color: copied ? "#27C55B" : "#FFFFFF",
          }}
        >
          <span>{copied ? "✓" : "🔗"}</span>
          <span>{copied ? "Lien copié !" : "Copier le lien de partage"}</span>
        </button>

        {/* Share native button */}
        <button
          onClick={handleShare}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs md:text-sm font-[family-name:var(--font-jakarta)] font-medium text-[#CCCCCC] hover:text-white bg-[#242424] hover:bg-[#2C2C2C] border border-[#383838] transition-colors cursor-pointer"
        >
          <span>↗</span>
          <span>Partager</span>
        </button>

        {/* Print button */}
        <button
          onClick={handlePrint}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs md:text-sm font-[family-name:var(--font-jakarta)] font-medium text-[#8A8A8A] hover:text-white bg-[#242424] hover:bg-[#2C2C2C] border border-[#383838] transition-colors cursor-pointer"
        >
          <span>🖨️</span>
          <span>Imprimer</span>
        </button>
      </div>

      {/* Alternate link */}
      <Link
        href={alternateSlug}
        className="inline-flex items-center gap-1 text-xs md:text-sm text-[#1FA34A] hover:text-[#27C55B] font-[family-name:var(--font-jakarta)] font-medium hover:underline transition-colors"
      >
        <span>Consulter : {alternateLabel}</span>
        <span>→</span>
      </Link>
    </div>
  );
}
