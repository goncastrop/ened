import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

class ProgramSectionContent extends StatelessWidget {
  const ProgramSectionContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: Seo.text(
          text: 'Próximamente...',
          child: Text('Próximamente...', style: TextStyle(fontSize: 18, color: EnedColors.blue)),
        ),
      ),
    );
  }
}
