import 'package:flutter/foundation.dart';

class Potty {
  final String ownerId;
  final String id;
  final String excretionType;
  final DateTime date;
  final bool onPotty;
  final String notes;

  Potty({
    @required this.ownerId,
    @required this.id,
    @required this.excretionType,
    @required this.date,
    @required this.onPotty,
    this.notes,
  });
}
