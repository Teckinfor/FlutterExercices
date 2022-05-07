import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nom = "";
  String prenom = "";
  String secret = "";
  bool genre = false;
  String genreText = "Homme";
  double taille = 180;
  int tailleAsInt = 180;
  DateTime birth = DateTime.now();

  Map hobbiesList = {
    'Petanque': false,
    'Football': false,
    'Ski': false,
    'Code': false,
    'VR': false,
    "Dormir": false,
  };

  List<Row> displayHobbies({required Map hobbiesList}) {
    List<Row> list = [];
    for (String hobbieItem in hobbiesList.keys) {
      list.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobbieItem),
          Checkbox(
              value: hobbiesList[hobbieItem],
              onChanged: (newValue) {
                setState(() {
                  hobbiesList[hobbieItem] = newValue;
                });
              })
        ],
      ));
    }

    return list;
  }

  Container resumePanel(
      {required String prenom,
      required String nom,
      required String secret,
      required DateTime birth,
      required String genre,
      required Map hobbiesList,
      required int taille}) {
    int age = DateTime.now().year - birth.year;
    if (DateTime.now().month < birth.month) {
      if (DateTime.now().day < birth.month) {
        age - 1;
      }
    }

    List<Text> listingHobbies({required Map hobbiesList}) {
      List<Text> list = [];
      int i = hobbiesList.length - 1;
      for (String hobbieItem in hobbiesList.keys) {
        if (hobbiesList[hobbieItem]) {
          list.add(Text(hobbieItem));
          if (i != 0) {
            list.add(const Text(" - "));
          }
        }
        i--;
      }
      return list;
    }

    return Container(
        margin: EdgeInsets.all(5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Container(
            //margin: const EdgeInsets.all(10),
            color: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: Column(
                children: [
                  Text("$prenom $nom"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [FormatedText().subtitle("Age: "), Text("$age")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormatedText().subtitle("Taille: "),
                      Text("$taille")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormatedText().subtitle("Genre: "),
                      Text("$genre")
                    ],
                  ),
                  FormatedText().subtitle("Hobbies:"),
                  Row(
                    children: listingHobbies(hobbiesList: hobbiesList),
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              )),
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        resumePanel(
            prenom: prenom,
            nom: nom,
            secret: secret,
            birth: birth,
            genre: genreText,
            hobbiesList: hobbiesList,
            taille: tailleAsInt),
        Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            const Divider(
              color: Colors.deepOrange,
            ),
            FormatedText().title('Modifier les informations'),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                maxLength: 12,
                decoration: InputDecoration(
                    counterText: "",
                    hintText: "Nom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                onChanged: (newString) {
                  setState(() {
                    nom = newString;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                maxLength: 12,
                decoration: InputDecoration(
                    counterText: "",
                    hintMaxLines: 1,
                    hintText: "Prénom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                onChanged: (newString) {
                  setState(() {
                    prenom = newString;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                maxLength: 64,
                obscureText: true,
                decoration: InputDecoration(
                    hintMaxLines: 1,
                    hintText: "Secret",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                onChanged: (newString) {
                  setState(() {
                    secret = newString;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                      .then((value) =>
                          setState((() => birth = value ?? DateTime.now())));
                },
                child: Text("Date de naissance")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Genre : $genreText"),
                Switch(
                    activeTrackColor: Colors.pink,
                    activeColor: Colors.pink,
                    inactiveThumbColor: Colors.blue,
                    inactiveTrackColor: Colors.blue,
                    value: genre,
                    onChanged: (newValue) {
                      setState(() {
                        genre = newValue;
                        genreText = (genre) ? 'Femme' : 'Homme';
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taille : $tailleAsInt cm"),
                Slider(
                    max: 230,
                    min: 100,
                    value: taille,
                    onChanged: (newValue) {
                      setState(() {
                        taille = newValue;
                        tailleAsInt = newValue.round();
                      });
                    })
              ],
            )
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            const Divider(
              color: Colors.deepOrange,
            ),
            FormatedText().title("Mes hobbies"),
            Column(
              children: displayHobbies(hobbiesList: hobbiesList),
            )
          ]),
        )
      ])),
    );
  }
}

class FormatedText {
  Container title(String text) {
    return Container(
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      )),
    );
  }

  Container subtitle(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
