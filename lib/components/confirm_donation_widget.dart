import '../backend/backend.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmDonationWidget extends StatefulWidget {
  const ConfirmDonationWidget({
    Key key,
    this.donationId,
    this.club,
  }) : super(key: key);

  final int donationId;
  final ClubsRecord club;

  @override
  _ConfirmDonationWidgetState createState() => _ConfirmDonationWidgetState();
}

class _ConfirmDonationWidgetState extends State<ConfirmDonationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(0, -3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Your Donation ID: ${widget.donationId.toString()}',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontSize: 22,
                  ),
            ),
            Spacer(),
            Text(
              'Please send your donation to your clubs nominated bank account in the following format:',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontSize: 18,
                  ),
            ),
            Spacer(),
            Text(
              '${widget.club.clubShortName}-${widget.donationId.toString()}',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            Spacer(),
            Text(
              'BSB: ${widget.club.clubBsb}    ACC: ${widget.club.clubAccount}',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Spacer(),
            FFButtonWidget(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardWidget(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Donation submitted!',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  ),
                );
              },
              text: 'Confirm Payment',
              icon: FaIcon(
                FontAwesomeIcons.donate,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
