import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/tournament/data/models/tournament.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournament_list.g.dart';

@JsonSerializable()
class TournamentList extends ApiList<Tournament> {
  TournamentList({
    super.count,
    super.offset,
    super.limit,
    super.list,
  });

  factory TournamentList.update({
    required TournamentList tournamentList,
    required List<Tournament> list,
    required int offset,
  }) {
    return TournamentList(
      count: tournamentList.count,
      limit: tournamentList.limit,
      offset: offset,
      list: {...tournamentList.list, ...list}.toList(),
    );
  }

  factory TournamentList.fromJson(Map<String, dynamic> json) =>
      _$TournamentListFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentListToJson(this);
}
