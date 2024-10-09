import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InputsRecord extends FirestoreRecord {
  InputsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Chickens" field.
  int? _chickens;
  int get chickens => _chickens ?? 0;
  bool hasChickens() => _chickens != null;

  // "Currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "DaysOldChick" field.
  int? _daysOldChick;
  int get daysOldChick => _daysOldChick ?? 0;
  bool hasDaysOldChick() => _daysOldChick != null;

  // "GrownBroilers" field.
  double? _grownBroilers;
  double get grownBroilers => _grownBroilers ?? 0.0;
  bool hasGrownBroilers() => _grownBroilers != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _chickens = castToType<int>(snapshotData['Chickens']);
    _currency = snapshotData['Currency'] as String?;
    _id = snapshotData['ID'] as String?;
    _daysOldChick = castToType<int>(snapshotData['DaysOldChick']);
    _grownBroilers = castToType<double>(snapshotData['GrownBroilers']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Inputs');

  static Stream<InputsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InputsRecord.fromSnapshot(s));

  static Future<InputsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InputsRecord.fromSnapshot(s));

  static InputsRecord fromSnapshot(DocumentSnapshot snapshot) => InputsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InputsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InputsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InputsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InputsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInputsRecordData({
  int? chickens,
  String? currency,
  String? id,
  int? daysOldChick,
  double? grownBroilers,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Chickens': chickens,
      'Currency': currency,
      'ID': id,
      'DaysOldChick': daysOldChick,
      'GrownBroilers': grownBroilers,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class InputsRecordDocumentEquality implements Equality<InputsRecord> {
  const InputsRecordDocumentEquality();

  @override
  bool equals(InputsRecord? e1, InputsRecord? e2) {
    return e1?.chickens == e2?.chickens &&
        e1?.currency == e2?.currency &&
        e1?.id == e2?.id &&
        e1?.daysOldChick == e2?.daysOldChick &&
        e1?.grownBroilers == e2?.grownBroilers &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(InputsRecord? e) => const ListEquality().hash([
        e?.chickens,
        e?.currency,
        e?.id,
        e?.daysOldChick,
        e?.grownBroilers,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is InputsRecord;
}
