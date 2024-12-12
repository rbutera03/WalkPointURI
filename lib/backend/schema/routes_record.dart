import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutesRecord extends FirestoreRecord {
  RoutesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  bool hasStart() => _start != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  bool hasEnd() => _end != null;

  // "routeName" field.
  String? _routeName;
  String get routeName => _routeName ?? '';
  bool hasRouteName() => _routeName != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "weekDays" field.
  List<String>? _weekDays;
  List<String> get weekDays => _weekDays ?? const [];
  bool hasWeekDays() => _weekDays != null;

  // "startLat" field.
  double? _startLat;
  double get startLat => _startLat ?? 0.0;
  bool hasStartLat() => _startLat != null;

  // "startLng" field.
  double? _startLng;
  double get startLng => _startLng ?? 0.0;
  bool hasStartLng() => _startLng != null;

  // "endLat" field.
  double? _endLat;
  double get endLat => _endLat ?? 0.0;
  bool hasEndLat() => _endLat != null;

  // "endLng" field.
  double? _endLng;
  double get endLng => _endLng ?? 0.0;
  bool hasEndLng() => _endLng != null;

  void _initializeFields() {
    _start = snapshotData['start'] as String?;
    _end = snapshotData['end'] as String?;
    _routeName = snapshotData['routeName'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _weekDays = getDataList(snapshotData['weekDays']);
    _startLat = castToType<double>(snapshotData['startLat']);
    _startLng = castToType<double>(snapshotData['startLng']);
    _endLat = castToType<double>(snapshotData['endLat']);
    _endLng = castToType<double>(snapshotData['endLng']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoutesRecord.fromSnapshot(s));

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoutesRecord.fromSnapshot(s));

  static RoutesRecord fromSnapshot(DocumentSnapshot snapshot) => RoutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoutesRecordData({
  String? start,
  String? end,
  String? routeName,
  DocumentReference? userID,
  double? startLat,
  double? startLng,
  double? endLat,
  double? endLng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start': start,
      'end': end,
      'routeName': routeName,
      'userID': userID,
      'startLat': startLat,
      'startLng': startLng,
      'endLat': endLat,
      'endLng': endLng,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoutesRecordDocumentEquality implements Equality<RoutesRecord> {
  const RoutesRecordDocumentEquality();

  @override
  bool equals(RoutesRecord? e1, RoutesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.start == e2?.start &&
        e1?.end == e2?.end &&
        e1?.routeName == e2?.routeName &&
        e1?.userID == e2?.userID &&
        listEquality.equals(e1?.weekDays, e2?.weekDays) &&
        e1?.startLat == e2?.startLat &&
        e1?.startLng == e2?.startLng &&
        e1?.endLat == e2?.endLat &&
        e1?.endLng == e2?.endLng;
  }

  @override
  int hash(RoutesRecord? e) => const ListEquality().hash([
        e?.start,
        e?.end,
        e?.routeName,
        e?.userID,
        e?.weekDays,
        e?.startLat,
        e?.startLng,
        e?.endLat,
        e?.endLng
      ]);

  @override
  bool isValidKey(Object? o) => o is RoutesRecord;
}
