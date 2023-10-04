import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

// FirebaseRemoteConfigService firebaseRemoteConfigService(_) {
//   throw UnimplementedError();
// }

class FirebaseRemoteConfigService {
   final remoteConfig = FirebaseRemoteConfig.instance;
  //  FirebaseRemoteConfigService({
  //   required this.firebaseRemoteConfig,
  // });

  Future<String> initializeConfig() async {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 1),
          minimumFetchInterval: Duration(seconds: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
      var temp = remoteConfig.getString("details_info");
      print("check "+ temp);
      return temp;
    // on FirebaseException catch (e, st) {
    //   developer.log(
    //     'Unable to initialize Firebase Remote Config',
    //     error: e,
    //     stackTrace: st,
    //   );
    }
  }

//   String getEventInfoJson() => firebaseRemoteConfig.getString('event_info');
//
//   String getAppVersionJson() => firebaseRemoteConfig.getString('app_version');
//
//   String getStreamLink() => firebaseRemoteConfig.getString('stream_link');
//
//   bool getStreamLive() => firebaseRemoteConfig.getBool('stream_live');
//
//   bool getFavoritesEnabled() =>
//       firebaseRemoteConfig.getBool('favorites_enabled');
//
//   String getFavoriteButtonType() =>
//       firebaseRemoteConfig.getString('favorite_button_type');
// }