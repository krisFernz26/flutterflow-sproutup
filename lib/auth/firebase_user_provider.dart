import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SproutUpFirebaseUser {
  SproutUpFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

SproutUpFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SproutUpFirebaseUser> sproutUpFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SproutUpFirebaseUser>(
            (user) => currentUser = SproutUpFirebaseUser(user));
