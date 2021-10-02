import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List _albums = [];

  Future<void> getAlbum() async {
    final String response =
        await rootBundle.loadString('assets/json/album-list.json');
    final data = json.decode(response);
    setState(() {
      _albums = data['albumModelList'];
    });
  }

  @override
  void initState() {
    getAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Album List"),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                Colors.blue.shade800,
                Colors.blue.shade600,
              ],
            )),
          ),
        ),
        body: ListView.builder(
            itemCount: _albums.length,
            itemBuilder: (context, index) {
              var album = _albums[index];
              return cardAlbum(
                  album['imagePath'], album['name'], album['years']);
            }));
  }

  Widget cardAlbum(String img, String name, String year) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 105, vertical: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 210,
            width: 210,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(14).copyWith(bottom: 4),
            child: Text(
              name,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14).copyWith(top: 0),
            child: Text(
              year,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
