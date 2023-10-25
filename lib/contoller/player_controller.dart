import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  var random = false.obs;
  var repeat = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  setRandom(bool randomInput) {
    random.value = randomInput;
  }

  setRepeat(bool repeatInput) {
    repeat.value = repeatInput;
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split('.')[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((d) {
      position.value = d.toString().split('.')[0];
      value.value = d.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(second) {
    var duration = Duration(seconds: second);
    audioPlayer.seek(duration);
  }

  playSong(String? uri, int index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(uri!),
        ),
      );
      audioPlayer.play();
      isPlaying(true);
      updatePosition();
      // ignore: empty_catches
    } on Exception {}
  }

  checkPermission() async {
    if (await Permission.storage.request().isGranted) {
    } else {
      checkPermission();
    }
  }
}
