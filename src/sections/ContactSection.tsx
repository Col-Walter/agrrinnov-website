"use client";

import { useState, useEffect, FormEvent } from "react";
import ScrollReveal from "@/components/ScrollReveal";

/* ─── Static data ─────────────────────────────────────────────────── */
const SERVICE_CHIPS = [
  { label: "DiARIS",   color: "#1FA34A" },
  { label: "FARE",     color: "#FFC107" },
  { label: "Advisory", color: "#FF6A00" },
  { label: "Général",  color: "#AAAAAA" },
];

const CONTACT_INFO = [
  { icon: "✉️", label: "Email",        value: "contact@agrinnov.tech",         color: "#1FA34A" },
  { icon: "📞", label: "Téléphone",    value: "+229 01 40 79 37 31",            color: "#FF6A00" },
  { icon: "📍", label: "Siège social", value: "Godomey, Tankpè, Abomey-Calavi, Bénin", color: "#FFC107" },
];

const SERVICES_LIST = [
  { name: "DiARIS",   color: "#1FA34A", desc: "Agronomie de précision" },
  { name: "FARE",     color: "#FFC107", desc: "Incubateur agropreneurs" },
  { name: "Advisory", color: "#FF6A00", desc: "Conseil agro-management" },
];

/* ─── ServiceChip ─────────────────────────────────────────────────── */
function ServiceChip({
  label,
  color,
  active,
  onSelect,
}: {
  label: string;
  color: string;
  active: boolean;
  onSelect: () => void;
}) {
  const [hov, setHov] = useState(false);

  return (
    <button
      type="button"
      onMouseDown={(e) => {
        // Use onMouseDown to guarantee the event fires before any blur/focus shenanigans
        e.preventDefault();
        onSelect();
      }}
      onMouseEnter={() => setHov(true)}
      onMouseLeave={() => setHov(false)}
      style={{
        padding: "9px 20px",
        borderRadius: "9999px",
        fontSize: "13px",
        fontWeight: 600,
        fontFamily: "var(--font-jakarta), sans-serif",
        letterSpacing: "0.01em",
        border: `1.5px solid ${active ? color : hov ? "#777" : "#3A3A3A"}`,
        background: active
          ? color + "22"
          : hov
          ? "rgba(255,255,255,0.06)"
          : "rgba(255,255,255,0.02)",
        color: active ? color : hov ? "#FFFFFF" : "#BBBBBB",
        cursor: "pointer",
        userSelect: "none",
        outline: "none",
        transition: "border 0.18s, background 0.18s, color 0.18s, transform 0.12s",
        transform: active ? "scale(1.05)" : "scale(1)",
        boxShadow: active ? `0 0 12px ${color}33` : "none",
        position: "relative",
        zIndex: 10,
      }}
    >
      {label}
    </button>
  );
}

/* ─── Field ───────────────────────────────────────────────────────── */
function Field({
  label,
  placeholder,
  value,
  onChange,
  type = "text",
  required = false,
  multiline = false,
}: {
  label: string;
  placeholder: string;
  value: string;
  onChange: (v: string) => void;
  type?: string;
  required?: boolean;
  multiline?: boolean;
}) {
  const base =
    "w-full bg-[#242424] border border-[#2E2E2E] rounded-lg px-4 py-3 text-sm text-white placeholder-[#8A8A8A] outline-none focus:border-[#1FA34A] transition-colors duration-200";
  return (
    <div className="flex flex-col gap-1.5 flex-1">
      <label className="text-xs text-[#8A8A8A]">{label}</label>
      {multiline ? (
        <textarea
          className={base}
          placeholder={placeholder}
          value={value}
          onChange={(e) => onChange(e.target.value)}
          rows={4}
          required={required}
        />
      ) : (
        <input
          className={base}
          type={type}
          placeholder={placeholder}
          value={value}
          onChange={(e) => onChange(e.target.value)}
          required={required}
        />
      )}
    </div>
  );
}

