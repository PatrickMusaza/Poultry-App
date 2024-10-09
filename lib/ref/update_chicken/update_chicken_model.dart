import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_chicken_widget.dart' show UpdateChickenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateChickenModel extends FlutterFlowModel<UpdateChickenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for chickens widget.
  FocusNode? chickensFocusNode;
  TextEditingController? chickensTextController;
  String? Function(BuildContext, String?)? chickensTextControllerValidator;
  String? _chickensTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2tyc13re' /* Please enter the chicken detai... */,
      );
    }

    return null;
  }

  // State field(s) for days widget.
  FocusNode? daysFocusNode;
  TextEditingController? daysTextController;
  String? Function(BuildContext, String?)? daysTextControllerValidator;
  String? _daysTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o3qd5pvv' /* Please enter price for a day o... */,
      );
    }

    return null;
  }

  // State field(s) for broiler widget.
  FocusNode? broilerFocusNode;
  TextEditingController? broilerTextController;
  String? Function(BuildContext, String?)? broilerTextControllerValidator;
  String? _broilerTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    chickensTextControllerValidator = _chickensTextControllerValidator;
    daysTextControllerValidator = _daysTextControllerValidator;
    broilerTextControllerValidator = _broilerTextControllerValidator;
  }

  @override
  void dispose() {
    chickensFocusNode?.dispose();
    chickensTextController?.dispose();

    daysFocusNode?.dispose();
    daysTextController?.dispose();

    broilerFocusNode?.dispose();
    broilerTextController?.dispose();
  }
}
