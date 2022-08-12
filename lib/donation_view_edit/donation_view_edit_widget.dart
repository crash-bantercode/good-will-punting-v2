import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../manage_donations/manage_donations_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DonationViewEditWidget extends StatefulWidget {
  const DonationViewEditWidget({
    Key key,
    this.donation,
  }) : super(key: key);

  final DonationsRecord donation;

  @override
  _DonationViewEditWidgetState createState() => _DonationViewEditWidgetState();
}

class _DonationViewEditWidgetState extends State<DonationViewEditWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UsersRecord>(
      future: UsersRecord.getDocumentOnce(widget.donation.userRef),
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
        final donationViewEditUsersRecord = snapshot.data;
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
                              donationViewEditUsersRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 30,
                                  ),
                            ),
                            FutureBuilder<ClubsRecord>(
                              future: ClubsRecord.getDocumentOnce(
                                  widget.donation.clubRef),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final textClubsRecord = snapshot.data;
                                return Text(
                                  'Donation ID: ${textClubsRecord.clubShortName}-${widget.donation.donationId?.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20,
                                      ),
                                );
                              },
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
                                      widget.donation.puntSlip,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.donation.puntSlip,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.donation.puntSlip,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.donation.puntSlip,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Donation: ${formatNumber(
                              widget.donation.donation,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                              currency: '\$',
                            )}',
                            textAlign: TextAlign.center,
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
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Confirm'),
                                            content: Text(
                                                'You are confirming you have recieved this donation and it all checks out?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                if (widget.donation.verified) {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Donation verified!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                  return;
                                } else {
                                  final donationsUpdateData =
                                      createDonationsRecordData(
                                    verified: true,
                                  );
                                  await widget.donation.reference
                                      .update(donationsUpdateData);

                                  final usersUpdateData = {
                                    'season_donations': FieldValue.increment(
                                        widget.donation.donation),
                                  };
                                  await donationViewEditUsersRecord.reference
                                      .update(usersUpdateData);

                                  final teamsUpdateData = {
                                    'season_overall': FieldValue.increment(
                                      widget.donation.donation),                                    
                                    'season_donations': FieldValue.increment(
                                        widget.donation.donation),
                                  };
                                  await donationViewEditUsersRecord.teamRef
                                      .update(teamsUpdateData);

                                  final clubsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        widget.donation.donation),
                                  };
                                  await donationViewEditUsersRecord.clubRef
                                      .update(clubsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Donation verified!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                return;
                              }
                            },
                            text: 'Received',
                            icon: FaIcon(
                              FontAwesomeIcons.checkDouble,
                            ),
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
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Not Received?'),
                                            content: Text(
                                                'This donation will be put back in the pile. Tell them to sort it out and check again later to confirm it.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                if (widget.donation.verified) {
                                  final donationsUpdateData =
                                      createDonationsRecordData(
                                    verified: false,
                                  );
                                  await widget.donation.reference
                                      .update(donationsUpdateData);

                                  final usersUpdateData = {
                                    'season_donations': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.userRef
                                      .update(usersUpdateData);

                                  final teamsUpdateData = {
                                    'season_donations': FieldValue.increment(
                                        -(widget.donation.donation)),
                                    'season_overall': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.teamRef
                                      .update(teamsUpdateData);

                                  final clubsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.clubRef
                                      .update(clubsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pending for now!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).trueBlue,
                                    ),
                                  );
                                  return;
                                } else {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pending for now!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).trueBlue,
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                return;
                              }
                            },
                            text: 'Not yet',
                            icon: FaIcon(
                              FontAwesomeIcons.ban,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).trueBlue,
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
                          InkWell(
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Delete Donation'),
                                            content: Text(
                                                'This donation was not received or was way off the mark. Delete it so they can resubmit?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                if (widget.donation.verified) {
                                  final usersUpdateData = {
                                    'season_donations': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.userRef
                                      .update(usersUpdateData);

                                  final teamsUpdateData = {
                                    'season_donations': FieldValue.increment(
                                        -(widget.donation.donation)),
                                    'season_overall': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.teamRef
                                      .update(teamsUpdateData);

                                  final clubsUpdateData = {
                                    'season_winnings': FieldValue.increment(
                                        -(widget.donation.donation)),
                                  };
                                  await widget.donation.clubRef
                                      .update(clubsUpdateData);
                                  await widget.donation.reference.delete();
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Deleted!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).trueBlue,
                                    ),
                                  );
                                  return;
                                } else {
                                  await widget.donation.reference.delete();
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDonationsWidget(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Deleted!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).trueBlue,
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                return;
                              }
                            },
                            child: FaIcon(
                              FontAwesomeIcons.solidTrashAlt,
                              color: FlutterFlowTheme.of(context).themeRed,
                              size: 30,
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
