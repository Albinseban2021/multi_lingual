import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  Future<void> fetchAndActivate() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 1),
      ));
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      print("Failed to fetch remote config: $e");
    }
  }

  String getLocalizedString(String key) {
    return _remoteConfig.getString(key);
  }
}
