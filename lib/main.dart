import 'package:aqua_trace/provider_list.dart';
import 'package:aqua_trace/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => listProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // Define the initial route
        routes: {
          '/': (context) => const MyHomePage(), // Define your home route
          '/auth': (context) => AuthPage(), // Define your auth route
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AquaTrace")),
          actions: [
            IconButton(
              icon: const Icon(Icons.forward),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/auth'); // Navigate to the auth route
              },
            )
          ],
        ),
      ),
    );
  }
}
