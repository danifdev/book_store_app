import 'package:books/core/models/detail.model.dart';
import 'package:books/core/models/books/books.dart';
import 'package:books/core/service/api_client.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

class AppService {
  static Future<Books> getBooksByUrl({String? path}) async {
    String url = '$baseUrl?q=$path';
    var uri = Uri.parse(url);
    try {
      var res = await ApiClient.instance.get(uri);
      return Books.fromJson(res);
    } catch (_) {
      throw _;
    }
  }

  //Popular Books
  static Future<Books> getPopularBooks() async {
    return await getBooksByUrl(path: 'Fiction&maxResults=40');
  }

  //Amine Books
  static Future<Books> getAnimeBooks() async {
    var res = await getBooksByUrl(path: 'amine+manga&maxResults=39');
    return res;
  }

//Adventure Books
  static Future<Books> getAdventureBooks() async {
    return await getBooksByUrl(path: 'action+adventure&maxResults=39');
  }

  //Novel
  static Future<Books> getNovelBooks() async {
    return await getBooksByUrl(path: 'novel&maxResults=39');
  }

  //Horror Books
  static Future<Books> getHorrorBooks() async {
    return await getBooksByUrl(path: 'horroe&maxResults=39');
  }

  Future<Books> searchBooks({required String searchBook}) async {
    return await getBooksByUrl(path: '$searchBook&maxResults=39');
  }

  Future<DetailModel> showBooksDetails({required String id}) async {
    String url = '$baseUrl/$id';
    var uri = Uri.parse(url);
    try {
      var res = await ApiClient.instance.get(uri);
      return DetailModel.fromJson(res);
    } catch (_) {
      throw _;
    }
  }
}
