import 'dart:convert';

import 'package:api_integration/Models/User_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        print(i['name']);
        userList.add(UserModel.fromJson(i as Map<String, dynamic>));

      }
      return userList;
    }else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example 3"),
      ),
      body: Column(
        children: [
            Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReusableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                    ReusableRow(title: 'Username', value: snapshot.data![index].username.toString()),
                                    ReusableRow(title: 'E-mail', value: snapshot.data![index].email.toString()),
                                    ReusableRow(title: 'Addresh',
                                        value: snapshot.data![index].address!.city .toString()+
                                            snapshot.data![index].address!.geo!.lat.toString()

                                    ),
                                  ],
                                ),
                              ),
                            );

                          });
                    }
                  },
              ),
            )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {

  String title , value ;
   ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
