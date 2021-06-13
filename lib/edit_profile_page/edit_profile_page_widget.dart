import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../profile_page/profile_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePageWidget extends StatefulWidget {
  EditProfilePageWidget({
    Key key,
    this.user,
  }) : super(key: key);

  final UsersRecord user;

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  String uploadedFileUrl;
  SelectedMedia selectedMedia;
  TextEditingController emailTextController;
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController(text: widget.user.email);
    textController1 = TextEditingController(text: widget.user.displayName);
    textController2 = TextEditingController(text: widget.user.lastName);
  }

  Future<String> uploadPhoto() async {
    if (this.selectedMedia != null &&
        validateFileFormat(this.selectedMedia.storagePath, context)) {
      showUploadMessage(context, 'Uploading file...', showLoading: true);
      final downloadUrl = await uploadData(
          this.selectedMedia.storagePath, this.selectedMedia.bytes);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (downloadUrl != null) {
        showUploadMessage(context, 'Success!');
        return downloadUrl;
      } else {
        showUploadMessage(context, 'Failed to upload media');
        return '';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Profile',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4DB6AC),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                    child: AutoSizeText(
                      '* Required fields',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        selectedMedia = await selectMedia();
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          widget.user.photoUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: TextFormField(
                      controller: emailTextController,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Email*',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        hintText: 'example@example.com',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xB3FFFFFF),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'First Name*',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        hintText: 'John',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xB3FFFFFF),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Last Name*',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        hintText: 'Doe',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xB3FFFFFF),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (emailTextController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email required!',
                              ),
                            ),
                          );
                          return;
                        }
                        await resetPassword(
                          email: emailTextController.text,
                          context: context,
                        );
                      },
                      text: 'Reset Password',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF4DB6AC),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 1000,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final lastName = textController2.text;
                        final displayName = textController1.text;
                        final email = emailTextController.text;
                        final photoUrl = selectedMedia != null ? await uploadPhoto() : widget.user.photoUrl;
            
                        final usersRecordData = createUsersRecordData(
                          lastName: lastName,
                          displayName: displayName,
                          email: email,
                          photoUrl: photoUrl,
                        );
            
            
                        await currentUserReference.update(usersRecordData);
            
                        Navigator.pop(context);
                      },
                      text: 'Edit',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF4DB6AC),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 1000,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
