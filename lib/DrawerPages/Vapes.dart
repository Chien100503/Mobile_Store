import 'package:flutter/material.dart';

class VapesPage extends StatefulWidget {
  const VapesPage({super.key});

  @override
  State<VapesPage> createState() => _VapesPageState();
}

class _VapesPageState extends State<VapesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Vapes'),),
    );
  }
}
