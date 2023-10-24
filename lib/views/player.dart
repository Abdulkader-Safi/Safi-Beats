import 'dart:async';
import 'dart:math';

import 'package:beats/consts/colors.dart';
import 'package:beats/consts/text_style.dart';
import 'package:beats/contoller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.data,
  });

  final List<SongModel> data;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var controller = Get.find<PlayerController>();
  var repeat = false;
  var random = false;
  var index = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 1),
      (e) => {
        if (controller.value.value >= controller.max.value)
          {
            if (random)
              {
                index = Random().nextInt(widget.data.length - 1) + 1,
                controller.playSong(
                  widget.data[index].uri,
                  index,
                ),
              }
            else
              {
                if (repeat)
                  {
                    controller.playSong(
                      widget.data[controller.playIndex.value].uri,
                      controller.playIndex.value,
                    ),
                  }
                else if (!repeat)
                  {
                    controller.playSong(
                      widget.data[controller.playIndex.value + 1].uri,
                      controller.playIndex.value + 1,
                    )
                  }
              }
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: QueryArtworkWidget(
                    id: widget.data[controller.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    artworkWidth: double.infinity,
                    nullArtworkWidget: const Icon(
                      Icons.music_note,
                      size: 48,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        widget
                            .data[controller.playIndex.value].displayNameWOExt,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: outStyle(
                          weight: FontWeight.bold,
                          color: bgColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.data[controller.playIndex.value].artist
                            .toString(),
                        style: outStyle(
                          weight: FontWeight.normal,
                          color: bgDarkColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              controller.position.value,
                              style: outStyle(
                                color: bgDarkColor,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                value: controller.value.value,
                                min: const Duration(seconds: 0)
                                    .inSeconds
                                    .toDouble(),
                                max: controller.max.value,
                                inactiveColor: bgColor,
                                thumbColor: sliderColor,
                                activeColor: sliderColor,
                                onChangeEnd: (newValue) {
                                  if (newValue.toInt() >=
                                      controller.max.value) {
                                    controller.playSong(
                                      widget
                                          .data[controller.playIndex.value + 1]
                                          .uri,
                                      controller.playIndex.value + 1,
                                    );
                                  }
                                },
                                onChanged: (newValue) {
                                  controller.changeDurationToSeconds(
                                    newValue.toInt(),
                                  );
                                  newValue = newValue;
                                },
                              ),
                            ),
                            Text(
                              controller.duration.value,
                              style: outStyle(
                                color: bgDarkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (2.0 <= controller.value.value ||
                                  controller.playIndex.value <= 0) {
                                controller.playSong(
                                  widget.data[controller.playIndex.value].uri,
                                  controller.playIndex.value,
                                );
                              } else {
                                controller.playSong(
                                  widget
                                      .data[controller.playIndex.value - 1].uri,
                                  controller.playIndex.value - 1,
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                              color: bgDarkColor,
                              size: 40,
                            ),
                          ),
                          Obx(
                            () => CircleAvatar(
                              radius: 35,
                              backgroundColor: bgDarkColor,
                              child: Transform.scale(
                                scale: 2.5,
                                child: IconButton(
                                  onPressed: () {
                                    if (controller.isPlaying.value) {
                                      controller.audioPlayer.pause();
                                      controller.isPlaying(false);
                                    } else {
                                      controller.audioPlayer.play();
                                      controller.isPlaying(true);
                                    }
                                  },
                                  icon: controller.isPlaying.value
                                      ? const Icon(
                                          Icons.pause,
                                          color: whiteColor,
                                        )
                                      : const Icon(
                                          Icons.play_arrow_rounded,
                                          color: whiteColor,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.playSong(
                                widget.data[controller.playIndex.value + 1].uri,
                                controller.playIndex.value + 1,
                              );
                            },
                            icon: const Icon(
                              Icons.skip_next_rounded,
                              color: bgDarkColor,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (!random) {
                                setState(() {
                                  random = true;
                                });
                              } else {
                                setState(() {
                                  random = false;
                                });
                              }
                            },
                            icon: !random
                                ? const Icon(
                                    Icons.shuffle,
                                    color: Colors.red,
                                    size: 40,
                                  )
                                : const Icon(
                                    Icons.shuffle,
                                    color: bgDarkColor,
                                    size: 40,
                                  ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (!repeat) {
                                setState(() {
                                  repeat = true;
                                });
                              } else {
                                setState(() {
                                  repeat = false;
                                });
                              }
                            },
                            icon: !repeat
                                ? const Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: bgDarkColor,
                                    size: 40,
                                  )
                                : const Icon(
                                    Icons.repeat_one,
                                    color: bgDarkColor,
                                    size: 40,
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
