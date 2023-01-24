import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  home({Key? key, this.dataSe, this.result2}) : super(key: key);

  var dataSe;
  var result2;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  getData() async {
    var result = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'));
    widget.dataSe(jsonDecode(result.body));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.result2.isNotEmpty) {
      return Container(
          child: ListView.builder(
            itemCount: widget.result2.length,
            itemBuilder: (context, i) {
              return ListBody(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //이미지표시기능
                        widget.result2[i]['image'].runtimeType == String
                            ? Image.network(widget.result2[i]['image'],width:double.infinity,height: 500,fit: BoxFit.cover)
                            : Image.file(widget.result2[i]['image'], width:double.infinity, height: 500, fit: BoxFit.cover),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('좋아요' + widget.result2[i]['likes'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,)),
                              Text(widget.result2[i]['date']),
                              Text(widget.result2[i]['user']),
                              Text(widget.result2[i]['content'])
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
                child: CircularProgressIndicator(
                    color: Colors.pinkAccent, strokeWidth: 8),
              ),
            )
          ],
        );
    }
  }
}
