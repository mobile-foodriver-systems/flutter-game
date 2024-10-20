import 'package:equatable/equatable.dart';

class TournamentEntity extends Equatable {
  final int id;
  final String? name;
  final bool isParticipant;
  final int topUserCount;
  final DateTime endDate;
  final DateTime startDate;
  final bool isCompleted;

  const TournamentEntity({
    required this.id,
    this.name,
    required this.isParticipant,
    required this.topUserCount,
    required this.endDate,
    required this.startDate,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [
        id,
        if (name != null) name!,
        isParticipant,
        topUserCount,
        endDate,
        startDate,
        isCompleted,
      ];
}
