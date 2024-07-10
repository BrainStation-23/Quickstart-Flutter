import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlOnPressWidget extends StatelessWidget {
  const LaunchUrlOnPressWidget({super.key, required this.url, required this.child,});
  final String url;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: child,
    );
  }

  void _launchUrl()async{
    if(await canLaunchUrl(Uri.parse(url))){
      launchUrl(Uri.parse(url));
    }
  }
}
