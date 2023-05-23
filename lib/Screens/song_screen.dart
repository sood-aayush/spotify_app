import 'package:flutter/material.dart';
import 'package:spotify_clone/Models/song_model.dart';
import 'package:spotify_clone/Screens/homescreen.dart';
import 'package:spotify_clone/Widgets/song_recommend.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Song_Screen extends StatefulWidget {
  final SongModel recdata;
  Song_Screen({required this.recdata});

  @override
  State<Song_Screen> createState() => _Song_ScreenState();
}

class _Song_ScreenState extends State<Song_Screen> {
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  final player = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initstate() {}

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((Duration newposition) {
      setState(() {
        position = newposition;
      });
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
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
              {
                Navigator.pop(context);
              }
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
                  child: Image.network('${widget.recdata.image}'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recdata.name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.recdata.artist,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  )
                ],
              ),
              Column(
                children: [
                  Slider(
                    thumbColor: Colors.white,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    inactiveColor: Colors.grey.shade700,
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await player.seek(position);
                      await player.resume();
                    },
                    activeColor: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          formatTime(
                            position,
                          )),
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          formatTime(
                            duration,
                          ))
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
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        if (isPlaying) {
                          await player.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          await player.play(UrlSource(widget.recdata.songUrl));
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
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
                    onPressed: () {
                      player.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    },
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
