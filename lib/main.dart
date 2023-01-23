import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './style.dart' as style;
import './Bottom_bar.dart' as bottom_bar;
import './home.dart' as home;
import './upload.dart' as upload;



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
  var result2;
  var userImage;

  pageNum(data){
    setState(() {
      dada = data;
    });
  }

  dataSe(data){
    setState(() {
      result2 = data;
    });
  }

  dataAdd(data){
    setState(() {
      result2.insert(0,data);
      print(result2);
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
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                if(image != null){
                  setState(() {
                    userImage = File(image.path);
                  });
                }

                Navigator.push(context, MaterialPageRoute(builder: (c) => upload.Upload(userImage : userImage, dataAdd : dataAdd, result2:result2)
                ));
              },
              icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body:[home.home(dataSe:dataSe, result2:result2), Text('2번페이지')][dada],
      bottomNavigationBar:bottom_bar.Botoom_bar(pageNum : pageNum)
    );
  }
}