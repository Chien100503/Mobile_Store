import 'package:cannabis/Db/Config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Components/FloatingButton.dart';

class VapeProducts extends StatefulWidget {
  final token;
  const VapeProducts({@required this.token, Key? key}) : super(key: key);

  @override
  State<VapeProducts> createState() => _VapeProductsState();
}

class _VapeProductsState extends State<VapeProducts> {
  List? items;

  late TextEditingController _title;
  late TextEditingController _description;
  late TextEditingController _image;
  late TextEditingController _price;
  late String? userId;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _description = TextEditingController();
    _image = TextEditingController();
    _price = TextEditingController();
  }

  void addProducts() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    setState(() {
      userId = local.getString('userId');
    });
    if (userId != null &&
        _title.text.isNotEmpty &&
        _description.text.isNotEmpty &&
        _image.text.isNotEmpty &&
        _price.text.isNotEmpty) {
      var regBody = {
        "UserId": local.getString('userId'),
        "title": _title.text,
        "description": _description.text,
        "image": _image.text,
        "price": _price.text,
      };
      var response = await http.post(
        Uri.parse(addProduct),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] != null && jsonResponse['status']) {
        _title.clear();
        _description.clear();
        _image.clear();
        _price.clear();
        Navigator.pop(context);
      } else {
        print('something went wrong $jsonResponse');
      }
    }
  } // List<Post> postData = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   apiRequest.fetchPosts().then((dataFromServer) {
  //     print("data from server $dataFromServer");
  //     setState(() {
  //       postData = dataFromServer;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: items == null
                          ? null
                          : ListView.builder(
                              itemCount: items!.length,
                              itemBuilder: (context, int index) {
                                return Slidable(
                                  key: const ValueKey(0),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dismissible:
                                        DismissiblePane(onDismissed: () {}),
                                    children: [
                                      SlidableAction(
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                        onPressed: (BuildContext context) {
                                          print('${items![index]['_id']}');
                                          // deleteItem('${items![index]['_id']}');
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    borderOnForeground: false,
                                    child: ListTile(
                                      leading: const Icon(Icons.task),
                                      title: Text('${items![index]['title']}'),
                                      subtitle: Text(
                                          '${items![index]['description']}'),
                                      trailing: const Icon(Icons.arrow_back),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 50,
        height: 50,
        child: const Center(
          child: ButtonAdd(),
        ),
      ),
    );
  }
}
