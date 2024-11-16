import 'package:equatable/equatable.dart';

class HomeOneItemModel extends Equatable {
  HomeOneItemModel({
    String? title,
    String? time,
    String? subtitle,
    String? id,
  })  : title = title ?? "Work Alarm",
        time = time ?? "Set for 9:00 AM",
        subtitle = subtitle ?? "Repeats Mon-Fri",
        id = id ?? "";

  String? title;
  String? time;
  String? subtitle;
  String? id;

  HomeOneItemModel copyWith({
    String? title,
    String? time,
    String? subtitle,
    String? id,
  }) {
    return HomeOneItemModel(
      title: title ?? this.title,
      time: time ?? this.time,
      subtitle: subtitle ?? this.subtitle,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [title, time, subtitle, id];
}
