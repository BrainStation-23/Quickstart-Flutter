import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:qs_flutter/core/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_context.dart';
import '../../values/app_colors.dart';
import '../../values/app_values.dart';
import '../../values/text_styles.dart';
class BaseMarkdown extends StatelessWidget {
  final String screenTitle;
  final String? markdownSource;

  const BaseMarkdown({
    super.key,
    required this.screenTitle,
    this.markdownSource,
  });

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: SizedBox(
        height: AppValues.appHeight,
        width: AppValues.appWidth,
        child: markdownSource != null
            ? Markdown(
          data: markdownSource ?? "",
          padding: const EdgeInsets.all(AppValues.padding),
          onTapLink: (text, href, title) async {
            if (href != null) {
              final Uri url = Uri.parse(href);
              try {
                await _launchInBrowser(url);
              } catch (e) {
                showSnackBarMessage(
                  context,
                  "Unable to open link: $href",
                  SnackBarMessageType.failure,
                );
              }
            }
          },
        )
            : const Center(
          child: Text(
            "No content to show",
            style: titleStyle,
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Theme.of(AppContext.context).colorScheme.surface,
      backgroundColor: AppColors.colorPrimary,
      title: Text(screenTitle),
      centerTitle: true,
    );
  }
}