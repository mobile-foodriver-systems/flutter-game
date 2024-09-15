import 'package:equatable/equatable.dart';

abstract class Selectable extends Equatable {
  int get id;
  String? get name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
