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

class EditStartupPageWidget extends StatefulWidget {
  EditStartupPageWidget({Key key}) : super(key: key);

  @override
  _EditStartupPageWidgetState createState() => _EditStartupPageWidgetState();
}

class _EditStartupPageWidgetState extends State<EditStartupPageWidget> {
  String uploadedFileUrl;
  SelectedMedia selectedMedia;
  List<SelectedMedia> selectedMediaList = [];
  List<String> images = [];
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

  void initializeTextControllers(StartupsRecord editStartupPageStartupsRecord) {
    textController1.text = editStartupPageStartupsRecord.name;
    textController2.text = editStartupPageStartupsRecord.motto;
    textController3.text = editStartupPageStartupsRecord.description;
    textController4.text = editStartupPageStartupsRecord.location;
    textController5.text = editStartupPageStartupsRecord.lookingFor;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StartupsRecord>>(
      stream: queryStartupsRecord(
        queryBuilder: (startupsRecord) => startupsRecord
            .where('user_registerer', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<StartupsRecord> editStartupPageStartupsRecordList = snapshot.data;
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final editStartupPageStartupsRecord =
            editStartupPageStartupsRecordList.first;

        initializeTextControllers(editStartupPageStartupsRecord);
        images = editStartupPageStartupsRecord.images.toList();

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
            automaticallyImplyLeading: true,
            title: AutoSizeText(
              'Edit your Sprout',
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: InkWell(
                            onTap: () async {
                              selectedMedia = await selectMedia();
                              setState(() {});
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: selectedMedia == null
                                  ? Image.network(
                                      editStartupPageStartupsRecord.logo,
                                      fit: BoxFit.contain,
                                    )
                                  : Image.memory(
                                      selectedMedia.bytes,
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            'Upload Photos ${editStartupPageStartupsRecord.images.length + selectedMediaList.length}/5',
                            style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            'NOTE: Uploaded images cannot be deleted!',
                            style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor
                                    .withOpacity(0.7),
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
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: images.isEmpty && selectedMediaList.isEmpty
                                  ? GestureDetector(
                                      onTap: () async {
                                        selectedMediaList
                                            .add(await selectMedia());
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        width: 100,
                                        height: 100,
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
                                    )
                                  : GridView.builder(
                                      itemCount: images.isEmpty &&
                                              selectedMediaList.isEmpty
                                          ? 1
                                          : images.length < 5 ||
                                                  selectedMediaList.length < 5
                                              ? images.length +
                                                  selectedMediaList.length +
                                                  1
                                              : 5,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 100,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5),
                                      itemBuilder: (context, index) {
                                        if (index == 0 &&
                                            (selectedMediaList.length < 5 &&
                                                images.length < 5)) {
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Icon(
                                                Icons.add_a_photo,
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                              )),
                                            ),
                                          );
                                        }
                                        return Stack(
                                          fit: StackFit.loose,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 1, 0, 0),
                                                child: index <= images.length
                                                    ? Image.network(
                                                        images[images.length < 5
                                                            ? index - 1
                                                            : index],
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.memory(
                                                        selectedMediaList[selectedMediaList
                                                                        .length <
                                                                    5
                                                                ? index -
                                                                    1 -
                                                                    images
                                                                        .length
                                                                : index -
                                                                    images
                                                                        .length]
                                                            .bytes,
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: index <= images.length
                                                    ? Container()
                                                    : IconButton(
                                                        onPressed: () {
                                                          selectedMediaList.removeAt(
                                                              selectedMediaList
                                                                          .length <
                                                                      5
                                                                  ? index -
                                                                      1 -
                                                                      images
                                                                          .length
                                                                  : index -
                                                                      images
                                                                          .length);
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
                                return 'Please enter the name of your startup';
                              }
                              return null;
                            },
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Startup Name',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              hintText: editStartupPageStartupsRecord.name,
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor
                                    .withOpacity(0.6),
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
                                return 'Please enter the motto of your startup';
                              }
                              return null;
                            },
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Motto/ One-liner',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              hintText: editStartupPageStartupsRecord.motto,
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor
                                    .withOpacity(0.6),
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
                              labelText: 'Description',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              hintText:
                                  editStartupPageStartupsRecord.description,
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor
                                    .withOpacity(0.6),
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
                              hintText: editStartupPageStartupsRecord.location,
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor
                                    .withOpacity(0.6),
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
                                return 'Please enter what you need/want';
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
                              hintText:
                                  editStartupPageStartupsRecord.lookingFor,
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor
                                    .withOpacity(0.6),
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
                              if (_formKey.currentState.validate()) {
                                final name = textController1.text;
                                final dateUpdated = getCurrentTimestamp;
                                final logo = selectedMedia == null
                                    ? editStartupPageStartupsRecord.logo
                                    : await uploadLogo();
                                final description = textController3.text;
                                final motto = textController2.text;
                                final lookingFor = textController5.text;
                                final location = textController4.text;

                                final startupsRecordData = {
                                  ...createStartupsRecordData(
                                    name: name,
                                    dateUpdated: dateUpdated,
                                    logo: logo,
                                    description: description,
                                    motto: motto,
                                    lookingFor: lookingFor,
                                    location: location,
                                  ),
                                  'images': FieldValue.arrayUnion(
                                      await uploadPhotos())
                                };

                                await editStartupPageStartupsRecord.reference
                                    .update(startupsRecordData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'SproutPage'),
                                  ),
                                  (r) => false,
                                );
                              }
                            },
                            text: 'Edit',
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
      },
    );
  }
}
