import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Upload extends StatefulWidget {
  Upload({Key? key, this.userImage, this.dataAdd, this.result2}) : super(key: key);
  var userImage;
  var dataAdd;
  var result2;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('업로드 화면'),
          actions: [
            IconButton(onPressed: (){
              widget.dataAdd(
                {
                  'id': widget.result2.last['id'] + 1,
                  'image':widget.userImage,
                  'likes': 0,
                  'date': DateFormat('MMM dd').format(DateTime.now()),
                  'content' : content.text,
                  'liked': false,
                  'user': 'Jeon'
                },
              );
              Navigator.pop(context);
            }, icon: Icon(Icons.upload))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             child: Row(
               children: [
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Image.file(widget.userImage, cacheHeight: 80, cacheWidth: 80,),
                 ),
                 Container(
                   child: Flexible(
                     child: TextField(
                       controller: content,
                       maxLines: 3,
                       minLines: 1,
                     ),
                   ),
                 )
               ],
             ),
            ),
            Text('이미지업로드화면'),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)
            ),
          ],
        )
    );

  }
}