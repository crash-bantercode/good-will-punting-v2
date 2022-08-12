import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/confirm_donation_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateWidget extends StatefulWidget {
  const DonateWidget({Key key}) : super(key: key);

  @override
  _DonateWidgetState createState() => _DonateWidgetState();
}

class _DonateWidgetState extends State<DonateWidget> {
  DonationsRecord createdDonation;
  String uploadedFileUrl = '';
  TextEditingController donationController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    donationController = TextEditingController();
  }

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
          final donateClubsRecord = snapshot.data;
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
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 30,
                                    ),
                              ),
                              Text(
                                'Donation',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: donationController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Donation Amount',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF95A1AC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF95A1AC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                    prefixIcon: Icon(
                                      Icons.attach_money_rounded,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF0F1113),
                                      ),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 80,
                                      allowPhoto: true,
                                      pickerFontFamily: 'Poppins',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      final downloadUrls = (await Future.wait(
                                              selectedMedia.map((m) async =>
                                                  await uploadData(
                                                      m.storagePath, m.bytes))))
                                          .where((u) => u != null)
                                          .toList();
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrls != null &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() => uploadedFileUrl =
                                            downloadUrls.first);
                                        showUploadMessage(
                                          context,
                                          'Success!',
                                        );
                                      } else {
                                        showUploadMessage(
                                          context,
                                          'Failed to upload media',
                                        );
                                        return;
                                      }
                                    }
                                  },
                                  text: 'Upload Slip',
                                  icon: FaIcon(
                                    FontAwesomeIcons.cloudUploadAlt,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60,
                                    color:
                                        FlutterFlowTheme.of(context).trueBlue,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
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
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: uploadedFileUrl != null &&
                                        uploadedFileUrl != '',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        uploadedFileUrl,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              if (valueOrDefault<bool>(
                                      uploadedFileUrl != '', false))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (functions.validateDonationSubmit(
                                        uploadedFileUrl,
                                        double.parse(donationController.text))) {
                                      final donationsCreateData =
                                          createDonationsRecordData(
                                        donationId: functions.increment(
                                            donateClubsRecord.puntCount),                                        
                                        winAmount: double.parse(donationController.text) * 10, // Todo: this will come from settings
                                        donation: double.parse(donationController.text),
                                        verified: false,
                                        season: donateClubsRecord.season,
                                        puntSlip: uploadedFileUrl,
                                        createdDate: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        clubRef: donateClubsRecord.reference,
                                        teamRef: currentUserDocument?.teamRef,
                                      );
                                      var donationsRecordReference =
                                          DonationsRecord.createDoc(
                                              currentUserReference);
                                      await donationsRecordReference
                                          .set(donationsCreateData);
                                      createdDonation =
                                          DonationsRecord.getDocumentFromData(
                                              donationsCreateData,
                                              donationsRecordReference);
                                      _shouldSetState = true;

                                      final clubsUpdateData = {
                                        'punt_count': FieldValue.increment(1),
                                      };
                                      await donateClubsRecord.reference
                                          .update(clubsUpdateData);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please enter stake/odds and upload your slip!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFB65050),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      barrierColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            child: ConfirmDonationWidget(
                                              donationId:
                                                  createdDonation.donationId,
                                              club: donateClubsRecord,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'Submit',
                                  icon: FaIcon(
                                    FontAwesomeIcons.donate,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
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
                              ),
                            ],
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
