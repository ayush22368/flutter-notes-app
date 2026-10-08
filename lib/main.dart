import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/modeprovider.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:notesappadvancedversion/screens/homescreen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>notesprovider()),ChangeNotifierProvider(create: (context)=>modeprovider())],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themprovider=context.watch<modeprovider>();
    print(themprovider.isdark);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.white),
          trackColor: WidgetStatePropertyAll(Colors.grey),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.white),
          trackColor: WidgetStatePropertyAll(Colors.grey),
        ),
      ),
      themeMode: themprovider.themeMode,
      debugShowCheckedModeBanner: false,
      home:homescreen(),
    );
  }
}

