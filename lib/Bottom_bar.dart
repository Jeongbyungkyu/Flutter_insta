import 'package:flutter/material.dart';

class  Botoom_bar extends StatefulWidget {
  Botoom_bar({Key? key, this.pageNum}) : super(key: key);

  var pageNum ;

  @override
  State<Botoom_bar> createState() => _Botoom_barState();
}

class _Botoom_barState extends State<Botoom_bar> {
  var indexNum = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: indexNum,
        onTap: (i){
          widget.pageNum(i);
          indexNum = i;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
    ]);
  }
}