import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_practice/models/User.dart';
import 'package:flutter_practice/widgets/ProfileScreenPallette.dart';
import 'package:http/http.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<UserList>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network('https://jsonplaceholder.typicode.com/users').fetchData();
    // print(data);
    // print(data);
    // data!.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Screen",
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.edit,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
                future: data,
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    // return Text(snapshot.data!.users[0].email);
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 80,
                            child: Icon(
                              Icons.photo,
                              color: Colors.black,
                            ),
                          ),
                          ProfileScreenPallette(
                            heading: "Name: ",
                            data: snapshot.data!.users[0].name,
                          ),
                          ProfileScreenPallette(
                            heading: "Email: ",
                            data: snapshot.data!.users[0].email,
                          ),
                          ProfileScreenPallette(
                            heading: "Phone: ",
                            data: snapshot.data!.users[0].phone,
                          ),
                          ProfileScreenPallette(
                            heading: "Website: ",
                            data: snapshot.data!.users[0].website,
                          ),
                          ProfileScreenPallette(
                            heading: "Address: ",
                            data:
                                "${snapshot.data!.users[0].address['street']}, \n${snapshot.data!.users[0].address['city']}, \n${snapshot.data!.users[0].address['zipcode']} ",
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Text("No Data");
                }),
          ),
        ),
      ),
    );
  }
}

class Network {
  final String url;
  Network(this.url);
  Future<UserList> fetchData() async {
    print(url);
    final response = await get(Uri.parse(url));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return UserList.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to get posts");
    }
  }
}
