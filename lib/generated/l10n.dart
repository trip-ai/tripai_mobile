// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ma'lumotlar sahifasini ochish`
  String get btn {
    return Intl.message(
      'Ma\'lumotlar sahifasini ochish',
      name: 'btn',
      desc: '',
      args: [],
    );
  }

  /// `Follow the location`
  String get followTheLocation {
    return Intl.message(
      'Follow the location',
      name: 'followTheLocation',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to go?`
  String get homeSearchHint {
    return Intl.message(
      'Where do you want to go?',
      name: 'homeSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Get ready\nfor new journeys\nwith us!`
  String get introText {
    return Intl.message(
      'Get ready\nfor new journeys\nwith us!',
      name: 'introText',
      desc: '',
      args: [],
    );
  }

  /// `uz`
  String get language {
    return Intl.message(
      'uz',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `To help you make\nthe right choice,\nwe need to know\nyour location!`
  String get locationPermissionText {
    return Intl.message(
      'To help you make\nthe right choice,\nwe need to know\nyour location!',
      name: 'locationPermissionText',
      desc: '',
      args: [],
    );
  }

  /// `Siz tugamani shuncha martta bosgansiz:`
  String get message {
    return Intl.message(
      'Siz tugamani shuncha martta bosgansiz:',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextBtn {
    return Intl.message(
      'Next',
      name: 'nextBtn',
      desc: '',
      args: [],
    );
  }

  /// `Register in the app\nto save your data!`
  String get registerText {
    return Intl.message(
      'Register in the app\nto save your data!',
      name: 'registerText',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipBtn {
    return Intl.message(
      'Skip',
      name: 'skipBtn',
      desc: '',
      args: [],
    );
  }

  /// `Getting started`
  String get startBtn {
    return Intl.message(
      'Getting started',
      name: 'startBtn',
      desc: '',
      args: [],
    );
  }

  /// `Your AI-enhanced\ntrip advisor`
  String get taglineText {
    return Intl.message(
      'Your AI-enhanced\ntrip advisor',
      name: 'taglineText',
      desc: '',
      args: [],
    );
  }

  /// `What interests you?`
  String get whatInterests {
    return Intl.message(
      'What interests you?',
      name: 'whatInterests',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'uz'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
