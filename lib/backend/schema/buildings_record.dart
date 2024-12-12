import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildingsRecord extends FirestoreRecord {
  BuildingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buildings');

  static Stream<BuildingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuildingsRecord.fromSnapshot(s));

  static Future<BuildingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuildingsRecord.fromSnapshot(s));

  static BuildingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuildingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuildingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuildingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuildingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuildingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuildingsRecordData({
  String? name,
  double? latitude,
  double? longitude,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuildingsRecordDocumentEquality implements Equality<BuildingsRecord> {
  const BuildingsRecordDocumentEquality();

  @override
  bool equals(BuildingsRecord? e1, BuildingsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude;
  }

  @override
  int hash(BuildingsRecord? e) =>
      const ListEquality().hash([e?.name, e?.latitude, e?.longitude]);

  @override
  bool isValidKey(Object? o) => o is BuildingsRecord;
}
