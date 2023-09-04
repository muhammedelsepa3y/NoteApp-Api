import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session7/constants/size_config.dart';

import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(SizeConfig.screenWidth.toString()),
      ),
      body: Center(
          child: Container(
            width: SizeConfig.horizontalBlock*150,
            height: SizeConfig.verticalBlock*150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50)

            ),
          )
      ),
    );
  }
}
