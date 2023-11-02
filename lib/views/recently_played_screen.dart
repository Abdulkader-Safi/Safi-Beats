import 'package:beats/views/widgets/audio_file_widget.dart';
import 'package:beats/views/widgets/bottom_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Safi Beats",
          style: TextStyle(),
        ),
        backgroundColor: const Color(0xFF34495E),
        actions: const [
          Icon(
            Icons.search,
            size: 24.0,
            color: Color.fromARGB(128, 255, 255, 255),
          ),
          SizedBox(
            width: 23.0,
          ),
        ],
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(128, 255, 255, 255),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF34495E),
                  Color(0xFF161616),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Recently Played",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 1',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    AudioFileWidget(
                      name: 'Sound 2',
                      time: "${DateTime.now().hour}:${DateTime.now().minute}",
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
          const BottomPlayerWidget(),
        ],
      ),
    );
  }
}
