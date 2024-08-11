import 'package:equatable/equatable.dart';

class LooseWinEntity extends Equatable {
  const LooseWinEntity({
    this.reward,
    this.progress,
    this.totalTime,
  });

  final num? reward;
  final double? progress;
  final int? totalTime;

  @override
  List<Object?> get props => [
        if (reward != null) reward!,
        if (progress != null) progress!,
        if (totalTime != null) totalTime!,
      ];
}
