import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  bool loading = false;
  bool loggedOut = false;

  void logOut() async {
    setState(() {
      loading = true;
    });

    loggedOut = await Magic.instance.user.logout();

    setState(() {
      loading = false;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Log Out Check"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("Loading: $loading"),
            const SizedBox(
              height: 5,
            ),
            Text("loggedOut: $loggedOut"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: logOut,
              child: const Text("Log Out"),
            ),
            if (loading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
