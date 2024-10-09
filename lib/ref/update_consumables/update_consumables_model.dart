import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_consumables_widget.dart' show UpdateConsumablesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateConsumablesModel extends FlutterFlowModel<UpdateConsumablesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for vaccine widget.
  FocusNode? vaccineFocusNode;
  TextEditingController? vaccineTextController;
  String? Function(BuildContext, String?)? vaccineTextControllerValidator;
  String? _vaccineTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3onczu96' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for selling widget.
  FocusNode? sellingFocusNode;
  TextEditingController? sellingTextController;
  String? Function(BuildContext, String?)? sellingTextControllerValidator;
  String? _sellingTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wasjm10o' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for transport widget.
  FocusNode? transportFocusNode;
  TextEditingController? transportTextController;
  String? Function(BuildContext, String?)? transportTextControllerValidator;
  String? _transportTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cszmlefp' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for feedskgs widget.
  FocusNode? feedskgsFocusNode;
  TextEditingController? feedskgsTextController;
  String? Function(BuildContext, String?)? feedskgsTextControllerValidator;
  String? _feedskgsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oj03lci7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for water widget.
  FocusNode? waterFocusNode;
  TextEditingController? waterTextController;
  String? Function(BuildContext, String?)? waterTextControllerValidator;
  String? _waterTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lub0oaq4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Power widget.
  FocusNode? powerFocusNode;
  TextEditingController? powerTextController;
  String? Function(BuildContext, String?)? powerTextControllerValidator;
  String? _powerTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'raxxbp0a' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for litter widget.
  FocusNode? litterFocusNode;
  TextEditingController? litterTextController;
  String? Function(BuildContext, String?)? litterTextControllerValidator;
  String? _litterTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bkxr3hyd' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for labour widget.
  FocusNode? labourFocusNode;
  TextEditingController? labourTextController;
  String? Function(BuildContext, String?)? labourTextControllerValidator;
  String? _labourTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3s8pvuqa' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    vaccineTextControllerValidator = _vaccineTextControllerValidator;
    sellingTextControllerValidator = _sellingTextControllerValidator;
    transportTextControllerValidator = _transportTextControllerValidator;
    feedskgsTextControllerValidator = _feedskgsTextControllerValidator;
    waterTextControllerValidator = _waterTextControllerValidator;
    powerTextControllerValidator = _powerTextControllerValidator;
    litterTextControllerValidator = _litterTextControllerValidator;
    labourTextControllerValidator = _labourTextControllerValidator;
  }

  @override
  void dispose() {
    vaccineFocusNode?.dispose();
    vaccineTextController?.dispose();

    sellingFocusNode?.dispose();
    sellingTextController?.dispose();

    transportFocusNode?.dispose();
    transportTextController?.dispose();

    feedskgsFocusNode?.dispose();
    feedskgsTextController?.dispose();

    waterFocusNode?.dispose();
    waterTextController?.dispose();

    powerFocusNode?.dispose();
    powerTextController?.dispose();

    litterFocusNode?.dispose();
    litterTextController?.dispose();

    labourFocusNode?.dispose();
    labourTextController?.dispose();
  }
}
