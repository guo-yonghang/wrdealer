import 'package:flutter/material.dart';
import 'package:wrdealer/service/rpx.dart';

class LoadMore extends StatefulWidget {
  const LoadMore({super.key, this.completed = false, this.text = '没有更多内容了'});

  final bool completed;
  final String text;

  @override
  State<LoadMore> createState() => LoadMoreState();
}

class LoadMoreState extends State<LoadMore> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.completed
          ? Text(
              widget.text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Rpx.sp(26),
              ),
            )
          : SizedBox(
              width: Rpx.w(50),
              height: Rpx.w(50),
              child: const CircularProgressIndicator(),
            ),
    );
  }
}


/* 
 Text(
          '没有更多数据了',
          style: TextStyle(
            color: Colors.grey,
            fontSize: ScreenAdapter.fontSize(30),
          ),
        ),

 */