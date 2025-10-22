import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seo/seo.dart';

class AboutCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int number;
  const AboutCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child:
                    isMobile
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Seo.image(
                              src: imagePath,
                              alt: 'Imagen ilustrativa para: $title',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(imagePath, width: double.infinity, height: 200, fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Seo.text(
                              text: title.toUpperCase(),
                              child: Text(
                                title.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: EnedColors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Seo.text(text: description, child: Text(description, style: GoogleFonts.openSans())),
                          ],
                        )
                        : IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Seo.image(
                                src: imagePath,
                                alt: 'Imagen ilustrativa para: $title',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(imagePath, width: 100, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Seo.text(
                                      text: title.toUpperCase(),
                                      child: Text(
                                        title.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: EnedColors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Seo.text(
                                      text: description,
                                      child: Text(description, style: GoogleFonts.openSans()),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
              ),
            ),
            Positioned(
              top: -8,
              left: -8,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: EnedColors.darkYellow,
                child: Text(
                  number.toString(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AboutSectionContent extends StatelessWidget {
  const AboutSectionContent({super.key, required this.registrationKey});
  final GlobalKey registrationKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        AboutCard(
          imagePath: 'assets/about/celular.jpeg',
          title: 'Si ya sos evangelizador digital',
          description:
              '(entiéndase: creación periódica de contenido pensado para la cultura digital, con un mensaje de fe alentador, alineado con el Magisterio de la Iglesia y que no promueva la separación y la condena): podés postularte para participar el finde completo. En este caso, después de completar el formulario, un equipo se comunicará con vos para confirmar o no la inscripción.',
          number: 1,
        ),
        const SizedBox(height: 16),
        AboutCard(
          imagePath: 'assets/about/mate.jpeg',
          title: 'Si sólo querés venir a compartir un rato con nosotros',
          description:
              'conversar, matear, encontrarnos y luego cerrar rezando juntos, te podés inscribir para el Espacio Abierto de 17 a 19 h.',
          number: 2,
        ),
        const SizedBox(height: 16),
        AboutCard(
          imagePath: 'assets/about/iglesia.jpeg',
          title: 'Si administrás redes parroquiales o querés comenzar un proyecto de evangelización digital',
          description:
              '''podés anotarte a los talleres del sábado a la tarde (de 14 a 17 h). Los temas de estos talleres abiertos son:
a. Introducción a la evangelización digital
b. Nociones básicas y recursos técnicos para evangelizadores digitales
c. Taller para responsables de cuentas de parroquias y grupos
''',
          number: 3,
        ),
        const SizedBox(height: 16),
        AboutCard(
          imagePath: 'assets/about/computadora.jpeg',
          title: 'Si no podés viajar a Buenos Aires ese fin de semana',
          description:
              'podés inscribirte para ser parte de la transmisión de los distintos momentos formativos que propondremos (los horarios y el canal los definiremos en breve).',
          number: 4,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 768;
            return Seo.link(
              anchor: "Inscribite aquí",
              href: 'https://forms.gle/h5wGx9QnPT1wrRdp6',
              child: FilledButton(
                key: registrationKey,
                style: FilledButton.styleFrom(
                  backgroundColor: EnedColors.darkYellow,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: isMobile ? 12 : 16),
                  textStyle: TextStyle(fontSize: isMobile ? 24 : 40, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () => {launchUrl(Uri.parse("https://forms.gle/h5wGx9QnPT1wrRdp6"))},
                child: Text('INSCRIBITE'),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        const Text(
          '*Los costos de hospedaje y comida durante esos 3 días están parcialmente subsidiados.',
          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Más cerca de la fecha se informará cuánto deberá abonar cada uno.',
          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
