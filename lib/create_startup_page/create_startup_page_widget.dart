import 'package:uuid/uuid.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateStartupPageWidget extends StatefulWidget {
  CreateStartupPageWidget({Key key}) : super(key: key);

  @override
  _CreateStartupPageWidgetState createState() =>
      _CreateStartupPageWidgetState();
}

class _CreateStartupPageWidgetState extends State<CreateStartupPageWidget> {
  String uploadedFileUrl;
  SelectedMedia selectedMedia;
  List<SelectedMedia> selectedMediaList = [];
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  Future<String> uploadLogo() async {
    if (this.selectedMedia != null &&
        validateFileFormat(this.selectedMedia.storagePath, context)) {
      showUploadMessage(context, 'Uploading file...', showLoading: true);
    }
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

  Future<List<String>> uploadPhotos() async {
    if (selectedMediaList.isNotEmpty) {
      return await Future.wait<String>(
          selectedMediaList.map((selectedMedia) async {
        return uploadData(
            'users/${currentUserReference.id}/${textController1.text}/images/${Uuid().v4()}',
            selectedMedia.bytes);
      }).toList());
    }
    return [];
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
          'Register a Sprout',
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
            color: FlutterFlowTheme.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedMedia == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: InkWell(
                              onTap: () async {
                                selectedMedia = await selectMedia();
                                setState(() {});
                              },
                              child: Container(
                                height: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                ),
                                child: Image.memory(
                                  selectedMedia.bytes,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                    selectedMedia != null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: FFButtonWidget(
                              onPressed: () async {
                                selectedMedia = await selectMedia();
                                setState(() {});
                              },
                              text: 'Upload Logo',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.tertiaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        'Upload Photos ${selectedMediaList.length}/5',
                        style: TextStyle(color: FlutterFlowTheme.secondaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        'NOTE: Uploaded images cannot be deleted!',
                        style: TextStyle(
                            color:
                                FlutterFlowTheme.secondaryColor.withOpacity(0.7),
                            fontSize: 10),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: FlutterFlowTheme.tertiaryColor, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: selectedMediaList.isEmpty
                              ? GestureDetector(
                                  onTap: () async {
                                    selectedMediaList.add(await selectMedia());
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: FlutterFlowTheme.tertiaryColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Icon(
                                      Icons.add_a_photo,
                                      color: FlutterFlowTheme.secondaryColor,
                                    )),
                                  ),
                                )
                              : GridView.builder(
                                  itemCount: selectedMediaList == null
                                      ? 1
                                      : selectedMediaList.length < 5
                                          ? selectedMediaList.length + 1
                                          : 5,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 100,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5),
                                  itemBuilder: (context, index) {
                                    if (index == 0 &&
                                        selectedMediaList.length < 5) {
                                      return GestureDetector(
                                        onTap: () async {
                                          selectedMediaList
                                              .add(await selectMedia());
                                          setState(() {});
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Icon(
                                            Icons.add_a_photo,
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                          )),
                                        ),
                                      );
                                    }
                                    return Stack(
                                      fit: StackFit.loose,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.primaryColor,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 1, 0, 0),
                                            child: Image.memory(
                                              selectedMediaList[
                                                      selectedMediaList.length < 5
                                                          ? index - 1
                                                          : index]
                                                  .bytes,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  selectedMediaList.removeAt(
                                                      selectedMediaList.length < 5
                                                          ? index - 1
                                                          : index);
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))),
                                      ],
                                    );
                                  }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name of your Startup';
                          }
                          return null;
                        },
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Startup Name*',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          hintText: 'SproutUp',
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
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a motto for your startup';
                          }
                          return null;
                        },
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Motto/ One-liner*',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          hintText: 'Describe your project with one line.',
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
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description for your startup';
                          }
                          return null;
                        },
                        controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description*',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          hintText: 'Describe your Startup/Project....',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
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
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        controller: textController4,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          hintText: 'Baguio City, Benguet',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
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
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter something that you need/want';
                          }
                          return null;
                        },
                        controller: textController5,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Looking For*',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          hintText: 'Flutter Developer',
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
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if(_formKey.currentState.validate()){final name = textController1.text;
                          final dateRegistered = getCurrentTimestamp;
                          final dateUpdated = getCurrentTimestamp;
                          final logo = selectedMedia != null
                              ? await uploadLogo()
                              : 'https://www.gardeningknowhow.com/wp-content/uploads/2019/10/seedling-400x267.jpg';
                          final description = textController3.text;
                          final motto = textController2.text;
                          final lookingFor = textController5.text;
                          final location = textController4.text;
                          final userRegisterer = currentUserReference;
                          final isFeatured = false;
                          final trl = 0;
                          final videoUrl = '';
                          final followerCount = 0;
                          final applicantCount = 0;
                          final investorCount = 0;
              
                          final startupsRecordData = {
                            ...createStartupsRecordData(
                              name: name,
                              dateRegistered: dateRegistered,
                              dateUpdated: dateUpdated,
                              logo: logo,
                              description: description,
                              motto: motto,
                              lookingFor: lookingFor,
                              location: location,
                              userRegisterer: userRegisterer,
                              isFeatured: isFeatured,
                              trl: trl,
                              videoUrl: videoUrl,
                              followerCount: followerCount,
                              applicantCount: applicantCount,
                              investorCount: investorCount,
                            ),
                            'images': await uploadPhotos(),
                            'followers': [],
                            'investors': [],
                            'applicants': [],
                          };
              
                          await StartupsRecord.collection
                              .doc()
                              .set(startupsRecordData);
              
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'SproutPage'),
                            ),
                            (r) => false,
                          );
                        }},
                        text: 'Submit',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.primaryColor,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 120,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
