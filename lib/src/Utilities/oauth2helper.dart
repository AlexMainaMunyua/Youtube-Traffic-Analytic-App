import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:http/http.dart' as http;

class Oauth2Client {
  Oauth2Client();

  Future<void> fetchFiles() async {
    GoogleOAuth2Client client = GoogleOAuth2Client(
        redirectUri: 'my.test.app:/oauth2redirect',
        customUriScheme: 'my.test.app');

    OAuth2Helper oAuth2Helper = OAuth2Helper(client,
        grantType: OAuth2Helper.AUTHORIZATION_CODE,
        clientId:
            '617723282592-hmrkv914m2j26tk2vo4e7dt5ccs3ol5t.apps.googleusercontent.com',
        clientSecret: '',
        scopes: [
          'https://www.googleapis.com/auth/youtube.readonly',
          'https://www.googleapis.com/auth/yt-analytics.readonly',
          'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
          'https://www.googleapis.com/auth/youtube.readonly'
        ]);
  }
}

