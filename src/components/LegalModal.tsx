"use client";

import { useState } from "react";
import Link from "next/link";
import { legalTabs } from "@/data/legalContent";

interface LegalModalProps {
  initialTab?: number;
  onClose: () => void;
}

export default function LegalModal({ initialTab = 0, onClose }: LegalModalProps) {
  const [activeTab, setActiveTab] = useState(initialTab);
  const [copied, setCopied] = useState(false);

  const currentTab = legalTabs[activeTab] || legalTabs[0];
  const pageUrl = `https://agrinnov.tech${currentTab.slug}`;

  const handleCopyLink = async () => {
    try {
      if (typeof navigator !== "undefined" && navigator.clipboard) {
        await navigator.clipboard.writeText(pageUrl);
        setCopied(true);
        setTimeout(() => setCopied(false), 2500);
      }
    } catch {
      // Fallback
      setCopied(false);
    }
  };

  return (
    <div
      className="fixed inset-0 z-[100] flex items-center justify-center p-4 md:p-12 animate-fade-in"
      style={{ background: "rgba(0,0,0,0.88)", backdropFilter: "blur(6px)" }}
      onClick={onClose}
    >
      <div
        className="w-full max-w-[880px] max-h-[85vh] flex flex-col rounded-3xl border border-[#2E2E2E] overflow-hidden shadow-2xl"
        style={{ background: "#111111" }}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="px-6 md:px-8 pt-6 pb-0 border-b border-[#2E2E2E] bg-[#141414]">
          <div className="flex items-center justify-between gap-4 mb-4">
            <div className="flex items-center gap-3">
              <span className="w-2.5 h-2.5 rounded-full bg-[#1FA34A]" />
              <h2 className="font-[family-name:var(--font-jakarta)] font-bold text-lg md:text-xl text-white">
                Informations légales & Conformité
              </h2>
            </div>
            
            <div className="flex items-center gap-2">
              {/* Copy link button */}
              <button
                onClick={handleCopyLink}
                title="Copier le lien direct de cette page pour la partager"
                className="hidden sm:inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-[family-name:var(--font-jakarta)] font-medium transition-all duration-200"
                style={{
                  background: copied ? "rgba(31,163,74,0.2)" : "#1E1E1E",
                  border: `1px solid ${copied ? "#1FA34A" : "#333333"}`,
                  color: copied ? "#27C55B" : "#CCCCCC",
                }}
              >
                <span>{copied ? "✓ Lien copié !" : "🔗 Copier le lien"}</span>
              </button>

              {/* Open page standalone */}
              <Link
                href={currentTab.slug}
                onClick={onClose}
                title="Ouvrir la page dédiée"
                className="inline-flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-[family-name:var(--font-jakarta)] text-[#8A8A8A] hover:text-white bg-[#1E1E1E] hover:bg-[#282828] border border-[#333333] transition-colors"
              >
                <span>Ouvrir la page</span>
                <span className="text-xs">↗</span>
              </Link>

              {/* Close button */}
              <button
                onClick={onClose}
                aria-label="Fermer"
                className="text-[#8A8A8A] hover:text-white transition-colors text-2xl leading-none w-8 h-8 rounded-full flex items-center justify-center hover:bg-[#222222]"
              >
                ×
              </button>
            </div>
          </div>

          {/* Tabs */}
          <div className="flex gap-6 overflow-x-auto">
            {legalTabs.map((tab, i) => (
              <button
                key={tab.id}
                onClick={() => {
                  setActiveTab(i);
                  setCopied(false);
                }}
                className="pb-3 text-sm font-[family-name:var(--font-jakarta)] font-semibold transition-colors duration-200 border-b-2 whitespace-nowrap cursor-pointer"
                style={{
                  color: activeTab === i ? "#1FA34A" : "#8A8A8A",
                  borderColor: activeTab === i ? "#1FA34A" : "transparent",
                }}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        {/* Content */}
        <div className="overflow-y-auto flex-1 p-6 md:p-8">
          {legalTabs[activeTab].sections.map((section, i) => (
            <div key={i} className="mb-6 last:mb-0">
              {section.title && (
                <h3 className="text-[#1FA34A] font-[family-name:var(--font-jakarta)] font-semibold text-base mb-2">
                  {section.title}
                </h3>
              )}
              {section.paragraphs.map((p, j) => (
                <p key={j} className="text-sm text-[#CCCCCC] leading-[1.7] mb-2">
                  {p}
                </p>
              ))}
            </div>
          ))}
        </div>

        {/* Footer info bar inside modal */}
        <div className="px-6 md:px-8 py-3.5 border-t border-[#2E2E2E] bg-[#141414] flex flex-wrap items-center justify-between gap-3 text-xs text-[#8A8A8A]">
          <div className="flex items-center gap-2">
            <span>Lien public partageable :</span>
            <code className="text-[#27C55B] bg-[#0A0A0A] px-2 py-0.5 rounded border border-[#2E2E2E] text-[11px]">
              {pageUrl}
            </code>
          </div>
          <button
            onClick={handleCopyLink}
            className="text-xs text-[#1FA34A] hover:underline font-semibold cursor-pointer"
          >
            {copied ? "Lien copié dans le presse-papier !" : "Copier ce lien pour l'envoyer"}
          </button>
        </div>
      </div>
    </div>
  );
}
