import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/punt_tile_history_widget.dart';
import '../components/punt_tile_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../punt_view_edit/punt_view_edit_widget.dart';
import '../punt_view_place/punt_view_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagePuntsWidget extends StatefulWidget {
  const ManagePuntsWidget({Key key}) : super(key: key);

  @override
  _ManagePuntsWidgetState createState() => _ManagePuntsWidgetState();
}

class _ManagePuntsWidgetState extends State<ManagePuntsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: FutureBuilder<ClubsRecord>(
        future: ClubsRecord.getDocumentOnce(currentUserDocument?.clubRef),
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
          final managePuntsClubsRecord = snapshot.data;
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
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
                                managePuntsClubsRecord.clubName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 30,
                                    ),
                              ),
                              Text(
                                'Manage Punts',
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  tabs: [
                                    Tab(
                                      text: 'Submitted',
                                    ),
                                    Tab(
                                      text: 'Pending',
                                    ),
                                    Tab(
                                      text: 'History',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<PuntsRecord>>(
                                              stream: queryPuntsRecord(
                                                queryBuilder: (puntsRecord) =>
                                                    puntsRecord
                                                        .where('verified',
                                                            isEqualTo: false)
                                                        .where('placed',
                                                            isEqualTo: false)
                                                        .where('club_ref',
                                                            isEqualTo:
                                                                currentUserDocument
                                                                    ?.clubRef)
                                                        .where('season',
                                                            isEqualTo:
                                                                managePuntsClubsRecord
                                                                    .season)
                                                        .orderBy('created_date',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PuntsRecord>
                                                    listViewPuntsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewPuntsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewPuntsRecord =
                                                        listViewPuntsRecordList[
                                                            listViewIndex];
                                                    return FutureBuilder<
                                                        TeamsRecord>(
                                                      future: TeamsRecord
                                                          .getDocumentOnce(
                                                              listViewPuntsRecord
                                                                  .teamRef),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final puntTileTeamsRecord =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PuntViewPlaceWidget(
                                                                  punt:
                                                                      listViewPuntsRecord,
                                                                  club: 
                                                                      managePuntsClubsRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: PuntTileWidget(
                                                            punt:
                                                                listViewPuntsRecord,
                                                            team:
                                                                puntTileTeamsRecord,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<PuntsRecord>>(
                                              stream: queryPuntsRecord(
                                                queryBuilder: (puntsRecord) =>
                                                    puntsRecord
                                                        .where('verified',
                                                            isEqualTo: false)
                                                        .where('placed',
                                                            isEqualTo: true)
                                                        .where('club_ref',
                                                            isEqualTo:
                                                                currentUserDocument
                                                                    ?.clubRef)
                                                        .where('season',
                                                            isEqualTo:
                                                                managePuntsClubsRecord
                                                                    .season)
                                                        .orderBy('created_date',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PuntsRecord>
                                                    listViewPuntsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewPuntsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewPuntsRecord =
                                                        listViewPuntsRecordList[
                                                            listViewIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: FutureBuilder<
                                                          TeamsRecord>(
                                                        future: TeamsRecord
                                                            .getDocumentOnce(
                                                                listViewPuntsRecord
                                                                    .teamRef),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final puntTileTeamsRecord =
                                                              snapshot.data;
                                                          return InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PuntViewEditWidget(
                                                                    punt:
                                                                        listViewPuntsRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child:
                                                                PuntTileWidget(
                                                              punt:
                                                                  listViewPuntsRecord,
                                                              team:
                                                                  puntTileTeamsRecord,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<PuntsRecord>>(
                                              stream: queryPuntsRecord(
                                                queryBuilder: (puntsRecord) =>
                                                    puntsRecord
                                                        .where('verified',
                                                            isEqualTo: true)
                                                        .where('placed',
                                                            isEqualTo: true)
                                                        .where('club_ref',
                                                            isEqualTo:
                                                                currentUserDocument
                                                                    ?.clubRef)
                                                        .where('season',
                                                            isEqualTo:
                                                                managePuntsClubsRecord
                                                                    .season)
                                                        .orderBy('created_date',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PuntsRecord>
                                                    listViewPuntsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewPuntsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewPuntsRecord =
                                                        listViewPuntsRecordList[
                                                            listViewIndex];
                                                    return FutureBuilder<
                                                        TeamsRecord>(
                                                      future: TeamsRecord
                                                          .getDocumentOnce(
                                                              listViewPuntsRecord
                                                                  .teamRef),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final puntTileHistoryTeamsRecord =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PuntViewEditWidget(
                                                                  punt:
                                                                      listViewPuntsRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child:
                                                              PuntTileHistoryWidget(
                                                            punt:
                                                                listViewPuntsRecord,
                                                            team:
                                                                puntTileHistoryTeamsRecord,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
