import 'package:flutter/material.dart';

class BottomPlayerWidget extends StatelessWidget {
  const BottomPlayerWidget({
    super.key,
  });

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
                        const Text(
                          "name",
                          style: TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.skip_previous_outlined,
                          color: Color.fromARGB(128, 255, 255, 255),
                          size: 34,
                        ),
                        Icon(
                          Icons.play_arrow_outlined,
                          color: Color.fromARGB(128, 255, 255, 255),
                          size: 34,
                        ),
                        Icon(
                          Icons.skip_next_outlined,
                          color: Color.fromARGB(128, 255, 255, 255),
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
