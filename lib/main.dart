import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/size_config.dart';
import 'providers/notes_provider.dart';
import 'providers/user_provider.dart';
import 'screens/home.dart';
import 'screens/notes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => NotesProvider()
          ),


        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: HomeScreen(),

        )
    );
  }
}
