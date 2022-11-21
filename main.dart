import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: text1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: text2,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              addDetails();
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => SecondPage())));
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }

  addDetails() async {
    var title = text1.text;
    var description = text2.text;
    var url = Uri.https('akashsir.in', '/myapi/crud/todo-add-api.php');
    var response = await http
        .post(url, body: {'todo_title': title, 'todo_details': description});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future? myFuture;
  bool loading = false;
  var myData = [];
  Future<List> fetchData() async {
    setState(() {
      loading = true;
    });
    try {
      var url = Uri.https('akashsir.in', '/myapi/crud/todo-list-api.php');
      var response = await http.get(url);
      setState(() {
        loading = false;
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      myData = json.decode(response.body);
      return myData;
    } catch (error) {
      setState(() {
        loading = false;
      });
      throw error;
    }
  }

  @override
  void initState() {
    myFuture = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: myFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        return Scaffold(
          body: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data[index]['todo_title'].toString()),
                  subtitle:
                      Text(snapshot.data[index]['todo_details'].toString()),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
