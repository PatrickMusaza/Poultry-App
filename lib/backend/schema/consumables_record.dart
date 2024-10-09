import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsumablesRecord extends FirestoreRecord {
  ConsumablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Vaccines" field.
  double? _vaccines;
  double get vaccines => _vaccines ?? 0.0;
  bool hasVaccines() => _vaccines != null;

  // "Selling" field.
  double? _selling;
  double get selling => _selling ?? 0.0;
  bool hasSelling() => _selling != null;

  // "Transport" field.
  double? _transport;
  double get transport => _transport ?? 0.0;
  bool hasTransport() => _transport != null;

  // "Feeds" field.
  double? _feeds;
  double get feeds => _feeds ?? 0.0;
  bool hasFeeds() => _feeds != null;

  // "Water" field.
  double? _water;
  double get water => _water ?? 0.0;
  bool hasWater() => _water != null;

  // "Power" field.
  double? _power;
  double get power => _power ?? 0.0;
  bool hasPower() => _power != null;

  // "Litter" field.
  double? _litter;
  double get litter => _litter ?? 0.0;
  bool hasLitter() => _litter != null;

  // "Labour" field.
  double? _labour;
  double get labour => _labour ?? 0.0;
  bool hasLabour() => _labour != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _vaccines = castToType<double>(snapshotData['Vaccines']);
    _selling = castToType<double>(snapshotData['Selling']);
    _transport = castToType<double>(snapshotData['Transport']);
    _feeds = castToType<double>(snapshotData['Feeds']);
    _water = castToType<double>(snapshotData['Water']);
    _power = castToType<double>(snapshotData['Power']);
    _litter = castToType<double>(snapshotData['Litter']);
    _labour = castToType<double>(snapshotData['Labour']);
    _id = snapshotData['ID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Consumables');

  static Stream<ConsumablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsumablesRecord.fromSnapshot(s));

  static Future<ConsumablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsumablesRecord.fromSnapshot(s));

  static ConsumablesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsumablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsumablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsumablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsumablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsumablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsumablesRecordData({
  double? vaccines,
  double? selling,
  double? transport,
  double? feeds,
  double? water,
  double? power,
  double? litter,
  double? labour,
  String? id,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Vaccines': vaccines,
      'Selling': selling,
      'Transport': transport,
      'Feeds': feeds,
      'Water': water,
      'Power': power,
      'Litter': litter,
      'Labour': labour,
      'ID': id,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsumablesRecordDocumentEquality implements Equality<ConsumablesRecord> {
  const ConsumablesRecordDocumentEquality();

  @override
  bool equals(ConsumablesRecord? e1, ConsumablesRecord? e2) {
    return e1?.vaccines == e2?.vaccines &&
        e1?.selling == e2?.selling &&
        e1?.transport == e2?.transport &&
        e1?.feeds == e2?.feeds &&
        e1?.water == e2?.water &&
        e1?.power == e2?.power &&
        e1?.litter == e2?.litter &&
        e1?.labour == e2?.labour &&
        e1?.id == e2?.id &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ConsumablesRecord? e) => const ListEquality().hash([
        e?.vaccines,
        e?.selling,
        e?.transport,
        e?.feeds,
        e?.water,
        e?.power,
        e?.litter,
        e?.labour,
        e?.id,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ConsumablesRecord;
}
