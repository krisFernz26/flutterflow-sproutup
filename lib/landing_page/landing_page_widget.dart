import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../registration_page/registration_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageWidget extends StatefulWidget {
  LandingPageWidget({Key key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x00FFFFFF),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4DB6AC),
          ),
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'SproutUp',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: AutoSizeText(
                    'Plant your seed in the world of innovation',
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
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPageWidget(),
                        ),
                      );
                    },
                    text: 'Create an Account',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: Color(0x00FFFFFF),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.tertiaryColor,
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
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
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
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: AutoSizeText(
                    'Welcome to SproutUp',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AutoSizeText(
                  'SproutUp is a platform wherein you could share your ideas and get support in doing what you love.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.tertiaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
