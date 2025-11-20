import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
          child: HtmlWidget('''
                  <div class="padlet-embed" style="border:1px solid rgba(0,0,0,0.1);border-radius:2px;box-sizing:border-box;overflow:hidden;position:relative;width:100%;background:#F4F4F4"><p style="padding:0;margin:0"><iframe src="https://padlet.com/embed/1b9eg2osgcn8xcvh" frameborder="0" allow="camera;microphone;geolocation;display-capture;clipboard-write" style="width:100%;height:608px;display:block;padding:0;margin:0"></iframe></p><div style="display:flex;align-items:center;justify-content:end;margin:0;height:28px"><a href="https://padlet.com?ref=embed" style="display:block;flex-grow:0;margin:0;border:none;padding:0;text-decoration:none" target="_blank"><div style="display:flex;align-items:center;"><img src="https://padlet.net/embeds/made_with_padlet_2022.png" width="114" height="28" style="padding:0;margin:0;background:0 0;border:none;box-shadow:none" alt="Hecho con Padlet"></div></a></div></div>
                '''),
        ),
      ),
    );
  }
}
