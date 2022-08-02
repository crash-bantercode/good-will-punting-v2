import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GoodWillPuntingV2FirebaseUser {
  GoodWillPuntingV2FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

GoodWillPuntingV2FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GoodWillPuntingV2FirebaseUser> goodWillPuntingV2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GoodWillPuntingV2FirebaseUser>(
            (user) => currentUser = GoodWillPuntingV2FirebaseUser(user));
