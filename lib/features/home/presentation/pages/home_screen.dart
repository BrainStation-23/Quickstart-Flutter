import 'package:flutter/material.dart';
import 'package:qs_flutter/core/base/widgets/app_drop_down.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppDropdown(items: ["Shahin","Bashar","Afsana"], selectedValue:"Shahin" , onChanged: (value){

            }),
            //Title

          ],
        ),
      ),
    );
  }
}
