import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class FlashCardAudio extends StatefulWidget {
  const FlashCardAudio({
    super.key,
    required this.isFront,
    required this.audioUrl,
  });

  final bool isFront;
  final String audioUrl;

  @override
  State<FlashCardAudio> createState() => _FlashCardAudioState();
}

class _FlashCardAudioState extends State<FlashCardAudio> {
  bool _isPlaying = false;

  void _playAudio() async {
    final player = AudioPlayer();

    setState(() {
      _isPlaying = true;
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });

    await player.play(
      UrlSource(
        widget.audioUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          widget.isFront ? colorScheme.primary : colorScheme.secondaryContainer,
        ),
      ),
      color: widget.isFront
          ? colorScheme.onPrimary
          : colorScheme.onSecondaryContainer,
      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: _playAudio,
    );
  }
}
