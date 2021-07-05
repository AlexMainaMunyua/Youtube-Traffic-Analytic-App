import 'package:google_sign_in/google_sign_in.dart';

import 'services.dart';

class AuthService {
  GoogleSignInAccount _currentUser;

  //authenticate the user with permission to use youtube data.
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'https://www.googleapis.com/auth/youtube.readonly',
    'https://www.googleapis.com/auth/yt-analytics.readonly',
    'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
  ]);

  //Sign in with google
  Future<void> googleSignIn() async {
    try {
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
        _currentUser = account;

        if (_currentUser != null) {
          return _currentUser;
        }
      });
      _googleSignIn.signInSilently();
    } catch (err) {
      print(err);
      return null;
    }
  }

  //Sign out and disconnect the app.
  Future<void> signOut() {
    return _googleSignIn.disconnect();
  }
}
