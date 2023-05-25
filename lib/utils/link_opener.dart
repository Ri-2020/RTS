import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> openLink(url) async {
    final uriParsed = Uri.parse(url!);
    if (await canLaunchUrl(uriParsed)) {
      await launchUrl(uriParsed);
    }
  }
}
