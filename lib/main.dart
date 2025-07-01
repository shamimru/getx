import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/DataFile.dart';
import 'package:getx/TitlePage.dart';
import 'package:getx/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.deepPurpleAccent[100],
          primarySwatch: Colors.deepPurple),
      getPages: allPages,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  MyDataFile data = Get.put(MyDataFile());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("My Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Text("Hello"),
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/title");
              },
              child: Text("Go to Title Pages")),
          Obx(
            () => Text(
              data.num.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    data.num++;
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (data.num > 0) {
                      data.num--;
                    }
                  },
                  child: Icon(Icons.minimize)),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/getData");
              },
              child: Text("Got to get api page")),
        ],
      ),
    );
  }
}
