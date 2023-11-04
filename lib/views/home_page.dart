// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/models/post.dart';
import 'package:rest_api/services/remote_services.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts>? posts;
  var isLoaded = false;

@override

void iniState() {
  super.initState();

  getData();

}

getData() async {
  posts = await RemoteService().getPosts();
  if(Posts != null)
  {
    setState(() {
      isLoaded= true;
    });
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top News Today'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index){
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      child:
                       SizedBox(width: 16,
                         child: Expanded(
                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              Text(
                                posts![index].body?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ],
                                             ),
                         ),
                       ),
                    ),
                  ],
                ),
              ),
            );
          }
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
      ),
    );
  }
}