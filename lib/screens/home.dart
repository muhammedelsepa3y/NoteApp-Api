import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
          child: Consumer<UserProvider>(
            builder: (context, provider, child) {
              return Column(
                  children: [
                    CupertinoSwitch(
                      onChanged: (value) {
                        provider.toggleScreen();
                      },
                      value: provider.isDark,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text("Hi ${provider.userName}"),
                    TextField(
                      onChanged: (value){
                        provider.userName=value;
                      },
                    )



                  ]
              );
            },
          )
      ),
    );
  }
}
