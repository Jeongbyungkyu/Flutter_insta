import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);



  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  var result2 = [];

  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    setState(() {
      result2 = jsonDecode(result.body);
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if(result2.isNotEmpty){
      return  Container(
          child: ListView.builder(
            itemCount: result2.length,
            itemBuilder: (context, i){
              return ListBody(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(result2[i]['image']),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('좋아요' + result2[i]['likes'].toString(), style: TextStyle(fontWeight: FontWeight.bold, )),
                              Text(result2[i]['date']),
                              Text(result2[i]['user']),
                              Text(result2[i]['content'])
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          )
      );
    } else {
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: SizedBox(
                child: CircularProgressIndicator(color: Colors.pinkAccent, strokeWidth: 8),
              ),
            )
          ],
        );
    }
  }
}
