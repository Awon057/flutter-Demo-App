import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/3');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(json.decode(response.body));
    print(Album.fromJson(json.decode(response.body)).id);
    print(Album.fromJson(json.decode(response.body)).title);
    print(Album.fromJson(json.decode(response.body)).userId);
    // _startList();
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