/* ─── ContactSection ──────────────────────────────────────────────── */
export default function ContactSection() {
  const [selectedService, setSelectedService] = useState("Général");
  const [submitted, setSubmitted] = useState(false);
  const [form, setForm] = useState({ name: "", email: "", subject: "", message: "" });

  /* Pre-select service from URL param, e.g. /?service=diaris */
  useEffect(() => {
    if (typeof window === "undefined") return;
    const param = new URLSearchParams(window.location.search).get("service");
    if (!param) return;
    const match = SERVICE_CHIPS.find(
      (c) => c.label.toLowerCase() === param.toLowerCase()
    );
    if (match) setSelectedService(match.label);
  }, []);

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (!form.name || !form.email || !form.message) return;

    const prefix =
      selectedService === "Général"
        ? "[Agrinnov - Contact Général]"
        : `[Agrinnov - Service ${selectedService}]`;

    const subject = `${prefix} ${form.subject || "Demande de contact"}`;
    const body = [
      `Nom complet : ${form.name}`,
      `Email : ${form.email}`,
      `Service concerné : ${selectedService}`,
      "",
      "Message :",
      form.message,
      "",
      "--",
      "Message envoyé via le formulaire du site Agrinnov.",
    ].join("\n");

    window.location.href = `mailto:contact@agrinnov.tech?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
    setSubmitted(true);
  };

  return (
    <section
      id="contact"
      className="py-24"
      style={{ background: "linear-gradient(to bottom, #0A0A0A, #111111)" }}
    >
      <div className="max-w-[1200px] mx-auto px-6 md:px-16">

        {/* ── Header ── */}
        <ScrollReveal className="text-center mb-16">
          <p className="text-xs font-[family-name:var(--font-jakarta)] font-semibold text-[#1FA34A] tracking-[4px] uppercase mb-4">
            Contact
          </p>
          <h2
            className="font-[family-name:var(--font-jakarta)] font-extrabold text-white mb-4"
            style={{ fontSize: "clamp(26px,4vw,42px)" }}
          >
            Parlons de votre<br />projet agricole
          </h2>
          <p className="text-[#8A8A8A] text-lg max-w-lg mx-auto">
            Notre équipe est à votre disposition pour vous accompagner vers l&apos;agriculture de demain.
          </p>
        </ScrollReveal>

        {/* ── Two-column layout ── */}
        <div className="flex flex-col md:flex-row gap-16">

          {/* Left: contact info */}
          <ScrollReveal className="flex-[2]">
            <h3 className="font-[family-name:var(--font-jakarta)] font-bold text-xl text-white mb-8">
              Nos coordonnées
            </h3>
            <div className="flex flex-col gap-5 mb-10">
              {CONTACT_INFO.map((c) => (
                <div key={c.label} className="flex items-start gap-4">
                  <div
                    className="w-10 h-10 rounded-xl flex items-center justify-center text-base shrink-0"
                    style={{ background: c.color + "20" }}
                  >
                    {c.icon}
                  </div>
                  <div>
                    <p className="text-xs text-[#8A8A8A] mb-0.5">{c.label}</p>
                    <p className="text-sm text-white font-medium">{c.value}</p>
                  </div>
                </div>
              ))}
            </div>

            <h4 className="font-[family-name:var(--font-jakarta)] font-semibold text-white text-sm mb-4">
              Nos services
            </h4>
            <div className="flex flex-col gap-3">
              {SERVICES_LIST.map((s) => (
                <div key={s.name} className="flex items-center gap-3">
                  <span className="w-2 h-2 rounded-full shrink-0" style={{ background: s.color }} />
                  <div>
                    <span className="text-sm font-semibold" style={{ color: s.color }}>{s.name}</span>
                    <span className="text-sm text-[#8A8A8A] ml-2">{s.desc}</span>
                  </div>
                </div>
              ))}
            </div>
          </ScrollReveal>

          {/* Right: form — NO ScrollReveal wrapper to avoid pointer-event interference */}
          <div className="flex-[3]">
            <div
              className="rounded-3xl p-8 md:p-10 border border-[#2E2E2E]"
              style={{ background: "#1A1A1A" }}
            >
              {submitted ? (
                <div className="flex flex-col items-center py-10 text-center">
                  <div
                    className="w-16 h-16 rounded-full flex items-center justify-center text-3xl mb-6"
                    style={{ background: "linear-gradient(135deg,#1FA34A,#27C55B)" }}
                  >
                    ✓
                  </div>
                  <h3 className="font-[family-name:var(--font-jakarta)] font-bold text-2xl text-white mb-3">
                    E-mail préparé !
                  </h3>
                  <p className="text-[#8A8A8A] max-w-sm mx-auto leading-relaxed">
                    Votre application de messagerie a été ouverte. Envoyez l&apos;e-mail pour nous
                    transmettre votre demande concernant le service{" "}
                    <strong style={{ color: "#fff" }}>{selectedService}</strong>.
                  </p>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="flex flex-col gap-5">
                  <h3 className="font-[family-name:var(--font-jakarta)] font-semibold text-white text-lg mb-1">
                    Envoyez-nous un message
                  </h3>

                  <div className="flex flex-col sm:flex-row gap-4">
                    <Field label="Nom complet" placeholder="Votre nom"
                      value={form.name} onChange={(v) => setForm({ ...form, name: v })} required />
                    <Field label="Email" placeholder="votre@email.com" type="email"
                      value={form.email} onChange={(v) => setForm({ ...form, email: v })} required />
                  </div>

                  <Field label="Objet" placeholder="Objet de votre message"
                    value={form.subject} onChange={(v) => setForm({ ...form, subject: v })} />

                  {/* ── Service chips ── */}
                  <div>
                    <p style={{ fontSize: "12px", color: "#8A8A8A", marginBottom: "10px" }}>
                      Service concerné
                    </p>
                    <div style={{ display: "flex", flexWrap: "wrap", gap: "8px" }}>
                      {SERVICE_CHIPS.map(({ label, color }) => (
                        <ServiceChip
                          key={label}
                          label={label}
                          color={color}
                          active={selectedService === label}
                          onSelect={() => setSelectedService(label)}
                        />
                      ))}
                    </div>
                  </div>

                  <Field label="Message" placeholder="Décrivez votre projet ou votre question..."
                    value={form.message} onChange={(v) => setForm({ ...form, message: v })}
                    multiline required />

                  <button
                    type="submit"
                    className="w-full py-4 rounded-xl text-sm font-[family-name:var(--font-jakarta)] font-semibold text-white flex items-center justify-center gap-2 transition-all duration-200 hover:scale-[1.02]"
                    style={{ background: "linear-gradient(135deg,#1FA34A,#27C55B)" }}
                    onMouseEnter={(e) => {
                      (e.currentTarget as HTMLElement).style.boxShadow = "0 8px 24px rgba(31,163,74,0.4)";
                    }}
                    onMouseLeave={(e) => {
                      (e.currentTarget as HTMLElement).style.boxShadow = "none";
                    }}
                  >
                    Envoyer le message <span>✈</span>
                  </button>
                </form>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
