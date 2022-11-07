import 'package:drift/drift.dart';

class PokemonsEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get url => text()();
  TextColumn get logoUrl => text()();
}
