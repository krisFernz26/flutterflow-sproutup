import 'package:firebase_auth/firebase_auth.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4DB6AC),
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
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
            padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: AutoSizeText(
                      'SproutUp',
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: AutoSizeText(
                      'Login to your SproutUp account',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
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
                        labelText: 'Email',
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
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: TextFormField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Password',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        hintText: 'Password',
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
                        User user;
                        if (emailTextController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email required!',
                              ),
                            ),
                          );
                          return;
                        } else if (passwordTextController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password required!',
                              ),
                            ),
                          );
                          return;
                        } else
                        user = await signInWithEmail(
                          context,
                          emailTextController.text,
                          passwordTextController.text,
                        );
                        if (user == null) {
                          return;
                        }

                        final dateLastLoggedIn = getCurrentTimestamp;

                        final usersRecordData = createUsersRecordData(
                          dateLastLoggedIn: dateLastLoggedIn,
                        );

                        await currentUserReference.update(usersRecordData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'HomePage'),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Login',
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
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
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
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.secondaryColor,
                          width: 1,
                        ),
                        borderRadius: 1000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
