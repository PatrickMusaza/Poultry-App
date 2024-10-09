// ignore_for_file: unused_import

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'pricing_widget.dart' show PricingWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PricingModel extends FlutterFlowModel<PricingWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for currency widget.
  String? currencyValue;
  FormFieldController<String>? currencyValueController;
  // State field(s) for Chicken widget.
  FocusNode? chickenFocusNode;
  TextEditingController? chickenTextController;
  String? Function(BuildContext, String?)? chickenTextControllerValidator;
  String? _chickenTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rl69t9ir' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Days widget.
  FocusNode? daysFocusNode;
  TextEditingController? daysTextController;
  String? Function(BuildContext, String?)? daysTextControllerValidator;
  String? _daysTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xf1qfq0a' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for broilers widget.
  FocusNode? broilersFocusNode;
  TextEditingController? broilersTextController;
  String? Function(BuildContext, String?)? broilersTextControllerValidator;
  String? _broilersTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zln2e12l' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for house widget.
  FocusNode? houseFocusNode;
  TextEditingController? houseTextController;
  String? Function(BuildContext, String?)? houseTextControllerValidator;
  String? _houseTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '16dpa6k7' /* Field is required */,
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
        's0oct2ou' /* Field is required */,
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
        'dfqzom7a' /* Field is required */,
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
        'evu8j8ld' /* Field is required */,
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
        'ouogdmwj' /* Field is required */,
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
        '5yvy3w38' /* Field is required */,
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
        'sht7ac74' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for vaccine widget.
  FocusNode? vaccineFocusNode;
  TextEditingController? vaccineTextController;
  String? Function(BuildContext, String?)? vaccineTextControllerValidator;
  String? _vaccineTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7z7e3yjz' /* Field is required */,
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
        'g9chvi9w' /* Field is required */,
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
        'bj0ne6jo' /* Field is required */,
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
        '6ah5gjq5' /* Field is required */,
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
        'mwuki7lq' /* Field is required */,
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
        'yac4rbvs' /* Field is required */,
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
        '1eg59ozi' /* Field is required */,
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
        't9onmg4o' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for maize widget.
  FocusNode? maizeFocusNode;
  TextEditingController? maizeTextController;
  String? Function(BuildContext, String?)? maizeTextControllerValidator;
  String? _maizeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x4zfcabi' /* Field is required */,
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
        '7gf8z0gr' /* Field is required */,
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
        'w4xo1kdq' /* Field is required */,
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
        '7sdxuk2g' /* Field is required */,
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
        'qi8foxkn' /* Field is required */,
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
        'w30bmuy2' /* Field is required */,
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
        '1ivdxln9' /* Field is required */,
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
        '2uxpghq6' /* Field is required */,
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
        'omhiu19b' /* Field is required */,
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
        'qmteavrn' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    chickenTextControllerValidator = _chickenTextControllerValidator;
    daysTextControllerValidator = _daysTextControllerValidator;
    broilersTextControllerValidator = _broilersTextControllerValidator;
    houseTextControllerValidator = _houseTextControllerValidator;
    drinkerTextControllerValidator = _drinkerTextControllerValidator;
    feederTextControllerValidator = _feederTextControllerValidator;
    brooderTextControllerValidator = _brooderTextControllerValidator;
    lampTextControllerValidator = _lampTextControllerValidator;
    boreholeTextControllerValidator = _boreholeTextControllerValidator;
    toolsTextControllerValidator = _toolsTextControllerValidator;
    vaccineTextControllerValidator = _vaccineTextControllerValidator;
    sellingTextControllerValidator = _sellingTextControllerValidator;
    transportTextControllerValidator = _transportTextControllerValidator;
    feedskgsTextControllerValidator = _feedskgsTextControllerValidator;
    waterTextControllerValidator = _waterTextControllerValidator;
    powerTextControllerValidator = _powerTextControllerValidator;
    litterTextControllerValidator = _litterTextControllerValidator;
    labourTextControllerValidator = _labourTextControllerValidator;
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
    chickenFocusNode?.dispose();
    chickenTextController?.dispose();

    daysFocusNode?.dispose();
    daysTextController?.dispose();

    broilersFocusNode?.dispose();
    broilersTextController?.dispose();

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
