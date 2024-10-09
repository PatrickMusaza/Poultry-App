import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_feeds_widget.dart' show UpdateFeedsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateFeedsModel extends FlutterFlowModel<UpdateFeedsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for maize widget.
  FocusNode? maizeFocusNode;
  TextEditingController? maizeTextController;
  String? Function(BuildContext, String?)? maizeTextControllerValidator;
  String? _maizeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eo15vfws' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for fatSoya widget.
  FocusNode? fatSoyaFocusNode;
  TextEditingController? fatSoyaTextController;
  String? Function(BuildContext, String?)? fatSoyaTextControllerValidator;
  String? _fatSoyaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hgzpvwas' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lowfatSoya widget.
  FocusNode? lowfatSoyaFocusNode;
  TextEditingController? lowfatSoyaTextController;
  String? Function(BuildContext, String?)? lowfatSoyaTextControllerValidator;
  String? _lowfatSoyaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eb1v0k0c' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for fish widget.
  FocusNode? fishFocusNode;
  TextEditingController? fishTextController;
  String? Function(BuildContext, String?)? fishTextControllerValidator;
  String? _fishTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7i652xyt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DCP widget.
  FocusNode? dcpFocusNode;
  TextEditingController? dcpTextController;
  String? Function(BuildContext, String?)? dcpTextControllerValidator;
  String? _dcpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm23cek9e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lime widget.
  FocusNode? limeFocusNode;
  TextEditingController? limeTextController;
  String? Function(BuildContext, String?)? limeTextControllerValidator;
  String? _limeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1l8m2ch7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for salt widget.
  FocusNode? saltFocusNode;
  TextEditingController? saltTextController;
  String? Function(BuildContext, String?)? saltTextControllerValidator;
  String? _saltTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ey5o8wmz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Methionine widget.
  FocusNode? methionineFocusNode;
  TextEditingController? methionineTextController;
  String? Function(BuildContext, String?)? methionineTextControllerValidator;
  String? _methionineTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h8k3w51m' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for mineral widget.
  FocusNode? mineralFocusNode;
  TextEditingController? mineralTextController;
  String? Function(BuildContext, String?)? mineralTextControllerValidator;
  String? _mineralTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v5y4tdw3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Concentrates widget.
  FocusNode? concentratesFocusNode;
  TextEditingController? concentratesTextController;
  String? Function(BuildContext, String?)? concentratesTextControllerValidator;
  String? _concentratesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '11ejn9x7' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    maizeTextControllerValidator = _maizeTextControllerValidator;
    fatSoyaTextControllerValidator = _fatSoyaTextControllerValidator;
    lowfatSoyaTextControllerValidator = _lowfatSoyaTextControllerValidator;
    fishTextControllerValidator = _fishTextControllerValidator;
    dcpTextControllerValidator = _dcpTextControllerValidator;
    limeTextControllerValidator = _limeTextControllerValidator;
    saltTextControllerValidator = _saltTextControllerValidator;
    methionineTextControllerValidator = _methionineTextControllerValidator;
    mineralTextControllerValidator = _mineralTextControllerValidator;
    concentratesTextControllerValidator = _concentratesTextControllerValidator;
  }

  @override
  void dispose() {
    maizeFocusNode?.dispose();
    maizeTextController?.dispose();

    fatSoyaFocusNode?.dispose();
    fatSoyaTextController?.dispose();

    lowfatSoyaFocusNode?.dispose();
    lowfatSoyaTextController?.dispose();

    fishFocusNode?.dispose();
    fishTextController?.dispose();

    dcpFocusNode?.dispose();
    dcpTextController?.dispose();

    limeFocusNode?.dispose();
    limeTextController?.dispose();

    saltFocusNode?.dispose();
    saltTextController?.dispose();

    methionineFocusNode?.dispose();
    methionineTextController?.dispose();

    mineralFocusNode?.dispose();
    mineralTextController?.dispose();

    concentratesFocusNode?.dispose();
    concentratesTextController?.dispose();
  }
}
