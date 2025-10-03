import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(url));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      imagePath,
                      height: isMobile ? 160 : 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.all(isMobile ? 16.0 : 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 12,
                            fontWeight: FontWeight.bold,
                            color: EnedColors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(description, style: TextStyle(color: EnedColors.blue, fontSize: isMobile ? 14 : 12)),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Container(
                    height: isMobile ? 24 : 20,
                    width: double.infinity,
                    color: EnedColors.darkYellow,
                    child: Center(
                      child: Text(
                        "LEER LA NOTA COMPLETA",
                        style: TextStyle(fontSize: isMobile ? 10 : 8, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PressSectionContent extends StatelessWidget {
  const PressSectionContent({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Padding(
          padding: EdgeInsets.only(top: 32, right: isMobile ? 16 : 32, bottom: 32, left: isMobile ? 16 : 0),
          child:
              isMobile
                  ? Column(
                    children: [
                      PressCard(
                        url:
                            "https://www.aciprensa.com/noticias/105458/argentina-influencers-catolicos-renovaron-el-fervor-por-la-mision-en-el-continente-digital",
                        imagePath: 'assets/press/aciprensa.webp',
                        title: 'ACI PRENSA',
                        description:
                            '"Influencers" católicos buscan en Argentina cómo evangelizar el "continente digital".',
                      ),
                      const SizedBox(height: 16),
                      PressCard(
                        url:
                            "https://aica.org/noticia-influencers-catolicos-disenan-estrategias-para-una-mejor-evangelizacion-digital",
                        imagePath: 'assets/press/aica.jpeg',
                        title: 'AICA',
                        description:
                            "'Influencers' católicos diseñan estrategias para una mejor evangelización digital.",
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PressCard(
                        url:
                            "https://www.aciprensa.com/noticias/105458/argentina-influencers-catolicos-renovaron-el-fervor-por-la-mision-en-el-continente-digital",
                        imagePath: 'assets/press/aciprensa.webp',
                        title: 'ACI PRENSA',
                        description:
                            '"Influencers" católicos buscan en Argentina cómo evangelizar el "continente digital".',
                      ),
                      const SizedBox(width: 24),
                      PressCard(
                        url:
                            "https://aica.org/noticia-influencers-catolicos-disenan-estrategias-para-una-mejor-evangelizacion-digital",
                        imagePath: 'assets/press/aica.jpeg',
                        title: 'AICA',
                        description:
                            "'Influencers' católicos diseñan estrategias para una mejor evangelización digital.",
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
