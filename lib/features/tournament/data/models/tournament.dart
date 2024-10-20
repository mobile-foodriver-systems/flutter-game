import 'package:food_driver/core/converters/datetime_json_converter.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/tournament/domain/entities/tournament_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@DateTimeJsonConverter()
@JsonSerializable()
class Tournament extends Selectable {
  @override
  final int id;
  @override
  final String? name;
  final bool isParticipant;
  final int topUserCount;
  final DateTime endDate;
  final DateTime startDate;

  Tournament({
    required this.id,
    this.name,
    required this.isParticipant,
    required this.topUserCount,
    required this.endDate,
    required this.startDate,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tournament &&
            other.id == id &&
            other.name == name);
  }

  @override
  int get hashCode => Object.hash(id, name);

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}

extension TournamentX on Tournament {
  TournamentEntity toEntity({
    bool isCompleted = false,
  }) {
    return TournamentEntity(
      id: id,
      name: name,
      isParticipant: isParticipant,
      topUserCount: topUserCount,
      endDate: endDate,
      startDate: startDate,
      isCompleted: isCompleted,
    );
  }
}
