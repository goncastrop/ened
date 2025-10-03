import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Container(
          color: Colors.white,
          width: double.infinity,
          height: isMobile ? null : 500,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16.0 : 0.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  'assets/banner.jpeg',
                  height: isMobile ? null : 400,
                  width: isMobile ? double.infinity : null,
                  fit: isMobile ? BoxFit.cover : BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
