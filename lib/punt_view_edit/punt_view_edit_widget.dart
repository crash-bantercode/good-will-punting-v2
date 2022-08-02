import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../manage_punts/manage_punts_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PuntViewEditWidget extends StatefulWidget {
  const PuntViewEditWidget({
    Key key,
    this.punt,
  }) : super(key: key);

  final PuntsRecord punt;

  @override
  _PuntViewEditWidgetState createState() => _PuntViewEditWidgetState();
}

class _PuntViewEditWidgetState extends State<PuntViewEditWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeamsRecord>(
      future: TeamsRecord.getDocumentOnce(widget.punt.teamRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final puntViewEditTeamsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardWidget(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              puntViewEditTeamsRecord.teamShortName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 30,
                                  ),
                            ),
                            Text(
                              'Punt result',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 20,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      widget.punt.puntSlip,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.punt.puntSlip,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.punt.puntSlip,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.punt.puntSlip,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (widget.punt.verified == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Text(
                                'Status:    ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            if (widget.punt.winner ?? true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  'Won: ${formatNumber(
                                    widget.punt.winAmount,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '\$',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            if (widget.punt.winner ?? true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  'Lost: ${formatNumber(
                                    widget.punt.stake,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '\$',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .themeRed,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Result:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 20,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget.punt.verified) {
                                if (widget.punt.winner) {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ManagePuntsWidget(),
                                    ),
                                    (r) => false,
                                  );
                                } else {
                                  final puntsUpdateData = createPuntsRecordData(
                                    winner: true,
                                  );
                                  await widget.punt.reference
                                      .update(puntsUpdateData);

                                  final teamsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        widget.punt.winAmount),
                                    'season_overall': FieldValue.increment(
                                        widget.punt.winAmount),
                                  };
                                  await puntViewEditTeamsRecord.reference
                                      .update(teamsUpdateData);

                                  final clubsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        widget.punt.winAmount),
                                  };
                                  await puntViewEditTeamsRecord.clubRef
                                      .update(clubsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ManagePuntsWidget(),
                                    ),
                                  );
                                }

                                return;
                              } else {
                                final puntsUpdateData = createPuntsRecordData(
                                  winner: true,
                                  verified: true,
                                );
                                await widget.punt.reference
                                    .update(puntsUpdateData);

                                final teamsUpdateData = {
                                  'season_winnings': FieldValue.increment(
                                      widget.punt.winAmount),
                                  'season_overall': FieldValue.increment(
                                      widget.punt.winAmount),
                                };
                                await puntViewEditTeamsRecord.reference
                                    .update(teamsUpdateData);

                                final clubsUpdateData = {
                                  'season_winnings': FieldValue.increment(
                                      widget.punt.winAmount),
                                };
                                await puntViewEditTeamsRecord.clubRef
                                    .update(clubsUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ManagePuntsWidget(),
                                  ),
                                );
                                return;
                              }
                            },
                            text: 'Winner',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget.punt.verified) {
                                if (widget.punt.winner) {
                                  final puntsUpdateData = createPuntsRecordData(
                                    winner: false,
                                  );
                                  await widget.punt.reference
                                      .update(puntsUpdateData);

                                  final teamsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        -(widget.punt.winAmount)),
                                    'season_overall': FieldValue.increment(
                                        -(widget.punt.winAmount)),
                                  };
                                  await puntViewEditTeamsRecord.reference
                                      .update(teamsUpdateData);

                                  final clubsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        -(widget.punt.winAmount)),
                                  };
                                  await puntViewEditTeamsRecord.clubRef
                                      .update(clubsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ManagePuntsWidget(),
                                    ),
                                  );
                                  return;
                                } else {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ManagePuntsWidget(),
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                final puntsUpdateData = createPuntsRecordData(
                                  verified: true,
                                  winner: false,
                                );
                                await widget.punt.reference
                                    .update(puntsUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ManagePuntsWidget(),
                                  ),
                                );
                                return;
                              }
                            },
                            text: 'Loser',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).themeRed,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
