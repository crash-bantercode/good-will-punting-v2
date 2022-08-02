import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberAddTileWidget extends StatefulWidget {
  const MemberAddTileWidget({
    Key key,
    this.user,
    this.team,
  }) : super(key: key);

  final UsersRecord user;
  final TeamsRecord team;

  @override
  _MemberAddTileWidgetState createState() => _MemberAddTileWidgetState();
}

class _MemberAddTileWidgetState extends State<MemberAddTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                  child: Text(
                    widget.user.displayName,
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Spacer(),
                if (widget.user.teamRef == widget.team.reference)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.9, 0),
                      child: InkWell(
                        onTap: () async {
                          final usersUpdateData = {
                            'team_ref': FieldValue.delete(),
                          };
                          await widget.user.reference.update(usersUpdateData);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.minus,
                          color: FlutterFlowTheme.of(context).themeRed,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                if (widget.user.teamRef != widget.team.reference)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.9, 0),
                      child: InkWell(
                        onTap: () async {
                          final usersUpdateData = createUsersRecordData(
                            teamRef: widget.team.reference,
                          );
                          await widget.user.reference.update(usersUpdateData);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24,
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
  }
}
