import '../resources/local/local_storage.dart';

abstract class LocalDataRepository {
  ///Interests list
  static const _kInterests = 'INTERESTS';
  static String get interestsList =>
      LocalStorage.readSettingValue(_kInterests, '');
  static set interestsList(String list) =>
      LocalStorage.writeSettingValue(_kInterests, list);

  ///Access Token
  static const _kAccessToken = 'ACCESS_TOKEN';
  static String get accessToken =>
      LocalStorage.readSettingValue(_kAccessToken, '');
  static set accessToken(String value) =>
      LocalStorage.writeSettingValue(_kAccessToken, value);

  ///Refresh Token
  static const _kRefreshToken = 'REFRESH_TOKEN';
  static String get refreshToken =>
      LocalStorage.readSettingValue(_kRefreshToken, '');
  static set refreshToken(String value) =>
      LocalStorage.writeSettingValue(_kRefreshToken, value);

  ///Language
  static const _kLanguage = 'LANGUAGE_CODE';
  static String get languageId =>
      LocalStorage.readSettingValue(_kLanguage, 'en');
  static set languageId(String value) =>
      LocalStorage.writeSettingValue(_kLanguage, value);

  ///Intro
  static const _kIntro = 'INTRO';
  static bool get isShowedIntro =>
      LocalStorage.readSettingValue(_kIntro, false);
  static set isShowedIntro(bool value) =>
      LocalStorage.writeSettingValue(_kIntro, value);
}
