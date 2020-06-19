import 'dart:io';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { //動的に変動しないwidget　class 自作Widgetのクラス名 extends StatelessWidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //マテリアルデザインを使用するアプリケーション
    title: 'Memo with Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, //MaterialColor
      ),
      home: TextWidget(title: 'Memo with Flutter'),
    );
  }
}

class TextWidget extends StatefulWidget { //stateで拡張
  TextWidget({Key key, this.title}) : super(key: key); //this.メンタ変数で変数を初期化
  final String title;

  // アロー関数を用いて、Stateを呼ぶ
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

// Widgetから呼ばれるStateクラス
class _TextWidgetState extends State<TextWidget>{ //class _StatefulWidgetのクラス名State extends State<StatefulWidgetのクラス名> {
  @override
  Widget build(BuildContext context){

    return Scaffold(  //ページはScaffoldで組む。
        appBar: AppBar( //AppBar はアプリケーションの上部に配置して、アプリケーションのよく使う機能へのショートカットや各種機能へのナビゲーションに使用する
          title: Text(widget.title),
        ),

        body: ListView(
          children: <Widget>[
            TextField( //テキスト入力のWidget
              decoration: new InputDecoration( //ラベル、ヒント、アイコン、境界線などは、decoration プロパティに、InputDecoration をセットすることで指定
                labelText: 'memo',
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: OutlineInputBorder(), //InputDecoratorの角丸四角形のアウトライン境界線を作成
                labelStyle: new TextStyle(color: Colors.green),
                hintText: 'Write something',
              ),
              maxLines: null,
            ),
          ],
        )
    );
  }
}