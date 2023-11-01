import 'package:flutter/material.dart';

class BottomPlayerWidget extends StatelessWidget {
  const BottomPlayerWidget({
    super.key,
    required this.whiteWithHalfOpacities,
  });

  final Color whiteWithHalfOpacities;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Color(0xFF161616),
          // color: Color.fromARGB(255, 176, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          "name",
                          style: TextStyle(
                            color: whiteWithHalfOpacities,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.skip_previous_outlined,
                          color: whiteWithHalfOpacities,
                          size: 34,
                        ),
                        Icon(
                          Icons.play_arrow_outlined,
                          color: whiteWithHalfOpacities,
                          size: 34,
                        ),
                        Icon(
                          Icons.skip_next_outlined,
                          color: whiteWithHalfOpacities,
                          size: 34,
                        )
                      ],
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
