import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/src/helpers.dart/howl_audio.dart';
import 'package:portfolio/src/view/shared/custom_slider.dart';
import 'package:portfolio/src/view/shared/retro_button.dart';

double seekTime = 0;

class MediaPlayer extends StatefulWidget {
  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

enum MusicStatus { Playing, Paused, Stoped }

class _MediaPlayerState extends State<MediaPlayer> {
  MusicStatus musicStatus = MusicStatus.Stoped;
  bool initial = true;

  @override
  void initState() {
    setState(() {
      seekTime = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void stopMusic() {
      stopAudio();
      seekAudio(0);

      setState(() {
        musicStatus = MusicStatus.Stoped;

        seekTime = 0;
      });
    }

    void seeker() async {
      final _duration = getDuration().toInt();
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (musicStatus == MusicStatus.Playing && seekTime != _duration) {
          setState(() {
            seekTime += 1;
          });
        }
        if (seekTime >= getDuration()) {
          setState(() {
            seekTime = 0;
          });
          stopMusic();
        } else {}
      });
    }

    void playMusic() async {
      if (musicStatus != MusicStatus.Playing) {
        playAudio();

        setState(() {
          musicStatus = MusicStatus.Playing;
          // initial=false;
        });
        if (initial) {
          setState(() {
            initial = false;
            seekTime = 0;
          });
          seeker();
        }
      }
    }

    void seekMusic(double position) {
      int time = position.toInt();
      seekAudio(time);

      setState(() {
        seekTime = position;
      });
    }

    void pauseMusic() {
      pauseAudio();

      setState(() {
        musicStatus = MusicStatus.Paused;
      });
    }

    return Container(
      width: 770,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue, width: 2.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.black,
            Colors.black,
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      height: 389,
                      color: Colors.black,
                    ),
                    Positioned(
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Linkin Park',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Numb',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.grey,
              child: Column(
                children: [
                  SeekBar(
                    min: 0,
                    max: getDuration(), // Time in seconds,
                    value: seekTime,
                    seek: (val) {
                      print("SEEKED" + val.toString());
                      seekMusic(val);
                    },
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Column(
                            children: [
                              SizedBox(height: 15),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        RetroButton(
                          onPressed: () {
                            setState(() {
                              musicStatus != MusicStatus.Playing
                                  ? playMusic()
                                  : pauseMusic();
                            });
                          },
                          size: 50,
                          icon: musicStatus == MusicStatus.Paused ||
                                  musicStatus == MusicStatus.Stoped
                              ? Icon(
                                  Icons.play_arrow,
                                  size: 25.0,
                                )
                              : Icon(
                                  Icons.pause,
                                  size: 25.0,
                                ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RetroButton(
                          onPressed: () {
                            stopMusic();
                          },
                          size: 30,
                          icon: Icon(
                            Icons.stop,
                            size: 15,
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeekBar extends StatefulWidget {
  final Function seek;
  final double min;
  final double max;
  final double value;
  SeekBar({
    required this.seek,
    required this.min,
    required this.max,
    required this.value,
  });

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: 10,
            child: CustomSlider(
              value: seekTime,
              imageUrl: 'assets/slider_media_player.png',
              minDistance: 0,
              maxDistance: widget.max,
              onChanged: (value) {
                setState(() {
                  value = value;
                  widget.seek(value);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
