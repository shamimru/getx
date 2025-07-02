import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx/TodoModel.dart';
import 'package:http/http.dart' as http;


class Apidata extends StatefulWidget {
  const Apidata({super.key});

  @override
  State<Apidata> createState() => _ApidataState();
}

class _ApidataState extends State<Apidata> {
  TodoModel ? todoModel;
  List<TodoModel> getAllData=[];
 var url="https://6863ed8d88359a373e96e575.mockapi.io/api/p1/users";

   Future fetchData() async{
    var response= await http.put(Uri.parse(url));

    var data=jsonDecode(response.body);
    for ( var i in data){
      todoModel=TodoModel(
        name: i["name"],
        email: i["email"],
        id: i["id"]

      );

      getAllData.add(todoModel!);
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
