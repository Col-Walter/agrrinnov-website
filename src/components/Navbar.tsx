"use client";

import { useState, useEffect } from "react";
import Image from "next/image";
import Link from "next/link";

const navLinks = [
  { label: "Accueil", href: "/#home" },
  { label: "Nos Services", href: "/#services" },
  { label: "Notre Vision", href: "/#vision" },
  { label: "Contact", href: "/#contact" },
];

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const handleScroll = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
    const hash = href.split("#")[1];
    if (!hash) return;
    const el = document.getElementById(hash);
    if (el) {
      e.preventDefault();
      el.scrollIntoView({ behavior: "smooth" });
      setMenuOpen(false);
    }
  };

  return (
    <header
      className="fixed top-0 left-0 right-0 z-50 transition-all duration-300"
      style={{
        background: scrolled
          ? "rgba(17, 17, 17, 0.92)"
          : "rgba(17, 17, 17, 0.6)",
        backdropFilter: "blur(12px)",
        WebkitBackdropFilter: "blur(12px)",
        borderBottom: "1px solid #2E2E2E",
      }}
    >
      <nav className="max-w-[1200px] mx-auto px-6 md:px-16 h-[70px] flex items-center justify-between">
        {/* Logo */}
        <Link href="/" className="flex items-center">
          <div className="relative h-[52px] w-[140px]">
            <Image
              src="/images/logo_principal.png"
              alt="Agrinnov"
              fill
              className="object-contain object-left"
              priority
            />
          </div>
        </Link>

        {/* Desktop nav */}
        <ul className="hidden md:flex items-center gap-8">
          {navLinks.map((link) => (
            <li key={link.label}>
              <a
                href={link.href}
                onClick={(e) => handleScroll(e, link.href)}
                className="text-sm font-[family-name:var(--font-jakarta)] font-semibold text-[#8A8A8A] hover:text-white transition-colors duration-200"
              >
                {link.label}
              </a>
            </li>
          ))}
        </ul>

        {/* CTA */}
        <a
          href="/#contact"
          onClick={(e) => handleScroll(e, "/#contact")}
          className="hidden md:inline-flex items-center gap-2 px-5 py-2 rounded-full text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white transition-all duration-200 hover:shadow-lg"
          style={{
            background: "linear-gradient(135deg, #1FA34A, #27C55B)",
            boxShadow: "0 0 0 rgba(31,163,74,0)",
          }}
          onMouseEnter={(e) => {
            (e.target as HTMLElement).style.boxShadow = "0 4px 20px rgba(31,163,74,0.4)";
          }}
          onMouseLeave={(e) => {
            (e.target as HTMLElement).style.boxShadow = "0 0 0 rgba(31,163,74,0)";
          }}
        >
          Nous contacter
        </a>

        {/* Mobile burger */}
        <button
          className="md:hidden flex flex-col gap-[5px] p-2"
          aria-label="Toggle menu"
          onClick={() => setMenuOpen(!menuOpen)}
        >
          <span
            className="block w-6 h-[2px] bg-white transition-all duration-300"
            style={{ transform: menuOpen ? "rotate(45deg) translateY(7px)" : undefined }}
          />
          <span
            className="block w-6 h-[2px] bg-white transition-all duration-300"
            style={{ opacity: menuOpen ? 0 : 1 }}
          />
          <span
            className="block w-6 h-[2px] bg-white transition-all duration-300"
            style={{ transform: menuOpen ? "rotate(-45deg) translateY(-7px)" : undefined }}
          />
        </button>
      </nav>

      {/* Mobile menu */}
      <div
        className="md:hidden overflow-hidden transition-all duration-300"
        style={{ maxHeight: menuOpen ? "400px" : "0" }}
      >
        <ul
          className="flex flex-col px-6 pb-6 gap-4 border-t border-[#2E2E2E]"
          style={{ background: "rgba(17,17,17,0.98)" }}
        >
          {navLinks.map((link) => (
            <li key={link.label} className="pt-4">
              <a
                href={link.href}
                onClick={(e) => handleScroll(e, link.href)}
                className="text-base font-[family-name:var(--font-jakarta)] font-semibold text-[#8A8A8A] hover:text-white transition-colors"
              >
                {link.label}
              </a>
            </li>
          ))}
          <li className="pt-2">
            <a
              href="/#contact"
              onClick={(e) => handleScroll(e, "/#contact")}
              className="inline-flex px-6 py-3 rounded-full text-sm font-semibold text-white"
              style={{ background: "linear-gradient(135deg,#1FA34A,#27C55B)" }}
            >
              Nous contacter
            </a>
          </li>
        </ul>
      </div>
    </header>
  );
}
