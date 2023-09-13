import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool loading = false;
  String didToken = "";


  final controller = TextEditingController.fromValue(
    const TextEditingValue(
      text: "hamza@suberra.com",
    ),
  );


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Auth"),
      leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text("Email"),
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                final email = controller.text;
                print("Authenticating $email");
                final didToken = await Magic.instance.auth.loginWithEmailOTP(email: email);
                print("DID Token: $didToken");
                setState(() {
                  loading = false;
                  this.didToken = didToken;
                });
              },
              child: const Text("Login"),
            ),
            if (loading) const CircularProgressIndicator(),
            const SizedBox(height: 20,),
            Text("DID Token: $didToken"),
          ],
        ),
      ),
    );
  }
}
