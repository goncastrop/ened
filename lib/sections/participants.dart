import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

class ParticipantsSectionContent extends StatelessWidget {
  const ParticipantsSectionContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: Seo.text(
          text: 'Próximamente...',
          child: Text('Próximamente...', style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
