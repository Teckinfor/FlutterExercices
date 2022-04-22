// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basics'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                  Center(
                    child: Stack(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            child: const CircleAvatar(
                              radius: 84,
                              backgroundColor: Colors.white,
                            ),
                            margin: const EdgeInsets.only(top: 80),
                          ),
                          Container(
                            child: const CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/1683975/pexels-photo-1683975.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 83, left: 4),
                          )
                        ]),
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              Center(
                  child: Column(
                children: [
                  const Text(
                    "Marine Lafree",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                  const Text(
                    "J'ai une bio, mais je sais pas quoi y mettre :/... C'est si triste comme situation ! Aidez-moi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: const Center(
                        child: Text("Modifier le profil",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15))),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.deepPurple),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.edit_note,
                      color: Colors.white,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.deepPurple),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
