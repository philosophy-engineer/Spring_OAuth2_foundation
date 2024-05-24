import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAuth2.0 Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: storage.read(key: 'jwt_token'),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              return LoginSuccessPage(storage: storage);
            } else {
              return OAuth2LoginPage(storage: storage);
            }
          }
        },
      ),
    );
  }
}

class OAuth2LoginPage extends StatelessWidget {
  final FlutterSecureStorage storage;

  OAuth2LoginPage({required this.storage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OAuth2.0 Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Perform OAuth2.0 login flow for company A
                String jwtToken = await performOAuth2Login('Company A');
                await storage.write(key: 'jwt_token', value: jwtToken);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSuccessPage(storage: storage)),
                );
              },
              child: Text('Login with Company A'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Perform OAuth2.0 login flow for company B
                String jwtToken = await performOAuth2Login('Company B');
                await storage.write(key: 'jwt_token', value: jwtToken);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSuccessPage(storage: storage)),
                );
              },
              child: Text('Login with Company B'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> performOAuth2Login(String companyName) async {
    // Simulate OAuth2.0 login process
    // Replace this with your actual OAuth2.0 login logic
    await Future.delayed(Duration(seconds: 2));
    return 'your_jwt_token_here';
  }
}

class LoginSuccessPage extends StatelessWidget {
  final FlutterSecureStorage storage;

  LoginSuccessPage({required this.storage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are logged in!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Logout - Remove JWT token from secure storage
                await storage.delete(key: 'jwt_token');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OAuth2LoginPage(storage: storage)),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
