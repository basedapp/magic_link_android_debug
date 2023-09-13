import 'package:flutter/material.dart';
import 'package:its_magic/app.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  const keyStr = 'MAGIC_KEY';
  await dotenv.load(fileName: '.env');
  final magicKey = dotenv.env[keyStr]!;
  print("KEY: $magicKey");
  Magic.instance = Magic.custom(
    magicKey,
    // rpcUrl: 'https://polygon-rpc.com',
    // chainId: 137,
    rpcUrl: 'https://rpc-mumbai.polygon.technology',
    chainId: 80001,
  );

  runApp(const MyApp());
}
