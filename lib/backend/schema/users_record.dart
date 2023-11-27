import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "lastActive" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  bool hasApellido() => _apellido != null;

  // "cedula" field.
  int? _cedula;
  int get cedula => _cedula ?? 0;
  bool hasCedula() => _cedula != null;

  // "nombrefarmacia" field.
  String? _nombrefarmacia;
  String get nombrefarmacia => _nombrefarmacia ?? '';
  bool hasNombrefarmacia() => _nombrefarmacia != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "segurofarmacia" field.
  bool? _segurofarmacia;
  bool get segurofarmacia => _segurofarmacia ?? false;
  bool hasSegurofarmacia() => _segurofarmacia != null;

  // "facturacionelectronica" field.
  bool? _facturacionelectronica;
  bool get facturacionelectronica => _facturacionelectronica ?? false;
  bool hasFacturacionelectronica() => _facturacionelectronica != null;

  // "descuentosypromociones" field.
  bool? _descuentosypromociones;
  bool get descuentosypromociones => _descuentosypromociones ?? false;
  bool hasDescuentosypromociones() => _descuentosypromociones != null;

  // "latitudlongitud" field.
  LatLng? _latitudlongitud;
  LatLng? get latitudlongitud => _latitudlongitud;
  bool hasLatitudlongitud() => _latitudlongitud != null;

  // "rucfarmacia" field.
  int? _rucfarmacia;
  int get rucfarmacia => _rucfarmacia ?? 0;
  bool hasRucfarmacia() => _rucfarmacia != null;

  // "administrador" field.
  bool? _administrador;
  bool get administrador => _administrador ?? false;
  bool hasAdministrador() => _administrador != null;

  // "dependiente" field.
  bool? _dependiente;
  bool get dependiente => _dependiente ?? false;
  bool hasDependiente() => _dependiente != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastActive = snapshotData['lastActive'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bio = snapshotData['bio'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _apellido = snapshotData['apellido'] as String?;
    _cedula = castToType<int>(snapshotData['cedula']);
    _nombrefarmacia = snapshotData['nombrefarmacia'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _ciudad = snapshotData['ciudad'] as String?;
    _segurofarmacia = snapshotData['segurofarmacia'] as bool?;
    _facturacionelectronica = snapshotData['facturacionelectronica'] as bool?;
    _descuentosypromociones = snapshotData['descuentosypromociones'] as bool?;
    _latitudlongitud = snapshotData['latitudlongitud'] as LatLng?;
    _rucfarmacia = castToType<int>(snapshotData['rucfarmacia']);
    _administrador = snapshotData['administrador'] as bool?;
    _dependiente = snapshotData['dependiente'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? lastActive,
  String? status,
  String? bio,
  DateTime? createdAt,
  String? apellido,
  int? cedula,
  String? nombrefarmacia,
  String? direccion,
  String? provincia,
  String? ciudad,
  bool? segurofarmacia,
  bool? facturacionelectronica,
  bool? descuentosypromociones,
  LatLng? latitudlongitud,
  int? rucfarmacia,
  bool? administrador,
  bool? dependiente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'lastActive': lastActive,
      'status': status,
      'bio': bio,
      'createdAt': createdAt,
      'apellido': apellido,
      'cedula': cedula,
      'nombrefarmacia': nombrefarmacia,
      'direccion': direccion,
      'provincia': provincia,
      'ciudad': ciudad,
      'segurofarmacia': segurofarmacia,
      'facturacionelectronica': facturacionelectronica,
      'descuentosypromociones': descuentosypromociones,
      'latitudlongitud': latitudlongitud,
      'rucfarmacia': rucfarmacia,
      'administrador': administrador,
      'dependiente': dependiente,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastActive == e2?.lastActive &&
        e1?.status == e2?.status &&
        e1?.bio == e2?.bio &&
        e1?.createdAt == e2?.createdAt &&
        e1?.apellido == e2?.apellido &&
        e1?.cedula == e2?.cedula &&
        e1?.nombrefarmacia == e2?.nombrefarmacia &&
        e1?.direccion == e2?.direccion &&
        e1?.provincia == e2?.provincia &&
        e1?.ciudad == e2?.ciudad &&
        e1?.segurofarmacia == e2?.segurofarmacia &&
        e1?.facturacionelectronica == e2?.facturacionelectronica &&
        e1?.descuentosypromociones == e2?.descuentosypromociones &&
        e1?.latitudlongitud == e2?.latitudlongitud &&
        e1?.rucfarmacia == e2?.rucfarmacia &&
        e1?.administrador == e2?.administrador &&
        e1?.dependiente == e2?.dependiente;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastActive,
        e?.status,
        e?.bio,
        e?.createdAt,
        e?.apellido,
        e?.cedula,
        e?.nombrefarmacia,
        e?.direccion,
        e?.provincia,
        e?.ciudad,
        e?.segurofarmacia,
        e?.facturacionelectronica,
        e?.descuentosypromociones,
        e?.latitudlongitud,
        e?.rucfarmacia,
        e?.administrador,
        e?.dependiente
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
