import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardsWidget extends StatefulWidget {
  const LeaderboardsWidget({Key key}) : super(key: key);

  @override
  _LeaderboardsWidgetState createState() => _LeaderboardsWidgetState();
}

class _LeaderboardsWidgetState extends State<LeaderboardsWidget> {
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
          final leaderboardsClubsRecord = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
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
                                  leaderboardsClubsRecord.clubName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 30,
                                      ),
                                ),
                                Text(
                                  'Leaderboards',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100,
                                height: MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: DefaultTabController(
                                  length: 3,
                                  initialIndex: 0,
                                  child: Column(
                                    children: [
                                      TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        tabs: [
                                          Tab(
                                            text: 'Overall',
                                          ),
                                          Tab(
                                            text: 'Team',
                                          ),
                                          Tab(
                                            text: 'Donations',
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      10, 10, 10, 10),
                                              child: FutureBuilder<
                                                  List<TeamsRecord>>(
                                                future: queryTeamsRecordOnce(
                                                  parent: leaderboardsClubsRecord
                                                      .reference,
                                                  queryBuilder: (teamsRecord) =>
                                                      teamsRecord
                                                          .where('club_ref',
                                                              isEqualTo:
                                                                  leaderboardsClubsRecord
                                                                      .reference)
                                                          .orderBy(
                                                              'season_overall',
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
                                                  List<TeamsRecord>
                                                      listViewTeamsRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTeamsRecordList
                                                            .length,
                                                    itemBuilder:
                                                        (context, listViewIndex) {
                                                      final listViewTeamsRecord =
                                                          listViewTeamsRecordList[
                                                              listViewIndex];
                                                      return Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${functions.getIndex(listViewIndex).toString()}.     ${listViewTeamsRecord.teamName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                listViewTeamsRecord
                                                                    .seasonOverall,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                                currency: '\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      10, 10, 10, 10),
                                              child: FutureBuilder<
                                                  List<TeamsRecord>>(
                                                future: queryTeamsRecordOnce(
                                                  parent: leaderboardsClubsRecord
                                                      .reference,
                                                  queryBuilder: (teamsRecord) =>
                                                      teamsRecord
                                                          .where('club_ref',
                                                              isEqualTo:
                                                                  leaderboardsClubsRecord
                                                                      .reference)
                                                          .orderBy(
                                                              'season_winnings',
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
                                                  List<TeamsRecord>
                                                      listViewTeamsRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTeamsRecordList
                                                            .length,
                                                    itemBuilder:
                                                        (context, listViewIndex) {
                                                      final listViewTeamsRecord =
                                                          listViewTeamsRecordList[
                                                              listViewIndex];
                                                      return Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${functions.getIndex(listViewIndex).toString()}.     ${listViewTeamsRecord.teamName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                listViewTeamsRecord
                                                                    .seasonWinnings,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                                currency: '\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      10, 10, 10, 10),
                                              child: FutureBuilder<
                                                  List<UsersRecord>>(
                                                future: queryUsersRecordOnce(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord
                                                          .where('club_ref',
                                                              isEqualTo:
                                                                  leaderboardsClubsRecord
                                                                      .reference)
                                                          .orderBy(
                                                              'season_donations',
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
                                                  List<UsersRecord>
                                                      listViewUsersRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewUsersRecordList
                                                            .length,
                                                    itemBuilder:
                                                        (context, listViewIndex) {
                                                      final listViewUsersRecord =
                                                          listViewUsersRecordList[
                                                              listViewIndex];
                                                      return Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${functions.getIndex(listViewIndex).toString()}.     ${listViewUsersRecord.displayName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                listViewUsersRecord
                                                                    .seasonDonations,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                                currency: '\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
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
                      ],
                    ),
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
