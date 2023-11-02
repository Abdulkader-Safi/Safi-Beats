import 'package:beats/views/play_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({
    super.key,
    required this.name,
    required this.numberOfTracks,
  });

  final String name;
  final int numberOfTracks;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => PlayListScreen(
            playListName: name,
          ),
          transition: Transition.downToUp,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2E5A72),
                Color(0xFF34495E),
                Color(0xFF2E5A72),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              'assets/placeholderImage.jpg',
                            ),
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "$numberOfTracks tracks",
                    style: const TextStyle(
                      color: Color.fromARGB(128, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
