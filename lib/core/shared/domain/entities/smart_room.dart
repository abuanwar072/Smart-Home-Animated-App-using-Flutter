import 'package:smart_home_animation/core/shared/domain/entities/smart_device.dart';

import 'music_info.dart';

class SmartRoom {
  SmartRoom({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.temperature,
    required this.airHumidity,
    required this.lights,
    required this.airCondition,
    required this.timer,
    required this.musicInfo,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double temperature;
  final double airHumidity;
  final SmartDevice lights;
  final SmartDevice airCondition;
  final SmartDevice timer;
  final MusicInfo musicInfo;

  SmartRoom copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? temperature,
    double? airHumidity,
    SmartDevice? lights,
    SmartDevice? airCondition,
    SmartDevice? timer,
    MusicInfo? musicInfo,
  }) =>
      SmartRoom(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        temperature: temperature ?? this.temperature,
        airHumidity: airHumidity ?? this.airHumidity,
        lights: lights ?? this.lights,
        airCondition: airCondition ?? this.airCondition,
        musicInfo: musicInfo ?? this.musicInfo,
        timer: timer ?? this.timer,
      );

  static List<SmartRoom> fakeValues = [
    _room,
    _room.copyWith(id: '2', name: 'DINING ROOM', imageUrl: _imagesUrls[2]),
    _room.copyWith(id: '3', name: 'KITCHEN', imageUrl: _imagesUrls[3]),
    _room.copyWith(id: '4', name: 'BEDROOM', imageUrl: _imagesUrls[4]),
    _room.copyWith(id: '5', name: 'BATHROOM', imageUrl: _imagesUrls[1]),
  ];
}

final _room = SmartRoom(
  id: '1',
  name: 'LIVING ROOM',
  imageUrl: _imagesUrls[0],
  temperature: 12,
  airHumidity: 23,
  lights: SmartDevice(isOn: true, value: 20),
  timer: SmartDevice(isOn: false, value: 20),
  airCondition: SmartDevice(isOn: false, value: 10),
  musicInfo: MusicInfo(
    isOn: false,
    currentSong: Song.defaultSong,
  ),
);

const _imagesUrls = [
  'https://images.unsplash.com/photo-1600121848594-d8644e57abab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
  'https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1706&q=80',
  'https://images.unsplash.com/photo-1616486886892-ff366aa67ba4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
  'https://images.unsplash.com/photo-1588854337221-4cf9fa96059c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
  'https://m.media-amazon.com/images/I/715hLONUQOL._AC_SL1500_.jpg'
];
