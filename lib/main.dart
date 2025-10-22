import 'package:ened/design_system.dart';
import 'package:ened/sections/about.dart';
import 'package:ened/sections/banner.dart';
import 'package:ened/sections/participants.dart';
import 'package:ened/sections/press.dart';
import 'package:ened/sections/program.dart';
import 'package:ened/sections/resources.dart';
import 'package:ened/sections/section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seo/seo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SeoController(
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'ENED - Encuentro nacional de evangelizadores digitales',
        theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
        home: const MyHomePage(title: 'ENED - Encuentro nacional de evangelizadores digitales'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());
  final List<String> _sectionTitles = [
    'Sobre el evento',
    'Programa',
    'Inscripción',
    'Prensa',
    'Recursos',
    'Participantes',
  ];
  bool _isMenuOpen = false;

  void _scrollToSection(int index) {
    final keyContext = _sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(keyContext, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Seo.head(
          tags: [
            MetaTag(
              name: 'description',
              content:
                  'Encuentro nacional de evangelizadores digitales - Un espacio para evangelizadores y misioneros digitales, y todos aquellos que quieren compartir la fe en el mundo digital. Inscripciones abiertas.',
            ),
            MetaTag(
              name: 'keywords',
              content:
                  'evangelización digital, iglesia católica, redes sociales, evangelizadores, parroquias, formación digital, fe, catolicismo',
            ),
            MetaTag(name: 'author', content: 'ENED Argentina'),
            MetaTag(name: 'robots', content: 'index, follow'),
            MetaTag(name: 'viewport', content: 'width=device-width, initial-scale=1.0'),
            MetaTag(name: 'language', content: 'es'),
            MetaTag(name: 'geo.region', content: 'AR'),
            MetaTag(name: 'geo.country', content: 'Argentina'),
            MetaTag(name: 'geo.placename', content: 'Buenos Aires'),
            // Open Graph tags
            MetaTag(name: 'og:title', content: 'ENED - Encuentro nacional de evangelizadores digitales'),
            MetaTag(
              name: 'og:description',
              content:
                  'Encuentro nacional de evangelizadores digitales - Un espacio para evangelizadores y misioneros digitales. Inscripciones abiertas.',
            ),
            MetaTag(name: 'og:type', content: 'website'),
            MetaTag(name: 'og:url', content: 'https://www.ened.com.ar'),
            MetaTag(name: 'og:image', content: 'https://www.ened.com.ar/assets/assets/logo_redondo.png'),
            MetaTag(name: 'og:site_name', content: 'ENED'),
            MetaTag(name: 'og:locale', content: 'es_AR'),
            // Twitter Card tags
            MetaTag(name: 'twitter:card', content: 'summary_large_image'),
            MetaTag(name: 'twitter:title', content: 'ENED - Encuentro nacional de evangelizadores digitales'),
            MetaTag(
              name: 'twitter:description',
              content:
                  'Encuentro nacional de evangelizadores digitales - Un espacio para evangelizadores y misioneros digitales',
            ),
            MetaTag(name: 'twitter:image', content: 'https://www.ened.com.ar/assets/assets/logo_redondo.png'),
          ],
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Container(
                color: EnedColors.blue,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 768;

                    if (isMobile) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Seo.image(
                              src: 'assets/logo.png',
                              alt: 'ENED - Logo del Encuentro nacional de evangelizadores digitales',
                              child: Image.asset('assets/logo.png', height: 50),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                              icon: Icon(_isMenuOpen ? Icons.close : Icons.menu, color: Colors.white, size: 30),
                              onPressed: () {
                                setState(() {
                                  _isMenuOpen = !_isMenuOpen;
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Seo.image(
                            src: 'assets/logo.png',
                            alt: 'ENED - Logo del Encuentro nacional de evangelizadores digitales',
                            child: Image.asset('assets/logo.png', height: 50),
                          ),
                          const SizedBox(width: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_sectionTitles.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  ),
                                  onPressed: () => _scrollToSection(index),
                                  child: Text(
                                    _sectionTitles[index],
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const BannerSection(),
                      Section(
                        key: _sectionKeys[0],
                        title: "Sobre el evento",
                        isDark: true,
                        child: AboutSectionContent(registrationKey: _sectionKeys[2]),
                      ),
                      Section(key: _sectionKeys[1], title: "Programa", child: ProgramSectionContent()),
                      Section(key: _sectionKeys[3], title: "Prensa", isDark: true, child: PressSectionContent()),
                      Section(key: _sectionKeys[4], title: "Recursos", child: ResourcesSectionContent()),
                      Section(
                        key: _sectionKeys[5],
                        title: "Participantes",
                        isDark: true,
                        child: ParticipantsSectionContent(),
                      ),
                      const Footer(),
                    ],
                  ),
                ),
                // Mobile menu overlay
                if (_isMenuOpen)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: EnedColors.blue.withValues(alpha: 0.95),
                      child: Column(
                        children: List.generate(_sectionTitles.length, (index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.2), width: 1)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => _scrollToSection(index),
                              child: Text(
                                _sectionTitles[index],
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Container(
          color: EnedColors.darkBlue,
          height: isMobile ? 140 : 100,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 32.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child:
                    isMobile
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Seo.image(
                              src: 'assets/logo_redondo.png',
                              alt: 'ENED - Logo redondo del Encuentro nacional de evangelizadores digitales',
                              child: Image.asset('assets/logo_redondo.png', height: 80),
                            ),
                            const SizedBox(height: 12),
                            Seo.text(
                              text: 'ened.arg@gmail.com',
                              child: Text(
                                'ened.arg@gmail.com',
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Seo.image(
                              src: 'assets/logo_redondo.png',
                              alt: 'ENED - Logo redondo del Encuentro nacional de evangelizadores digitales',
                              child: Image.asset('assets/logo_redondo.png', height: 80),
                            ),
                            Seo.text(
                              text: 'ened.arg@gmail.com',
                              child: Text(
                                'ened.arg@gmail.com',
                                style: const TextStyle(color: Colors.white, fontSize: 18),
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
