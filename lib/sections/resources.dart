import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';

class ResourcesSectionContent extends StatelessWidget {
  const ResourcesSectionContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: Text('Próximamente...', style: TextStyle(fontSize: 18, color: EnedColors.blue)),
      ),
    );
  }
}
