import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
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
                          "make a video",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ));
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
