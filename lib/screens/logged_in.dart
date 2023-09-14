import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  bool loading = true;
  bool isLoggedIn = false;
  String error = "";

  String? email;
  String? address;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    try {
      print("Logged In Check");
      isLoggedIn = await Magic.instance.user.isLoggedIn();
      print("isLogged check $isLoggedIn");

      final user = await Magic.instance.user.getMetadata();
      email = user.email;
      address = user.publicAddress;
    } catch (e) {
      error = e.toString();
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Logged In Check"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20,),
            Text("Loading: $loading"),
            const SizedBox(height: 5,),
            Text("isLoggedIn: $isLoggedIn"),
            const SizedBox(height: 20,),
            Text("email: $email"),
            const SizedBox(height: 5,),
            Text("address: $address"),
            const SizedBox(
              height: 5,
            ),
            Text("error: $error"),
            const SizedBox(
              height: 20,
            ),
            if (loading) const Center(child: CircularProgressIndicator()),
            
          ],
        ),
      ),
    );
  }
}
