// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PokemonsEntityData extends DataClass
    implements Insertable<PokemonsEntityData> {
  final int id;
  final String name;
  final String url;
  final String logoUrl;
  const PokemonsEntityData(
      {required this.id,
      required this.name,
      required this.url,
      required this.logoUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    map['logo_url'] = Variable<String>(logoUrl);
    return map;
  }

  PokemonsEntityCompanion toCompanion(bool nullToAbsent) {
    return PokemonsEntityCompanion(
      id: Value(id),
      name: Value(name),
      url: Value(url),
      logoUrl: Value(logoUrl),
    );
  }

  factory PokemonsEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonsEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      logoUrl: serializer.fromJson<String>(json['logoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
      'logoUrl': serializer.toJson<String>(logoUrl),
    };
  }

  PokemonsEntityData copyWith(
          {int? id, String? name, String? url, String? logoUrl}) =>
      PokemonsEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        logoUrl: logoUrl ?? this.logoUrl,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonsEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('logoUrl: $logoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, url, logoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonsEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url &&
          other.logoUrl == this.logoUrl);
}

class PokemonsEntityCompanion extends UpdateCompanion<PokemonsEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> url;
  final Value<String> logoUrl;
  const PokemonsEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.logoUrl = const Value.absent(),
  });
  PokemonsEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String url,
    required String logoUrl,
  })  : name = Value(name),
        url = Value(url),
        logoUrl = Value(logoUrl);
  static Insertable<PokemonsEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? url,
    Expression<String>? logoUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (logoUrl != null) 'logo_url': logoUrl,
    });
  }

  PokemonsEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? url,
      Value<String>? logoUrl}) {
    return PokemonsEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      logoUrl: logoUrl ?? this.logoUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('logoUrl: $logoUrl')
          ..write(')'))
        .toString();
  }
}

class $PokemonsEntityTable extends PokemonsEntity
    with TableInfo<$PokemonsEntityTable, PokemonsEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonsEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _logoUrlMeta = const VerificationMeta('logoUrl');
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
      'logo_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, url, logoUrl];
  @override
  String get aliasedName => _alias ?? 'pokemons_entity';
  @override
  String get actualTableName => 'pokemons_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonsEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(_logoUrlMeta,
          logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta));
    } else if (isInserting) {
      context.missing(_logoUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonsEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonsEntityData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      url: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      logoUrl: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}logo_url'])!,
    );
  }

  @override
  $PokemonsEntityTable createAlias(String alias) {
    return $PokemonsEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PokemonsEntityTable pokemonsEntity = $PokemonsEntityTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemonsEntity];
}
