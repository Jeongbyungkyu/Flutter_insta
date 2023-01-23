import 'package:flutter/material.dart';
import './style.dart' as style;
import './Bottom_bar.dart' as bottom_bar;
import './home.dart' as home;



void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: style.theme,
          home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  var dada = 0;
  var result2 =[];

  pageNum(data){
    setState(() {
      dada = data;
    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body:[home.home(), Text('2번페이지')][dada],
      bottomNavigationBar:bottom_bar.Botoom_bar(pageNum : pageNum)
    );
  }
}