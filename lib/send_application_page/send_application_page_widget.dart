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
import 'package:uuid/uuid.dart';

class SendApplicationPageWidget extends StatefulWidget {
  SendApplicationPageWidget({
    Key key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord startup;

  @override
  _SendApplicationPageWidgetState createState() =>
      _SendApplicationPageWidgetState();
}

class _SendApplicationPageWidgetState extends State<SendApplicationPageWidget> {
  TextEditingController textController;
  final uid = Uuid();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: AutoSizeText(
          'Application Request',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.secondaryColor,
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
            color: FlutterFlowTheme.primaryColor,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: AutoSizeText(
                      widget.startup.name,
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                        hintText:
                            'State your reasons for applying and why you want toapply',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.tertiaryColor.withOpacity(0.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                      maxLines: 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    child: Text(
                      'SproutUp handles requests as messages. Once you hit the send button, you\'ll be sending this message as your first message to this startup.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.tertiaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        final dateCreated = getCurrentTimestamp;
                        final purpose = 'Application';

                        final roomsRecordData = {
                          ...createRoomsRecordData(
                            dateCreated: dateCreated,
                            purpose: purpose,
                          ),
                          'users': FieldValue.arrayUnion([
                            widget.startup.userRegisterer,
                            currentUserReference
                          ]),
                          'startups':
                              FieldValue.arrayUnion([widget.startup.reference]),
                        };
                        final roomId = uid.v4();
                        await RoomsRecord.collection
                            .doc(roomId)
                            .set(roomsRecordData);
                        final author = currentUserReference;
                        final text = textController.text;
                        final image = '';
                        final video = '';
                        final dateSent = getCurrentTimestamp;

                        final messagesRecordData = createMessagesRecordData(
                            author: author,
                            text: text,
                            image: image,
                            video: video,
                            dateSent: dateSent,
                            room: RoomsRecord.collection.doc(roomId));

                        final startupsRecordData = {
                          "applicant_count": FieldValue.increment(1),
                        };

                        await StartupsRecord.collection
                            .doc(widget.startup.reference.id)
                            .update(startupsRecordData);

                        await MessagesRecord.collection
                            .doc()
                            .set(messagesRecordData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'InboxPage'),
                          ),
                          (r) => false,
                        );
                      }
                    },
                    text: 'Send',
                    options: FFButtonOptions(
                      elevation: 0,
                      width: 130,
                      height: 40,
                      color: Color(0x00FFFFFF),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.tertiaryColor,
                        width: 1,
                      ),
                      borderRadius: 120,
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
