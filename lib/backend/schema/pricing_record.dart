import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricingRecord extends FirestoreRecord {
  PricingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Poultryhouses" field.
  double? _poultryhouses;
  double get poultryhouses => _poultryhouses ?? 0.0;
  bool hasPoultryhouses() => _poultryhouses != null;

  // "Drinkers" field.
  double? _drinkers;
  double get drinkers => _drinkers ?? 0.0;
  bool hasDrinkers() => _drinkers != null;

  // "Feeders" field.
  double? _feeders;
  double get feeders => _feeders ?? 0.0;
  bool hasFeeders() => _feeders != null;

  // "Brooders" field.
  double? _brooders;
  double get brooders => _brooders ?? 0.0;
  bool hasBrooders() => _brooders != null;

  // "InfraredLamp" field.
  double? _infraredLamp;
  double get infraredLamp => _infraredLamp ?? 0.0;
  bool hasInfraredLamp() => _infraredLamp != null;

  // "Borehole" field.
  double? _borehole;
  double get borehole => _borehole ?? 0.0;
  bool hasBorehole() => _borehole != null;

  // "Tools" field.
  double? _tools;
  double get tools => _tools ?? 0.0;
  bool hasTools() => _tools != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _poultryhouses = castToType<double>(snapshotData['Poultryhouses']);
    _drinkers = castToType<double>(snapshotData['Drinkers']);
    _feeders = castToType<double>(snapshotData['Feeders']);
    _brooders = castToType<double>(snapshotData['Brooders']);
    _infraredLamp = castToType<double>(snapshotData['InfraredLamp']);
    _borehole = castToType<double>(snapshotData['Borehole']);
    _tools = castToType<double>(snapshotData['Tools']);
    _id = snapshotData['ID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pricing');

  static Stream<PricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricingRecord.fromSnapshot(s));

  static Future<PricingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricingRecord.fromSnapshot(s));

  static PricingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PricingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricingRecordData({
  double? poultryhouses,
  double? drinkers,
  double? feeders,
  double? brooders,
  double? infraredLamp,
  double? borehole,
  double? tools,
  String? id,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Poultryhouses': poultryhouses,
      'Drinkers': drinkers,
      'Feeders': feeders,
      'Brooders': brooders,
      'InfraredLamp': infraredLamp,
      'Borehole': borehole,
      'Tools': tools,
      'ID': id,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricingRecordDocumentEquality implements Equality<PricingRecord> {
  const PricingRecordDocumentEquality();

  @override
  bool equals(PricingRecord? e1, PricingRecord? e2) {
    return e1?.poultryhouses == e2?.poultryhouses &&
        e1?.drinkers == e2?.drinkers &&
        e1?.feeders == e2?.feeders &&
        e1?.brooders == e2?.brooders &&
        e1?.infraredLamp == e2?.infraredLamp &&
        e1?.borehole == e2?.borehole &&
        e1?.tools == e2?.tools &&
        e1?.id == e2?.id &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PricingRecord? e) => const ListEquality().hash([
        e?.poultryhouses,
        e?.drinkers,
        e?.feeders,
        e?.brooders,
        e?.infraredLamp,
        e?.borehole,
        e?.tools,
        e?.id,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is PricingRecord;
}
