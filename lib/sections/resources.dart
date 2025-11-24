import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesSectionContent extends StatelessWidget {
  const ResourcesSectionContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Seo.text(
              text: 'Vas a poder encontrar las charlas del encuentro en nuestro canal de youtube',
              child: Text(
                'Vas a poder encontrar las charlas del encuentro en nuestro canal de youtube',
                style: TextStyle(fontSize: 18, color: EnedColors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Seo.link(
              anchor: 'Canal de YouTube ENED',
              href: 'https://youtube.com/@ened-arg?si=zr3MQ-zanEkknM9F',
              child: InkWell(
                onTap: () => launchUrl(Uri.parse('https://youtube.com/@ened-arg?si=zr3MQ-zanEkknM9F')),
                child: Text(
                  'Ir al canal de YouTube',
                  style: TextStyle(
                    fontSize: 18,
                    color: EnedColors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            HtmlWidget(
              '''
<iframe width="560" height="315" src="https://www.youtube.com/embed/OY9K_73Z4Sw?si=PI3w6FBv1cMohZ2U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>''',
            ),
            SizedBox(height: 32),
            HtmlWidget(
              '''
<iframe width="560" height="315" src="https://www.youtube.com/embed/ZvVqmcUlZN0?si=mvOZFfZltxIZumVO&amp;start=112" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>''',
            ),
            SizedBox(height: 32),
            HtmlWidget(
              '''
<iframe width="560" height="315" src="https://www.youtube.com/embed/6dEkXZq1M4s?si=HLjPmsV0DSQYS-er" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>''',
            ),
            SizedBox(height: 32),
            HtmlWidget(
              '''
<iframe width="560" height="315" src="https://www.youtube.com/embed/NcDGsG26Rh4?si=SKtOPCD95TUGeUge" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>''',
            ),
          ],
        ),
      ),
    );
  }
}
