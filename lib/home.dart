import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:multi_lingual_app/locale.dart';
import 'package:multi_lingual_app/remoteConfig.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FlutterLocalization flutterLocalization;
  late String currentValue;
  String title = ''; // Initialize with default value to avoid null errors
  String body = '';
  final RemoteConfigService remoteConfigService =
      RemoteConfigService(FirebaseRemoteConfig.instance);

  void setChange(String? value) async {
    if (value == null) return;

    // Assuming you have initialized and configured RemoteConfigService somewhere in your app.
    await remoteConfigService.fetchAndActivate();

    // Here, construct the keys for fetching localized text. For example:
    String titleKey = '${value}_title';
    String bodyKey = '${value}_body';

    // Fetch and set the localized texts
    setState(() {
      title = remoteConfigService.getLocalizedString(titleKey);
      body = remoteConfigService.getLocalizedString(bodyKey);
      currentValue = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterLocalization = FlutterLocalization.instance;
    currentValue = flutterLocalization.currentLocale!.languageCode;
    setChange(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          DropdownButton(
            value: currentValue,
            onChanged: (value) {
              setChange(value);
            },
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'hi',
                child: Text('Hindi'),
              ),
              DropdownMenuItem(
                value: 'tn',
                child: Text('Tamil'),
              )
            ],
          )
        ],
      ),
      body: Text(body),
    );
  }
}
