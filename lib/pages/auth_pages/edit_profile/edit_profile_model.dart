import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modals/edit_profile_photo/edit_profile_photo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for apellido widget.
  FocusNode? apellidoFocusNode;
  TextEditingController? apellidoController;
  String? Function(BuildContext, String?)? apellidoControllerValidator;
  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for cedula widget.
  FocusNode? cedulaFocusNode;
  TextEditingController? cedulaController;
  String? Function(BuildContext, String?)? cedulaControllerValidator;
  // State field(s) for nombrefarmacia widget.
  FocusNode? nombrefarmaciaFocusNode;
  TextEditingController? nombrefarmaciaController;
  String? Function(BuildContext, String?)? nombrefarmaciaControllerValidator;
  // State field(s) for Direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionController;
  String? Function(BuildContext, String?)? direccionControllerValidator;
  // State field(s) for provincia widget.
  FocusNode? provinciaFocusNode;
  TextEditingController? provinciaController;
  String? Function(BuildContext, String?)? provinciaControllerValidator;
  // State field(s) for Ciudad widget.
  FocusNode? ciudadFocusNode;
  TextEditingController? ciudadController;
  String? Function(BuildContext, String?)? ciudadControllerValidator;
  // State field(s) for RUC widget.
  FocusNode? rucFocusNode;
  TextEditingController? rucController;
  String? Function(BuildContext, String?)? rucControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoController?.dispose();

    celularFocusNode?.dispose();
    celularController?.dispose();

    cedulaFocusNode?.dispose();
    cedulaController?.dispose();

    nombrefarmaciaFocusNode?.dispose();
    nombrefarmaciaController?.dispose();

    direccionFocusNode?.dispose();
    direccionController?.dispose();

    provinciaFocusNode?.dispose();
    provinciaController?.dispose();

    ciudadFocusNode?.dispose();
    ciudadController?.dispose();

    rucFocusNode?.dispose();
    rucController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
