"use client";

import Image from "next/image";
import { useState } from "react";
import LegalModal from "./LegalModal";

const socialLinks = [
  {
    name: "Facebook",
    url: "https://facebook.com/agrinnovbj",
    color: "#1877F2",
    icon: "/images/icon_facebook.png",
  },
  {
    name: "LinkedIn",
    url: "https://www.linkedin.com/company/agrinnovbj/",
    color: "#0A66C2",
    icon: "/images/icon_linkedin.png",
  },
  {
    name: "WhatsApp",
    url: "https://wa.me/22940793731",
    color: "#25D366",
    icon: "/images/icon_whatsapp.png",
  },
];

const navLinks = [
  { label: "Accueil", href: "/#home" },
  { label: "Nos Services", href: "/#services" },
  { label: "Notre Vision", href: "/#vision" },
  { label: "Contact", href: "/#contact" },
];

const serviceLinks = [
  { label: "DiARIS", href: "/diaris", color: "#1FA34A" },
  { label: "FARE", href: "/fare", color: "#FFC107" },
  { label: "Advisory", href: "/advisory", color: "#FF6A00" },
];

export default function Footer() {
  const [legalOpen, setLegalOpen] = useState(false);
  const [privacyOpen, setPrivacyOpen] = useState(false);

  const handleScroll = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
    const hash = href.split("#")[1];
    if (!hash) return;
    const el = document.getElementById(hash);
    if (el) {
      e.preventDefault();
      el.scrollIntoView({ behavior: "smooth" });
    }
  };

  return (
    <>
      <footer
        className="border-t border-[#2E2E2E]"
        style={{ background: "#0A0A0A" }}
      >
        <div className="max-w-[1200px] mx-auto px-6 md:px-16 py-12">
          {/* Main columns */}
          <div className="flex flex-col md:flex-row gap-12">
            {/* Brand */}
            <div className="flex-[2]">
              <div className="relative h-[70px] w-[180px] mb-4">
                <Image
                  src="/images/logo_principal.png"
                  alt="Agrinnov"
                  fill
                  className="object-contain object-left"
                />
              </div>
              <p className="text-sm text-[#8A8A8A] leading-relaxed mb-6">
                L'innovation au cœur
                <br />
                de l'agriculture de demain.
              </p>
              <div className="flex gap-3">
                {socialLinks.map((s) => (
                  <SocialIcon key={s.name} {...s} />
                ))}
              </div>
            </div>

            {/* Navigation */}
            <div className="flex-1">
              <h3 className="text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white mb-4">
                Navigation
              </h3>
              <ul className="flex flex-col gap-3">
                {navLinks.map((l) => (
                  <li key={l.label}>
                    <a
                      href={l.href}
                      onClick={(e) => handleScroll(e, l.href)}
                      className="text-sm text-[#8A8A8A] hover:text-white transition-colors duration-200"
                    >
                      {l.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Services */}
            <div className="flex-1">
              <h3 className="text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white mb-4">
                Nos Services
              </h3>
              <ul className="flex flex-col gap-3">
                {serviceLinks.map((s) => (
                  <li key={s.label}>
                    <a
                      href={s.href}
                      className="flex items-center gap-2 text-sm text-[#8A8A8A] hover:text-white transition-colors duration-200 group"
                    >
                      <span
                        className="w-1.5 h-1.5 rounded-full shrink-0"
                        style={{ background: s.color }}
                      />
                      <span
                        className="transition-colors duration-200"
                        style={{ color: "inherit" }}
                        onMouseEnter={(e) =>
                          ((e.target as HTMLElement).style.color = s.color)
                        }
                        onMouseLeave={(e) =>
                          ((e.target as HTMLElement).style.color = "")
                        }
                      >
                        {s.label}
                      </span>
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Divider */}
          <div className="mt-12 border-t border-[#2E2E2E] pt-6 flex flex-col md:flex-row items-center justify-between gap-4">
            <p className="text-xs text-[#8A8A8A]">
              © {new Date().getFullYear()} Agrinnov. Tous droits réservés.
            </p>
            <div className="flex items-center gap-4">
              <button
                onClick={() => setLegalOpen(true)}
                className="text-xs text-[#8A8A8A] hover:text-[#1FA34A] transition-colors"
              >
                Mentions légales
              </button>
              <button
                onClick={() => setPrivacyOpen(true)}
                className="text-xs text-[#8A8A8A] hover:text-[#1FA34A] transition-colors"
              >
                Confidentialité
              </button>
              <a
                href="mailto:contact@agrinnov.tech"
                className="text-xs text-[#8A8A8A] hover:text-[#1FA34A] transition-colors"
              >
                contact@agrinnov.tech
              </a>
            </div>
          </div>
        </div>
      </footer>

      {legalOpen && (
        <LegalModal initialTab={0} onClose={() => setLegalOpen(false)} />
      )}
      {privacyOpen && (
        <LegalModal initialTab={1} onClose={() => setPrivacyOpen(false)} />
      )}
    </>
  );
}

function SocialIcon({
  name,
  url,
  color,
  icon,
}: {
  name: string;
  url: string;
  color: string;
  icon: string;
}) {
  return (
    <a
      href={url}
      target="_blank"
      rel="noopener noreferrer"
      aria-label={name}
      className="relative w-11 h-11 rounded-xl flex items-center justify-center overflow-hidden transition-all duration-200 hover:scale-110 hover:shadow-lg"
      style={{ background: color }}
      onMouseEnter={(e) => {
        (e.currentTarget as HTMLElement).style.boxShadow = `0 4px 16px ${color}66`;
      }}
      onMouseLeave={(e) => {
        (e.currentTarget as HTMLElement).style.boxShadow = "none";
      }}
    >
      <Image src={icon} alt={name} width={22} height={22} className="object-contain" />
    </a>
  );
}
