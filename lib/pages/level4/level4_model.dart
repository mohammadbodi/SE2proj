import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'level4_widget.dart' show Level4Widget;
import 'package:flutter/material.dart';

class Level4Model extends FlutterFlowModel<Level4Widget> {
  ///  Local state fields for this page.

  double coreXAlingnment = 1.0;

  double? playerYAlingnment = 0.45;

  double playerInistialY = 0.4;

  bool? avoid;

  double avoidHight = 0.0;

  double gameendtimer = 0.0;

  double coreinitialy = 1.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? playerAviod;
  InstantTimer? gametime;
  InstantTimer? coremovetimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    playerAviod?.cancel();
    gametime?.cancel();
    coremovetimer?.cancel();
  }
}
