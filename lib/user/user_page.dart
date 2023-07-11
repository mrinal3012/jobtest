import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobtest/model/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  String url="https://reqres.in/api/users?page=2";
  UserValue ? userValue;

  fatchHomeData()async{
    var respons = await http.get(Uri.parse(url));
    var data=jsonDecode(respons.body);
    userValue=UserValue.fromJson(data);
    setState(() {

    });
  }

  @override
  void initState() {
    fatchHomeData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("User List",style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700),)),backgroundColor: Colors.white,),
      body: Container(child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: userValue!.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 20,childAspectRatio: .9),
            itemBuilder: (context, index) =>
                Container( color: Colors.blueGrey.withOpacity(.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 8, child: Image(image: NetworkImage("${userValue!.data![index].avatar}"),fit: BoxFit.cover,),),
                        SizedBox(height: 10,),
                        Expanded(flex: 1, child: Text("${userValue!.data![index].firstName}",style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w600),),),
                        Expanded(flex: 1, child: Text("${userValue!.data![index].email}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    )

                  ]),
                ),
                ),

        ),
      )),
    );
  }
}
