import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "record_name" field.
  String? _recordName;
  String get recordName => _recordName ?? '';
  bool hasRecordName() => _recordName != null;

  // "record_IC" field.
  String? _recordIC;
  String get recordIC => _recordIC ?? '';
  bool hasRecordIC() => _recordIC != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user_link" field.
  DocumentReference? _userLink;
  DocumentReference? get userLink => _userLink;
  bool hasUserLink() => _userLink != null;

  // "image_result" field.
  List<String>? _imageResult;
  List<String> get imageResult => _imageResult ?? const [];
  bool hasImageResult() => _imageResult != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  // "hospital_name" field.
  String? _hospitalName;
  String get hospitalName => _hospitalName ?? '';
  bool hasHospitalName() => _hospitalName != null;

  // "user_fullname" field.
  String? _userFullname;
  String get userFullname => _userFullname ?? '';
  bool hasUserFullname() => _userFullname != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _recordName = snapshotData['record_name'] as String?;
    _recordIC = snapshotData['record_IC'] as String?;
    _comment = snapshotData['comment'] as String?;
    _userLink = snapshotData['user_link'] as DocumentReference?;
    _imageResult = getDataList(snapshotData['image_result']);
    _result = snapshotData['result'] as String?;
    _hospitalName = snapshotData['hospital_name'] as String?;
    _userFullname = snapshotData['user_fullname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? image,
  DateTime? createdTime,
  String? recordName,
  String? recordIC,
  String? comment,
  DocumentReference? userLink,
  String? result,
  String? hospitalName,
  String? userFullname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'created_time': createdTime,
      'record_name': recordName,
      'record_IC': recordIC,
      'comment': comment,
      'user_link': userLink,
      'result': result,
      'hospital_name': hospitalName,
      'user_fullname': userFullname,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime &&
        e1?.recordName == e2?.recordName &&
        e1?.recordIC == e2?.recordIC &&
        e1?.comment == e2?.comment &&
        e1?.userLink == e2?.userLink &&
        listEquality.equals(e1?.imageResult, e2?.imageResult) &&
        e1?.result == e2?.result &&
        e1?.hospitalName == e2?.hospitalName &&
        e1?.userFullname == e2?.userFullname;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.image,
        e?.createdTime,
        e?.recordName,
        e?.recordIC,
        e?.comment,
        e?.userLink,
        e?.imageResult,
        e?.result,
        e?.hospitalName,
        e?.userFullname
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
