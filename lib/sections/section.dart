import 'package:ened/design_system.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title, this.isDark = false, required this.child});

  final bool isDark;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          color: isDark ? EnedColors.blue : Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 24.0 : 32.0, horizontal: isMobile ? 16.0 : 0.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : EnedColors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(width: 80, height: 4, color: isDark ? Colors.white : EnedColors.blue),
                    child,
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
