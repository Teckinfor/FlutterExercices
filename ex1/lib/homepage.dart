// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basics'),
      ),
      body: SizedBox(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    child: Stack(children: [
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
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'A propos de moi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.home),
                          const Text('Charleroi, Belgique')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const Text('Consultant ICT')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.heart_broken),
                          const Text('Célibataire')
                        ],
                      ),
                    ]),
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Amis',
                        //textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ami(
                          name: 'Julien',
                          url:
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          context: context),
                      ami(
                          name: 'Tarik',
                          url:
                              'https://images.pexels.com/photos/941693/pexels-photo-941693.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          context: context),
                      ami(
                          name: 'Michel',
                          url:
                              'https://images.pexels.com/photos/8764905/pexels-photo-8764905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          context: context),
                    ],
                  ),
                ],
              ),
              const Divider(),
              post(
                  name: 'Marie Lafree',
                  url:
                      'https://images.pexels.com/photos/1683975/pexels-photo-1683975.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  time: 'Il y a 1 heure',
                  urlPost:
                      'https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  text: 'a changé sa photo de couverture.'),
              post(
                  name: 'Marie Lafree',
                  url:
                      'https://images.pexels.com/photos/1683975/pexels-photo-1683975.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  time: 'Il y a 6 heures',
                  urlPost:
                      "https://images.pexels.com/photos/2695679/pexels-photo-2695679.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  text:
                      "Trop fun les posts ! J'en ai des choses à dire : Cet exercice m'a été très profitable. J'ai pu vraiment prendre en main les widget basiques de Flutter et ça fait plaisir",
                  numberCom: 6,
                  numberLikes: 26)
            ],
          ),
        ),
      ),
    );
  }
}

Container ami(
    {required String name,
    required String url,
    required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.30,
    height: 150,
    child: Column(children: [
      Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      ),
      Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ]),
  );
}

Container post(
    {required String name,
    required String url,
    required String time,
    int numberLikes = 0,
    int numberCom = 0,
    required String text,
    required String urlPost}) {
  return Container(
      color: Color.fromARGB(50, 158, 158, 158),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(url),
                  radius: 25,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          ]),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: Text(
              text,
              textAlign: TextAlign.left,
            ),
          ),
          Image(image: NetworkImage(urlPost)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.favorite),
                    Text(numberLikes.toString() + ' likes',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.comment),
                    Text(numberCom.toString() + ' comments',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          )
        ],
      ));
}
