import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/data/api/api_service.dart';
import 'package:suitmedia/pages/first_screen.dart';
import 'package:suitmedia/provider/select_user_provider.dart';
import 'package:suitmedia/provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(apiService: ApiService())),
        ChangeNotifierProvider(create: (_) => SelectUserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const FirstScreen(),
      ),
    );
  }
}




