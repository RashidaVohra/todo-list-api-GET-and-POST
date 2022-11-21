{\rtf1\ansi\ansicpg1252\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue255;\red255\green255\blue255;\red144\green1\blue18;
\red15\green112\blue1;\red19\green118\blue70;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c100000;\cssrgb\c100000\c100000\c100000;\cssrgb\c63922\c8235\c8235;
\cssrgb\c0\c50196\c0;\cssrgb\c3529\c52549\c34510;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
import\cf0  \cf4 'dart:convert'\cf0 ;\cb1 \
\
\cf2 \cb3 import\cf0  \cf4 'package:flutter/material.dart'\cf0 ;\cb1 \
\cf2 \cb3 import\cf0  \cf4 'package:http/http.dart'\cf0  \cf2 as\cf0  http;\cb1 \
\
\cf2 \cb3 void\cf0  main() \{\cb1 \
\cb3   runApp(\cf2 const\cf0  MyApp());\cb1 \
\cb3 \}\cb1 \
\
\cf2 \cb3 class\cf0  MyApp \cf2 extends\cf0  StatelessWidget \{\cb1 \
\cb3   \cf2 const\cf0  MyApp(\{Key? key\}) : \cf2 super\cf0 (key: key);\cb1 \
\
\cb3   \cf5 // This widget is the root of your application.\cf0 \cb1 \
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   Widget build(BuildContext context) \{\cb1 \
\cb3     \cf2 return\cf0  MaterialApp(\cb1 \
\cb3       theme: ThemeData(\cb1 \
\cb3           primarySwatch: Colors.indigo,\cb1 \
\cb3           visualDensity: VisualDensity.adaptivePlatformDensity),\cb1 \
\cb3       title: \cf4 'Flutter Demo'\cf0 ,\cb1 \
\cb3       home: \cf2 const\cf0  MyHomePage(),\cb1 \
\cb3     );\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\cf2 \cb3 class\cf0  MyHomePage \cf2 extends\cf0  StatefulWidget \{\cb1 \
\cb3   \cf2 const\cf0  MyHomePage(\{Key? key\}) : \cf2 super\cf0 (key: key);\cb1 \
\
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   State<MyHomePage> createState() => _MyHomePageState();\cb1 \
\cb3 \}\cb1 \
\
\cf2 \cb3 class\cf0  _MyHomePageState \cf2 extends\cf0  State<MyHomePage> \{\cb1 \
\cb3   TextEditingController text1 = TextEditingController();\cb1 \
\cb3   TextEditingController text2 = TextEditingController();\cb1 \
\
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   Widget build(BuildContext context) \{\cb1 \
\cb3     \cf2 return\cf0  Scaffold(\cb1 \
\cb3       body: Column(\cb1 \
\cb3         mainAxisAlignment: MainAxisAlignment.\cf6 center\cf0 ,\cb1 \
\cb3         children: [\cb1 \
\cb3           TextField(\cb1 \
\cb3             controller: text1,\cb1 \
\cb3           ),\cb1 \
\cb3           \cf2 const\cf0  SizedBox(\cb1 \
\cb3             height: \cf6 10\cf0 ,\cb1 \
\cb3           ),\cb1 \
\cb3           TextField(\cb1 \
\cb3             controller: text2,\cb1 \
\cb3           ),\cb1 \
\cb3           SizedBox(\cb1 \
\cb3             height: \cf6 15\cf0 ,\cb1 \
\cb3           ),\cb1 \
\cb3           ElevatedButton(\cb1 \
\cb3             onPressed: () \{\cb1 \
\cb3               addDetails();\cb1 \
\cb3               Navigator.push(context,\cb1 \
\cb3                   MaterialPageRoute(builder: ((context) => SecondPage())));\cb1 \
\cb3             \},\cb1 \
\cb3             child: Text(\cf4 'Add Task'\cf0 ),\cb1 \
\cb3           ),\cb1 \
\cb3         ],\cb1 \
\cb3       ),\cb1 \
\cb3     );\cb1 \
\cb3   \}\cb1 \
\
\cb3   addDetails() \cf2 async\cf0  \{\cb1 \
\cb3     \cf2 var\cf0  title = text1.text;\cb1 \
\cb3     \cf2 var\cf0  description = text2.text;\cb1 \
\cb3     \cf2 var\cf0  url = Uri.https(\cf4 'akashsir.in'\cf0 , \cf4 '/myapi/crud/todo-add-api.php'\cf0 );\cb1 \
\cb3     \cf2 var\cf0  response = \cf2 await\cf0  http\cb1 \
\cb3         .post(url, body: \{\cf4 'todo_title'\cf0 : title, \cf4 'todo_details'\cf0 : description\});\cb1 \
\cb3     print(\cf4 'Response status: \cf0 $\{\cf4 response\cf0 .\cf4 statusCode\cf0 \}\cf4 '\cf0 );\cb1 \
\cb3     print(\cf4 'Response body: \cf0 $\{\cf4 response\cf0 .\cf4 body\cf0 \}\cf4 '\cf0 );\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\cf2 \cb3 class\cf0  SecondPage \cf2 extends\cf0  StatefulWidget \{\cb1 \
\cb3   \cf2 const\cf0  SecondPage(\{Key? key\}) : \cf2 super\cf0 (key: key);\cb1 \
\
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   State<SecondPage> createState() => _SecondPageState();\cb1 \
\cb3 \}\cb1 \
\
\cf2 \cb3 class\cf0  _SecondPageState \cf2 extends\cf0  State<SecondPage> \{\cb1 \
\cb3   Future? myFuture;\cb1 \
\cb3   bool loading = \cf2 false\cf0 ;\cb1 \
\cb3   \cf2 var\cf0  myData = [];\cb1 \
\cb3   Future<List> fetchData() \cf2 async\cf0  \{\cb1 \
\cb3     setState(() \{\cb1 \
\cb3       loading = \cf2 true\cf0 ;\cb1 \
\cb3     \});\cb1 \
\cb3     \cf2 try\cf0  \{\cb1 \
\cb3       \cf2 var\cf0  url = Uri.https(\cf4 'akashsir.in'\cf0 , \cf4 '/myapi/crud/todo-list-api.php'\cf0 );\cb1 \
\cb3       \cf2 var\cf0  response = \cf2 await\cf0  http.\cf2 get\cf0 (url);\cb1 \
\cb3       setState(() \{\cb1 \
\cb3         loading = \cf2 false\cf0 ;\cb1 \
\cb3       \});\cb1 \
\cb3       print(\cf4 'Response status: \cf0 $\{\cf4 response\cf0 .\cf4 statusCode\cf0 \}\cf4 '\cf0 );\cb1 \
\cb3       print(\cf4 'Response body: \cf0 $\{\cf4 response\cf0 .\cf4 body\cf0 \}\cf4 '\cf0 );\cb1 \
\cb3       myData = json.decode(response.body);\cb1 \
\cb3       \cf2 return\cf0  myData;\cb1 \
\cb3     \} \cf2 catch\cf0  (error) \{\cb1 \
\cb3       setState(() \{\cb1 \
\cb3         loading = \cf2 false\cf0 ;\cb1 \
\cb3       \});\cb1 \
\cb3       \cf2 throw\cf0  error;\cb1 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   \cf2 void\cf0  initState() \{\cb1 \
\cb3     myFuture = fetchData();\cb1 \
\cb3     \cf2 super\cf0 .initState();\cb1 \
\cb3   \}\cb1 \
\
\cb3   \cf2 @override\cf0 \cb1 \
\cb3   Widget build(BuildContext context) \{\cb1 \
\cb3     \cf2 return\cf0  FutureBuilder<dynamic>(\cb1 \
\cb3       future: myFuture,\cb1 \
\cb3       builder: (context, snapshot) \{\cb1 \
\cb3         \cf2 if\cf0  (!snapshot.hasData) \{\cb1 \
\cb3           \cf2 return\cf0  \cf2 const\cf0  Center(\cb1 \
\cb3             child: CircularProgressIndicator(),\cb1 \
\cb3           );\cb1 \
\cb3         \}\cb1 \
\cb3         \cf2 if\cf0  (snapshot.hasError) \{\cb1 \
\cb3           \cf2 return\cf0  \cf2 const\cf0  Center(\cb1 \
\cb3             child: Text(\cf4 'Something went wrong'\cf0 ),\cb1 \
\cb3           );\cb1 \
\cb3         \}\cb1 \
\cb3         \cf2 return\cf0  Scaffold(\cb1 \
\cb3           body: ListView.builder(\cb1 \
\cb3             itemCount: snapshot.data.length,\cb1 \
\cb3             itemBuilder: (context, index) \{\cb1 \
\cb3               \cf2 return\cf0  Card(\cb1 \
\cb3                 child: ListTile(\cb1 \
\cb3                   title: Text(snapshot.data[index][\cf4 'todo_title'\cf0 ].toString()),\cb1 \
\cb3                   subtitle:\cb1 \
\cb3                       Text(snapshot.data[index][\cf4 'todo_details'\cf0 ].toString()),\cb1 \
\cb3                 ),\cb1 \
\cb3               );\cb1 \
\cb3             \},\cb1 \
\cb3           ),\cb1 \
\cb3         );\cb1 \
\cb3       \},\cb1 \
\cb3     );\cb1 \
\cb3   \}\cb1 \
\cb3 \}}