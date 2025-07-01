import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phone) async {
  Uri whatsappUrl = Uri.parse('https://wa.me/$phone');
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    throw "Could not open WhatsApp";
  }
}

void lunchCustomUrl(String url) async {
  Uri customUrl = Uri.parse(url);
  if (await canLaunchUrl(customUrl)) {
    await launchUrl(customUrl);
  } else {
    throw "Could not open WhatsApp";
  }
}
