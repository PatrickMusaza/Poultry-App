import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedsRecord extends FirestoreRecord {
  FeedsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MAIZE" field.
  double? _maize;
  double get maize => _maize ?? 0.0;
  bool hasMaize() => _maize != null;

  // "FULLFATSOYA" field.
  double? _fullfatsoya;
  double get fullfatsoya => _fullfatsoya ?? 0.0;
  bool hasFullfatsoya() => _fullfatsoya != null;

  // "LOWFATSOYA" field.
  double? _lowfatsoya;
  double get lowfatsoya => _lowfatsoya ?? 0.0;
  bool hasLowfatsoya() => _lowfatsoya != null;

  // "FISHMEAL" field.
  double? _fishmeal;
  double get fishmeal => _fishmeal ?? 0.0;
  bool hasFishmeal() => _fishmeal != null;

  // "DICALCIUMPHOSPHATE" field.
  double? _dicalciumphosphate;
  double get dicalciumphosphate => _dicalciumphosphate ?? 0.0;
  bool hasDicalciumphosphate() => _dicalciumphosphate != null;

  // "LIME" field.
  double? _lime;
  double get lime => _lime ?? 0.0;
  bool hasLime() => _lime != null;

  // "SALT" field.
  double? _salt;
  double get salt => _salt ?? 0.0;
  bool hasSalt() => _salt != null;

  // "METHIONINE" field.
  double? _methionine;
  double get methionine => _methionine ?? 0.0;
  bool hasMethionine() => _methionine != null;

  // "BROILERVIT_MINERALPREMIX" field.
  double? _broilervitMineralpremix;
  double get broilervitMineralpremix => _broilervitMineralpremix ?? 0.0;
  bool hasBroilervitMineralpremix() => _broilervitMineralpremix != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Concentrates" field.
  double? _concentrates;
  double get concentrates => _concentrates ?? 0.0;
  bool hasConcentrates() => _concentrates != null;

  void _initializeFields() {
    _maize = castToType<double>(snapshotData['MAIZE']);
    _fullfatsoya = castToType<double>(snapshotData['FULLFATSOYA']);
    _lowfatsoya = castToType<double>(snapshotData['LOWFATSOYA']);
    _fishmeal = castToType<double>(snapshotData['FISHMEAL']);
    _dicalciumphosphate =
        castToType<double>(snapshotData['DICALCIUMPHOSPHATE']);
    _lime = castToType<double>(snapshotData['LIME']);
    _salt = castToType<double>(snapshotData['SALT']);
    _methionine = castToType<double>(snapshotData['METHIONINE']);
    _broilervitMineralpremix =
        castToType<double>(snapshotData['BROILERVIT_MINERALPREMIX']);
    _id = snapshotData['ID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _concentrates = castToType<double>(snapshotData['Concentrates']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Feeds');

  static Stream<FeedsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedsRecord.fromSnapshot(s));

  static Future<FeedsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedsRecord.fromSnapshot(s));

  static FeedsRecord fromSnapshot(DocumentSnapshot snapshot) => FeedsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedsRecordData({
  double? maize,
  double? fullfatsoya,
  double? lowfatsoya,
  double? fishmeal,
  double? dicalciumphosphate,
  double? lime,
  double? salt,
  double? methionine,
  double? broilervitMineralpremix,
  String? id,
  DateTime? createdAt,
  double? concentrates,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MAIZE': maize,
      'FULLFATSOYA': fullfatsoya,
      'LOWFATSOYA': lowfatsoya,
      'FISHMEAL': fishmeal,
      'DICALCIUMPHOSPHATE': dicalciumphosphate,
      'LIME': lime,
      'SALT': salt,
      'METHIONINE': methionine,
      'BROILERVIT_MINERALPREMIX': broilervitMineralpremix,
      'ID': id,
      'createdAt': createdAt,
      'Concentrates': concentrates,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedsRecordDocumentEquality implements Equality<FeedsRecord> {
  const FeedsRecordDocumentEquality();

  @override
  bool equals(FeedsRecord? e1, FeedsRecord? e2) {
    return e1?.maize == e2?.maize &&
        e1?.fullfatsoya == e2?.fullfatsoya &&
        e1?.lowfatsoya == e2?.lowfatsoya &&
        e1?.fishmeal == e2?.fishmeal &&
        e1?.dicalciumphosphate == e2?.dicalciumphosphate &&
        e1?.lime == e2?.lime &&
        e1?.salt == e2?.salt &&
        e1?.methionine == e2?.methionine &&
        e1?.broilervitMineralpremix == e2?.broilervitMineralpremix &&
        e1?.id == e2?.id &&
        e1?.createdAt == e2?.createdAt &&
        e1?.concentrates == e2?.concentrates;
  }

  @override
  int hash(FeedsRecord? e) => const ListEquality().hash([
        e?.maize,
        e?.fullfatsoya,
        e?.lowfatsoya,
        e?.fishmeal,
        e?.dicalciumphosphate,
        e?.lime,
        e?.salt,
        e?.methionine,
        e?.broilervitMineralpremix,
        e?.id,
        e?.createdAt,
        e?.concentrates
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedsRecord;
}
