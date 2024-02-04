import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';

import '../app/app.logger.dart';

enum TtsState { playing, stopped, paused, continued }

// create a singleton class of MyTts which have init() method
class MyTts {
  final log = getLogger('MyTts');
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  Future init() async {
    flutterTts = FlutterTts();
    _setAwaitOptions();

    if (isAndroid) {
      await getVoices();
      await _getLanguages();
      await _getEngines();
      await _getDefaultVoice();
      await _setLanguage();

      // male voice
      // await flutterTts.setVoice({"name": "id-id-x-dfz#male_2-local"});
    }

    flutterTts.setStartHandler(() {
      log.i("Playing");
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      log.i("Complete");
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      log.i("Cancel");
      ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
      log.i("Paused");
      ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
      log.i("Continued");
      ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
      log.e("error: $msg");
      ttsState = TtsState.stopped;
    });
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future<dynamic> getVoices() async => await flutterTts.getVoices;

  Future<dynamic> _setLanguage() async => await flutterTts.setLanguage("id-ID");

  // Future setVoice() async {
  //   for (var voice in await flutterTts.getVoices) {
  //     if (voice.
  //   }
  // }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      log.i(voice);
    }
  }

  Future speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    if (text.isNotEmpty) {
      var result = await flutterTts.speak(text);
      if (result == 1) {
        ttsState = TtsState.playing;
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      ttsState = TtsState.stopped;
    }
  }

  Future pause() async {
    var result = await flutterTts.pause();
    if (result == 1) {
      ttsState = TtsState.paused;
    }
  }
}
