import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_investment_widget.dart' show UpdateInvestmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateInvestmentModel extends FlutterFlowModel<UpdateInvestmentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for house widget.
  FocusNode? houseFocusNode;
  TextEditingController? houseTextController;
  String? Function(BuildContext, String?)? houseTextControllerValidator;
  String? _houseTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dpo9m60l' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for drinker widget.
  FocusNode? drinkerFocusNode;
  TextEditingController? drinkerTextController;
  String? Function(BuildContext, String?)? drinkerTextControllerValidator;
  String? _drinkerTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r2bz7ctt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for feeder widget.
  FocusNode? feederFocusNode;
  TextEditingController? feederTextController;
  String? Function(BuildContext, String?)? feederTextControllerValidator;
  String? _feederTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'el91xi5h' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for brooder widget.
  FocusNode? brooderFocusNode;
  TextEditingController? brooderTextController;
  String? Function(BuildContext, String?)? brooderTextControllerValidator;
  String? _brooderTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uodqje2k' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lamp widget.
  FocusNode? lampFocusNode;
  TextEditingController? lampTextController;
  String? Function(BuildContext, String?)? lampTextControllerValidator;
  String? _lampTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0zg1unot' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for borehole widget.
  FocusNode? boreholeFocusNode;
  TextEditingController? boreholeTextController;
  String? Function(BuildContext, String?)? boreholeTextControllerValidator;
  String? _boreholeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xoqbpvqw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for tools widget.
  FocusNode? toolsFocusNode;
  TextEditingController? toolsTextController;
  String? Function(BuildContext, String?)? toolsTextControllerValidator;
  String? _toolsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'anv3ykt5' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    houseTextControllerValidator = _houseTextControllerValidator;
    drinkerTextControllerValidator = _drinkerTextControllerValidator;
    feederTextControllerValidator = _feederTextControllerValidator;
    brooderTextControllerValidator = _brooderTextControllerValidator;
    lampTextControllerValidator = _lampTextControllerValidator;
    boreholeTextControllerValidator = _boreholeTextControllerValidator;
    toolsTextControllerValidator = _toolsTextControllerValidator;
  }

  @override
  void dispose() {
    houseFocusNode?.dispose();
    houseTextController?.dispose();

    drinkerFocusNode?.dispose();
    drinkerTextController?.dispose();

    feederFocusNode?.dispose();
    feederTextController?.dispose();

    brooderFocusNode?.dispose();
    brooderTextController?.dispose();

    lampFocusNode?.dispose();
    lampTextController?.dispose();

    boreholeFocusNode?.dispose();
    boreholeTextController?.dispose();

    toolsFocusNode?.dispose();
    toolsTextController?.dispose();
  }
}
