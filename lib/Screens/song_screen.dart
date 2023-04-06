import 'package:flutter/material.dart';
import 'package:spotify_clone/Widgets/song_recommend.dart';

class Song_Screen extends StatefulWidget {
  const Song_Screen({super.key});
  static const routeName = '/song_screen';

  @override
  State<Song_Screen> createState() => _Song_ScreenState();
}

class _Song_ScreenState extends State<Song_Screen> {
  @override
  double _sliderValue = 0.2;
  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context)!.settings.arguments as Arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: argum.image,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    argum.name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    argum.artist,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  )
                ],
              ),
              Column(
                children: [
                  SliderTheme(
                    data: const SliderThemeData(
                        trackHeight: 2,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 0)),
                    child: Slider(
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey.shade700,
                      value: _sliderValue,
                      onChanged: ((value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }),
                      activeColor: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0:01',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade300),
                      ),
                      Text(
                        '3:00',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade300),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fast_rewind,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(
                      Icons.fast_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.stop_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined,
                          color: Colors.white)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
