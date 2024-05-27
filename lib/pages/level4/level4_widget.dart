import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'level4_model.dart';
export 'level4_model.dart';

class Level4Widget extends StatefulWidget {
  const Level4Widget({super.key});

  @override
  State<Level4Widget> createState() => _Level4WidgetState();
}

class _Level4WidgetState extends State<Level4Widget>
    with TickerProviderStateMixin {
  late Level4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Level4Model());

    animationsMap.addAll({
      'imageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 3500.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-1437.0, 0.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 3500.0.ms,
            begin: const Offset(1438.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {
                  _model.avoid = true;
                });
                _model.playerAviod = InstantTimer.periodic(
                  duration: const Duration(milliseconds: 500),
                  callback: (timer) async {
                    if (_model.avoid!) {
                      setState(() {
                        _model.playerYAlingnment =
                            _model.playerYAlingnment! + -0.5;
                      });
                      if (_model.playerYAlingnment! <= _model.avoidHight) {
                        setState(() {
                          _model.avoid = false;
                        });
                      }
                    } else {
                      setState(() {
                        _model.playerYAlingnment =
                            _model.playerYAlingnment! + 0.05;
                      });
                      if (_model.playerYAlingnment! >= _model.playerInistialY) {
                        setState(() {
                          _model.avoid = null;
                        });
                        _model.playerAviod?.cancel();
                      }
                    }
                  },
                  startImmediately: true,
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/background-1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['imageOnActionTriggerAnimation1']!,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/background-1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['imageOnActionTriggerAnimation2']!,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(
                        -0.77,
                        valueOrDefault<double>(
                          _model.playerYAlingnment,
                          0.0,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/PngItem_459058.png',
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          _model.coreXAlingnment,
                          0.0,
                        ),
                        0.43),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/PngItem_72434.png',
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.99, -0.98),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (animationsMap['imageOnActionTriggerAnimation1'] !=
                            null) {
                          animationsMap['imageOnActionTriggerAnimation1']!
                              .controller
                            ..reset()
                            ..repeat();
                        }
                        if (animationsMap['imageOnActionTriggerAnimation2'] !=
                            null) {
                          animationsMap['imageOnActionTriggerAnimation2']!
                              .controller
                            ..reset()
                            ..repeat();
                        }
                        _model.gametime = InstantTimer.periodic(
                          duration: const Duration(milliseconds: 1000),
                          callback: (timer) async {
                            setState(() {
                              _model.gameendtimer = _model.gameendtimer + 1.0;
                            });
                            if (_model.gameendtimer <= 15.0) {
                              _model.coremovetimer = InstantTimer.periodic(
                                duration: const Duration(milliseconds: 70),
                                callback: (timer) async {
                                  setState(() {
                                    _model.coreXAlingnment =
                                        _model.coreXAlingnment + -0.01;
                                  });
                                  if ((_model.coreXAlingnment <= -0.4) &&
                                      (_model.playerYAlingnment! >= 0.2) &&
                                      (_model.coreXAlingnment >= -0.8) &&
                                      (_model.playerYAlingnment! <= 0.45)) {
                                    _model.coremovetimer?.cancel();
                                    _model.playerAviod?.cancel();
                                    _model.gametime?.cancel();
                                    setState(() {
                                      _model.coreXAlingnment =
                                          _model.coreinitialy;
                                      _model.playerYAlingnment =
                                          _model.playerInistialY;
                                    });

                                    context.goNamed('loserspage');
                                  }
                                  if ((_model.coreXAlingnment <= -0.37) &&
                                      (_model.playerYAlingnment! >= -0.9) &&
                                      (_model.coreXAlingnment >= -0.94) &&
                                      (_model.playerYAlingnment! <= -0.330)) {
                                    _model.coremovetimer?.cancel();
                                    _model.playerAviod?.cancel();
                                    _model.gametime?.cancel();
                                    setState(() {
                                      _model.coreXAlingnment =
                                          _model.coreinitialy;
                                      _model.playerYAlingnment =
                                          _model.playerInistialY;
                                    });

                                    context.goNamed('loserspage');
                                  }
                                  if (_model.coreXAlingnment <= -1.5) {
                                    setState(() {
                                      _model.coreXAlingnment =
                                          _model.coreinitialy;
                                    });
                                  }
                                },
                                startImmediately: true,
                              );
                            } else {
                              context.goNamed('questionpage4');

                              setState(() {
                                _model.gameendtimer = 0.0;
                              });
                              _model.gametime?.cancel();
                              _model.coremovetimer?.cancel();
                            }
                          },
                          startImmediately: true,
                        );
                      },
                      text: 'Start Game',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.0,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              _model.playerYAlingnment.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Text(
                              _model.coreXAlingnment.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          _model.coreXAlingnment,
                          0.0,
                        ),
                        -0.6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/PngItem_72434.png',
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
