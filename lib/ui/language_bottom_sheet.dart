import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeAppLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? selecteLanguage(AppLocalizations.of(context)!.english)
                : unSelecteLanguage(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeAppLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? selecteLanguage(AppLocalizations.of(context)!.arabic)
                : unSelecteLanguage(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selecteLanguage(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
        ),
        Icon(
          Icons.check,
          color: Colors.black45,
        ),
      ],
    );
  }

  Widget unSelecteLanguage(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
