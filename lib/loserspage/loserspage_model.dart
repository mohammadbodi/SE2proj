import '/flutter_flow/flutter_flow_util.dart';
import 'loserspage_widget.dart' show LoserspageWidget;
import 'package:flutter/material.dart';

class LoserspageModel extends FlutterFlowModel<LoserspageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
