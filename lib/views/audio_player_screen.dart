import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({
    super.key,
    required this.audioFileName,
  });

  final String audioFileName;

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
      body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/placeholderImage.jpg',
                  ),
                ),
              ),
              Text(
                audioFileName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
              const Text(
                "Author",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Text(
                      "00:00",
                      style: TextStyle(
                        color: Color.fromARGB(128, 255, 255, 255),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        min: const Duration(seconds: 0).inSeconds.toDouble(),
                        max: 9,
                        inactiveColor: const Color.fromARGB(128, 255, 255, 255),
                        thumbColor: const Color.fromARGB(128, 255, 255, 255),
                        activeColor: Colors.white,
                        onChangeEnd: (newValue) {},
                        onChanged: (newValue) {},
                        value: 4,
                      ),
                    ),
                    const Text(
                      "00:00",
                      style: TextStyle(
                        color: Color.fromARGB(128, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.shuffle,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.skip_previous_outlined,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.play_arrow_outlined,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.skip_next_outlined,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.repeat,
                        color: Color.fromARGB(128, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
