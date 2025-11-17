import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seo/seo.dart';

class PressCard extends StatelessWidget {
  const PressCard({
    super.key,
    required this.url,
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String url;
  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return SizedBox(
          width: isMobile ? double.infinity : 270,
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Seo.link(
              anchor: title,
              href: url,
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(url));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Seo.image(
                      src: imagePath,
                      alt: 'Imagen de prensa: $title',
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          imagePath,
                          height: isMobile ? 160 : 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(isMobile ? 16.0 : 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Seo.text(
                            text: title,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 12,
                                fontWeight: FontWeight.bold,
                                color: EnedColors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Seo.text(
                            text: description,
                            child: Text(
                              description,
                              style: TextStyle(color: EnedColors.blue, fontSize: isMobile ? 14 : 12),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Container(
                      height: isMobile ? 24 : 20,
                      width: double.infinity,
                      color: EnedColors.darkYellow,
                      child: Center(
                        child: Seo.text(
                          text: "LEER LA NOTA COMPLETA",
                          child: Text(
                            "LEER LA NOTA COMPLETA",
                            style: TextStyle(
                              fontSize: isMobile ? 10 : 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PressCardData {
  final String url;
  final String imagePath;
  final String title;
  final String description;

  const PressCardData({required this.url, required this.imagePath, required this.title, required this.description});
}

class PressSectionContent extends StatelessWidget {
  const PressSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PressCardData> news2024 = [
      PressCardData(
        url:
            "https://www.aciprensa.com/noticias/105458/argentina-influencers-catolicos-renovaron-el-fervor-por-la-mision-en-el-continente-digital",
        imagePath: 'assets/press/aciprensa.webp',
        title: 'ACI PRENSA',
        description: '"Influencers" católicos buscan en Argentina cómo evangelizar el "continente digital".',
      ),
      PressCardData(
        url: "https://aica.org/noticia-influencers-catolicos-disenan-estrategias-para-una-mejor-evangelizacion-digital",
        imagePath: 'assets/press/aica.jpeg',
        title: 'AICA',
        description: "'Influencers' católicos diseñan estrategias para una mejor evangelización digital.",
      ),
    ];
    final List<PressCardData> news2025 = [
      PressCardData(
        url: "https://aica.org/noticia-buenos-aires-tercer-encuentro-nacional-de-evangelizadores-digitales",
        imagePath: 'assets/press/aica2025.jpeg',
        title: 'AICA',
        description: 'Buenos Aires: Tercer Encuentro Nacional de Evangelizadores Digitales.',
      ),
      PressCardData(
        url: "https://ciudadnueva.com.ar/3-encuentro-nacional-de-evangelizadores-digitales/",
        imagePath: 'assets/press/ciudadnueva2025.jpg',
        title: 'Ciudad Nueva',
        description: '3° Encuentro Nacional de Evangelizadores Digitales.',
      ),
      PressCardData(
        url: "https://www.arzobispadocba.org.ar/nos-vemos-en-el-ened-el-encuentro-donde-la-fe-se-hace-digital/",
        imagePath: 'assets/press/aica2025.jpeg',
        title: 'Arzobispado de Córdoba',
        description: '¡Nos vemos en el ENED! El encuentro donde la fe se hace digital.',
      ),
      PressCardData(
        url:
            "https://www.aciprensa.com/noticias/118715/buenos-aires-sera-sede-del-iii-encuentro-nacional-de-evangelizadores-digitales",
        imagePath: 'assets/press/aciprensa2025.webp',
        title: 'ACI PRENSA',
        description: '“Discípulos de la esperanza en el mundo digital”: Llega a Buenos Aires el ENED 2025.',
      ),
      PressCardData(
        url:
            "https://www.vidanuevadigital.com/2025/11/10/argentina-los-evangelizadores-digitales-preparan-un-nuevo-encuentro/",
        imagePath: 'assets/press/aica2025.jpeg',
        title: 'Vida Nueva Digital',
        description: 'Los evangelizadores digitales de Argentina preparan un nuevo encuentro.',
      ),
    ];

    Widget buildNewsSet(String subtitle, List<PressCardData> cards, bool isMobile) {
      final List<Widget> pressCards =
          cards
              .map(
                (data) => PressCard(
                  url: data.url,
                  imagePath: data.imagePath,
                  title: data.title,
                  description: data.description,
                ),
              )
              .toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          isMobile ? Column(children: pressCards) : Wrap(spacing: 24, runSpacing: 24, children: pressCards),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        return Padding(
          padding: EdgeInsets.only(top: 32, right: isMobile ? 16 : 32, bottom: 32, left: isMobile ? 16 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNewsSet('Noticias 2025', news2025, isMobile),
              buildNewsSet('Noticias 2024', news2024, isMobile),
            ],
          ),
        );
      },
    );
  }
}
