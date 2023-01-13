// List of imageUrls and soundUrls for SoundPlayer
import 'package:assets_audio_player/assets_audio_player.dart';

final sounds = <Audio>[
  Audio.network(
      "https://firebasestorage.googleapis.com/v0/b/epione-992ee.appspot.com/o/white-noise.mp3?alt=media&token=51f2a3a5-0001-445b-8255-3a8284b32f2a",
      metas: Metas(
          id: '0',
          title: "White Noise - Ocean",
          artist: "Nicole Johnson",
          album: "White Noise",
          image: MetasImage.network(
              "https://www.99images.com/download-image/869224/2880x2560"))),
  Audio.network(
      "https://firebasestorage.googleapis.com/v0/b/epione-992ee.appspot.com/o/binaural-beats.mp3?alt=media&token=f6105a03-34ed-4f49-abdf-0985ac6ba785",
      metas: Metas(
          id: '1',
          title: "Binaural Beats",
          artist: "NaturesEye - Pixabay",
          album: "Binaural Sounds",
          image: MetasImage.network(
              "https://music2relax.com/wp-content/uploads/2018/05/rsz_theraputic_binural_beats.jpg"))),
  Audio.network(
      "https://firebasestorage.googleapis.com/v0/b/epione-992ee.appspot.com/o/mindfulness-meditation.mp3?alt=media&token=a8a84aad-2a83-4a18-bfe7-d213157f5923",
      metas: Metas(
          id: '2',
          title: "Mindfulness Aesthetic",
          artist: "NaturesEye - Pixabay",
          album: "Mindfulness Sounds",
          image: MetasImage.network(
              "https://iasbaba.com/wp-content/uploads/2022/01/Mindfulness.png"))),
];
