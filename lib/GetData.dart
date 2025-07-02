import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'TodoModel.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {

  TodoModel ? todoModel;
  List<TodoModel> getAllData=[];
  var url="https://6863ed8d88359a373e96e575.mockapi.io/api/p1/users";

  Future fetchData() async{
    var response= await http.get(Uri.parse(url));

    var data=jsonDecode(response.body);
    for ( var i in data){
      print(i.toString());
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

  Future <void> postData(name,email) async{

    var response= await http.post(
      Uri.parse(url),
      headers: {'Content-Type':'application/json'},
      body: json.encode(
        {"name":name, "email":email},
      ),
    );

    if(response.statusCode == 201){
      print("Created");
    }else{
      print("not created");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }



  final TextEditingController textControl = TextEditingController();
  final TextEditingController text_2_Control = TextEditingController();

  @override
  void dispose() {
    textControl.dispose();
    text_2_Control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get Api"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: "Enter your Task",
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textControl,
                            decoration:  InputDecoration(labelText: "new task", border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: text_2_Control,
                            decoration:  InputDecoration(labelText: "email",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)), ),
                          ),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Cancel"),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                onPressed: () {
                                  print(textControl.text);

                                  postData(textControl.text,text_2_Control.text);

                                  fetchData();
                                },
                                child: Text("Save"),
                              ))
                            ],
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Add New",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${getAllData[index].name}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${getAllData[index].email}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${getAllData[index].id}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ));
          },
          itemCount: getAllData.length,
        ),
      ),
    );
  }
}
