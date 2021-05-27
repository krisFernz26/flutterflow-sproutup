import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_post_page/edit_post_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostInfoPageWidget extends StatefulWidget {
  PostInfoPageWidget({
    Key key,
    this.post,
  }) : super(key: key);

  final PostsRecord post;

  @override
  _PostInfoPageWidgetState createState() => _PostInfoPageWidgetState();
}

class _PostInfoPageWidgetState extends State<PostInfoPageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: AutoSizeText(
          widget.post.title,
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPostPageWidget(
                    post: widget.post,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: FlutterFlowTheme.tertiaryColor,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(widget.post.user),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final rowUsersRecord = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                          child: Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              rowUsersRecord.photoUrl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                          child: Text(
                            rowUsersRecord.displayName,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Text(
                          rowUsersRecord.lastName,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                            fontSize: 13,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.tertiaryColor,
                            size: 20,
                          ),
                          iconSize: 20,
                        )
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Posted on',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x80FFFFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
                    child: AutoSizeText(
                      widget.post.datePosted.toString(),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x71FFFFFF),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Builder(
                  builder: (context) {
                    final images = widget.post.images?.toList() ?? [];
                    return Container(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: pageViewController,
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, imagesIndex) {
                              final imagesItem = images[imagesIndex];
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Image.network(
                                    imagesItem,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment(0, 1),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: SmoothPageIndicator(
                                controller: pageViewController,
                                count: images.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  pageViewController.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 16,
                                  dotHeight: 16,
                                  dotColor: Color(0x76FFFFFF),
                                  activeDotColor:
                                      FlutterFlowTheme.tertiaryColor,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      widget.post.likesCount.toString(),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.secondaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: IconButton(
                        onPressed: () async {
                          final postsRecordData = {
                            'likes_count': FieldValue.increment(1),
                            'liked_users':
                                FieldValue.arrayUnion([currentUserReference]),
                          };

                          await widget.post.reference.update(postsRecordData);
                          final usersRecordData = {
                            'likes_count': FieldValue.increment(1),
                          };

                          await currentUserReference.update(usersRecordData);
                        },
                        icon: Icon(
                          Icons.thumb_up_off_alt,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                        iconSize: 30,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Report',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 120,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: AutoSizeText(
                  widget.post.body,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
