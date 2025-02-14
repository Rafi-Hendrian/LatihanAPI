import 'dart:convert';
import 'package:http/http.dart' as http;
import 'posts_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    final http.Response res = await http.get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw Exception("Unable to retrieve posts.");
    }
  }
}
