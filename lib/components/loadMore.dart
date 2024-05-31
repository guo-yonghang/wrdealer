import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  final String status; //init loading final empty
  final String initText;
  final String loadText;
  final String finalText;
  final String emptyText;
  final String emptyType;
  final double emptySize;
  final TextStyle initTextStyle;
  final TextStyle loadTextStyle;
  final TextStyle finalTextStyle;
  final TextStyle emptyTextStyle;

  const LoadMore({
    super.key,
    required this.status,
    this.initText = '',
    this.loadText = "正在加载中...",
    this.finalText = '没有更多数据了',
    this.emptyText = '没有消息',
    this.emptyType = 'list',
    this.emptySize = 180,
    this.initTextStyle = const TextStyle(color: Colors.black54),
    this.loadTextStyle = const TextStyle(color: Colors.black54),
    this.finalTextStyle = const TextStyle(color: Colors.black54),
    this.emptyTextStyle = const TextStyle(color: Colors.black45),
  });

  Widget LoadingWidget() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
          const SizedBox(width: 15),
          Text(loadText)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (status == 'init') {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            initText != ''
                ? Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      initText,
                      style: initTextStyle,
                    ),
                  )
                : Container()
          ],
        ),
      );
    }
    if (status == 'loading') {
      return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            loadText != ''
                ? Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      loadText,
                      style: loadTextStyle,
                    ),
                  )
                : Container()
          ],
        ),
      );
    }
    if (status == 'final') {
      return Container(
        height: 44,
        alignment: Alignment.center,
        child: Text(finalText, style: finalTextStyle),
      );
    }
    if (status == 'empty') {
      return Center(
        child: Column(
          children: [
            Image.network(
              'http://jpf.wanrungj.com/upload/empty/${emptyType}.png',
              width: emptySize,
              height: emptySize,
            ),
            emptyText != ''
                ? Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(emptyText, style: emptyTextStyle),
                  )
                : Container()
          ],
        ),
      );
    }
    return Container();
  }
}
