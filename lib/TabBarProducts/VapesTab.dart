import 'dart:convert';

import 'package:cannabis/Components/FloatingButton.dart';
import 'package:cannabis/Db/Config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cannabis/Page/Home.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class VapesProduct extends StatefulWidget {
  final token;
  const VapesProduct({@required this.token, Key? key}) : super(key: key);

  @override
  State<VapesProduct> createState() => _VapesProductState();
}

class _VapesProductState extends State<VapesProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        ],
      ),
      floatingActionButton: ButtonAdd(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,// Đặt Floating Action Button ở đây
    );
  }
}
