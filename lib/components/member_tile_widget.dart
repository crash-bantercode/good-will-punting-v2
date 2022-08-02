import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberTileWidget extends StatefulWidget {
  const MemberTileWidget({
    Key key,
    this.user,
  }) : super(key: key);

  final UsersRecord user;

  @override
  _MemberTileWidgetState createState() => _MemberTileWidgetState();
}

class _MemberTileWidgetState extends State<MemberTileWidget> {
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.user.reference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final toggleIconUsersRecord = snapshot.data;
                          return ToggleIcon(
                            onPressed: () async {
                              final usersUpdateData = {
                                'team_captain':
                                    !toggleIconUsersRecord.teamCaptain,
                              };
                              await toggleIconUsersRecord.reference
                                  .update(usersUpdateData);
                            },
                            value: toggleIconUsersRecord.teamCaptain,
                            onIcon: FaIcon(
                              FontAwesomeIcons.copyright,
                              color: FlutterFlowTheme.of(context).trueBlue,
                              size: 25,
                            ),
                            offIcon: FaIcon(
                              FontAwesomeIcons.copyright,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25,
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final usersUpdateData = {
                          ...createUsersRecordData(
                            teamCaptain: false,
                          ),
                          'team_ref': FieldValue.delete(),
                        };
                        await widget.user.reference.update(usersUpdateData);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.trashAlt,
                        color: FlutterFlowTheme.of(context).themeRed,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.9, 0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF57636C),
                      size: 18,
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
