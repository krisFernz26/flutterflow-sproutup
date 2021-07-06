import 'package:sprout_up/auth/firebase_user_provider.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_post_page/edit_post_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../send_report_page/send_report_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

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
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                          child: Text(
                            '${rowUsersRecord.displayName} ${rowUsersRecord.lastName}',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
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
                      'Posted',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x80FFFFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
                    child: AutoSizeText(
                      timeago.format(widget.post.datePosted.toDate()),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x71FFFFFF),
                      ),
                    ),
                  )
                ],
              ),
              widget.post.images.isEmpty
                  ? Container()
                  : Container(
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 1, 0, 0),
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
                                        dotColor: Colors.black.withOpacity(0.2),
                                        activeDotColor:
                                            Colors.black.withOpacity(0.8),
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
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: AutoSizeText(
                  widget.post.body,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: widget.post.user == currentUserReference
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.center,
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
                      child: widget.post.user == currentUserReference
                          ? IconButton(
                              onPressed: () async {
                                Widget cancelButton = FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                                Widget continueButton = FlatButton(
                                  child: Text("Continue"),
                                  onPressed: () async {
                                    await widget.post.reference.delete();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                );

                                AlertDialog alert = AlertDialog(
                                  title: Text("Delete Post?"),
                                  content: Text(
                                      "Are you sure you want to delete this Post?"),
                                  actions: [
                                    cancelButton,
                                    continueButton,
                                  ],
                                );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: FlutterFlowTheme.tertiaryColor,
                                size: 30,
                              ),
                              iconSize: 30,
                            )
                          : IconButton(
                              onPressed: widget.post.user ==
                                      currentUserReference
                                  ? null
                                  : () async {
                                      final postsRecordData = !widget
                                              .post.likedUsers
                                              .contains(currentUserReference)
                                          ? {
                                              'likes_count':
                                                  FieldValue.increment(1),
                                              'liked_users':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            }
                                          : {
                                              'likes_count':
                                                  FieldValue.increment(-1),
                                              'liked_users':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            };

                                      await widget.post.reference
                                          .update(postsRecordData);
                                      final usersRecordData = !widget
                                              .post.likedUsers
                                              .contains(currentUserReference)
                                          ? {
                                              'likes_count':
                                                  FieldValue.increment(1),
                                            }
                                          : {
                                              'likes_count':
                                                  FieldValue.increment(-1),
                                            };

                                      await currentUserReference
                                          .update(usersRecordData);
                                    },
                              icon: Icon(
                                !widget.post.likedUsers
                                        .contains(currentUserReference)
                                    ? Icons.thumb_up_off_alt
                                    : Icons.thumb_up,
                                color: FlutterFlowTheme.tertiaryColor,
                                size: 30,
                              ),
                              iconSize: 30,
                            ),
                    ),
                    widget.post.user == currentUserReference
                        ? Container()
                        : FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SendReportPageWidget(
                                    id: widget.post.title,
                                  ),
                                ),
                              );
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
              widget.post.user.id != currentUserReference.id
                  ? Container()
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.post.reference.delete();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'ExplorePage'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Delete Post',
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
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
