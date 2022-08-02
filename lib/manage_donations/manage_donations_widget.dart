import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/donation_tile_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../donation_view_edit/donation_view_edit_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageDonationsWidget extends StatefulWidget {
  const ManageDonationsWidget({Key key}) : super(key: key);

  @override
  _ManageDonationsWidgetState createState() => _ManageDonationsWidgetState();
}

class _ManageDonationsWidgetState extends State<ManageDonationsWidget> {
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
          final manageDonationsClubsRecord = snapshot.data;
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
                                manageDonationsClubsRecord.clubName,
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
                            length: 2,
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
                                            StreamBuilder<
                                                List<DonationsRecord>>(
                                              stream: queryDonationsRecord(
                                                queryBuilder: (donationsRecord) =>
                                                    donationsRecord
                                                        .where('verified',
                                                            isEqualTo: false)
                                                        .where('club_ref',
                                                            isEqualTo:
                                                                manageDonationsClubsRecord
                                                                    .reference)
                                                        .where('season',
                                                            isEqualTo:
                                                                manageDonationsClubsRecord
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
                                                List<DonationsRecord>
                                                    listViewDonationsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewDonationsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewDonationsRecord =
                                                        listViewDonationsRecordList[
                                                            listViewIndex];
                                                    return InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DonationViewEditWidget(
                                                              donation:
                                                                  listViewDonationsRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: DonationTileWidget(
                                                        donation:
                                                            listViewDonationsRecord,
                                                        team:
                                                            listViewDonationsRecord
                                                                .teamRef,
                                                        user:
                                                            listViewDonationsRecord
                                                                .userRef,
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
                                            StreamBuilder<
                                                List<DonationsRecord>>(
                                              stream: queryDonationsRecord(
                                                queryBuilder: (donationsRecord) =>
                                                    donationsRecord
                                                        .where('verified',
                                                            isEqualTo: true)
                                                        .where('season',
                                                            isEqualTo:
                                                                manageDonationsClubsRecord
                                                                    .season)
                                                        .where('club_ref',
                                                            isEqualTo:
                                                                manageDonationsClubsRecord
                                                                    .reference)
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
                                                List<DonationsRecord>
                                                    listViewDonationsRecordList =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewDonationsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewDonationsRecord =
                                                        listViewDonationsRecordList[
                                                            listViewIndex];
                                                    return InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DonationViewEditWidget(
                                                              donation:
                                                                  listViewDonationsRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: DonationTileWidget(
                                                        donation:
                                                            listViewDonationsRecord,
                                                        team:
                                                            listViewDonationsRecord
                                                                .teamRef,
                                                        user:
                                                            listViewDonationsRecord
                                                                .userRef,
                                                      ),
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
