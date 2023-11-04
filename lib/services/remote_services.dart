// ignore_for_file: body_might_complete_normally_nullable

import 'package:http/retry.dart';
import 'package:rest_api/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Posts>?> getPosts() async {
var client = http.Client();

var uri = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-10-04&sortBy=publishedAt&apiKey=36233515a11644a58fc12454bc6a91e0');
var response = await client.get(uri);
if (response.statusCode == 200) 
{
  var json = response.body;
  return postsFromJson(json);
  
}
  }
}