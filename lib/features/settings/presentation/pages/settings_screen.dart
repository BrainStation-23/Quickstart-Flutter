import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qs_flutter/core/base/blocs/base_bloc.dart';
import 'package:qs_flutter/core/base/blocs/base_event.dart';
import 'package:qs_flutter/core/base/blocs/base_state.dart';
import 'package:qs_flutter/core/base/widgets/base_markdown.dart';
import 'package:qs_flutter/core/values/text_styles.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  late AppLocalizations? _appLocalizations;

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return SafeArea(
      child: BlocBuilder<BaseBloc, BaseState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(),
                const Divider(),
                _buildItem(
                    title: _appLocalizations?.changeLanguage ?? "",
                    icon: Icons.language,
                    onClick: () {
                      context.read<BaseBloc>().add(ChangeLanguageEvent(
                          locale: Locale(state.locale == const Locale('bn')
                              ? 'en'
                              : 'bn')));
                    }),
                _buildItem(
                    title: _appLocalizations?.changeTheme ?? "",
                    icon: Icons.dark_mode_outlined,
                    onClick: () {
                      context.read<BaseBloc>().add(ChangeThemeEvent(
                          themeMode: state.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light));
                    }),
                _buildItem(
                    title: _appLocalizations?.savedCard ?? "",
                    icon: Icons.wallet,
                    onClick: () {}),
                _buildItem(
                    title: _appLocalizations?.privacyPolicy ?? "",
                    icon: Icons.privacy_tip,
                    onClick: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BaseMarkdown(
                          screenTitle: "Privacy Policy ",
                          markdownSource: testMarkDown,
                        );
                      }));
                    }),
                _buildItem(
                    title: _appLocalizations?.termsAndConditions ?? "",
                    icon: Icons.indeterminate_check_box_sharp,
                    onClick: () {}),
                _buildItem(
                    title: _appLocalizations?.aboutUs ?? "",
                    icon: Icons.details,
                    onClick: () {}),
                _buildItem(
                    title: _appLocalizations?.logOut ?? "",
                    icon: Icons.output_sharp,
                    onClick: () {}),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildItem(
      {required String title,
      required IconData icon,
      required Function() onClick}) {
    return IconButton(
      onPressed: onClick,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Md. Shahin Bashar",
                    style: titleStyle,
                  ),
                  Text("Associate Software Engineer"),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

final testMarkDown = """
## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.js`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.

                            """;
