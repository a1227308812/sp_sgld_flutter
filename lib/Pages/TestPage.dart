import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  Future<PageState> pageState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<PageState> snapshot) {});
  }
}

class PageState {
  final String state = '';
}
