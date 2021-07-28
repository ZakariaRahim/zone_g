import 'package:flutter/material.dart';
import 'adminScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: FirstRoute()));
}

class FirstRoute extends StatefulWidget {
  FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AdminScreen();
  }
}
// body: Center(
//         child: (Container(
//           child: ElevatedButton(
//               child: Text('Click'),
//               onPressed: () async {
//                 var url = Uri.parse('http://10.0.2.2/api_ex/index.php');
//                 var response = await http.get(url);
//                 print(jsonDecode(response.body));
//               }),
//         )),
//       ),
//     );
