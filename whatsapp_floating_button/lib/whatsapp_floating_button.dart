library whatsapp_floating_button;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@override
class FloatingWhatsAppButton extends StatelessWidget {
  final String mobileNumber;
  final String message;

  const FloatingWhatsAppButton({
    Key? key,
    required this.mobileNumber,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _launchWhatsApp();
      },
      child: Icon(Icons.chat),
    );
  }

  void _launchWhatsApp() async {
    String url = "https://wa.me/$mobileNumber?text=${Uri.encodeFull(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
