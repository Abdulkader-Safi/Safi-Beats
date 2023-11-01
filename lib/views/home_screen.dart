import 'package:beats/views/widgets/bottom_player_widget.dart';
import 'package:beats/views/widgets/play_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var whiteWithHalfOpacities = const Color.fromARGB(128, 255, 255, 255);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Safi Beats",
          style: TextStyle(),
        ),
        backgroundColor: const Color(0xFF34495E),
        actions: [
          Icon(
            Icons.search,
            size: 24.0,
            color: whiteWithHalfOpacities,
          ),
          const SizedBox(
            width: 23.0,
          ),
        ],
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
                    PlayListWidget(
                      name: 'PlayList1',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList2',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList1',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList2',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList1',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList2',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList1',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList2',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList1',
                      numberOfTracks: 64,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    PlayListWidget(
                      name: 'PlayList2',
                      numberOfTracks: 100,
                      whiteWithHalfOpacities: whiteWithHalfOpacities,
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomPlayerWidget(whiteWithHalfOpacities: whiteWithHalfOpacities),
        ],
      ),
    );
  }
}
