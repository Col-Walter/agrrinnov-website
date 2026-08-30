import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import HeroSection from "@/sections/HeroSection";
import StatsSection from "@/sections/StatsSection";
import ServicesSection from "@/sections/ServicesSection";
import VisionSection from "@/sections/VisionSection";
import ContactSection from "@/sections/ContactSection";

export default function Home() {
  return (
    <>
      <Navbar />
      <main>
        <HeroSection />
        <StatsSection />
        <ServicesSection />
        <VisionSection />
        <ContactSection />
      </main>
      <Footer />
    </>
  );
}
