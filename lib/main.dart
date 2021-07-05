import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Analytic Application',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: MyHomePage(title: 'Youtube Channel Analytics'),
      // home: Outh2ClientExample(),
      home: Demo(),
    );
  }
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

class Demo extends StatefulWidget {
  const Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode}"
            'response. Check logs for details.';
      });
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);

    final String namedContact = _pickFirstNamedContact(data);

    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connection'];

    final Map<String, dynamic> contact = connections?.firstWhere(
        (dynamic contact) => contact['names'] != null,
        orElse: () => null);
    if (contact != null) {
      final Map<String, dynamic> name = contact['name'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount user = _currentUser;

    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            title: Text(user.displayName ?? ""),
            subtitle: Text(user.displayName),
          ),
          const Text('Signed in successfully'),
          Text(_contactText),
          ElevatedButton(onPressed: _handleSignOut, child: Text('SIGN OUT')),
          ElevatedButton(
              onPressed: () => _handleGetContact(user), child: Text('REFRESH')),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('You are not curently signed In'),
          ElevatedButton(onPressed: _handleSignIn, child: Text('SIGN IN'))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: _buildBody(),
      ),
    );
  }
}
