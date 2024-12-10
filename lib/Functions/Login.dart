import 'dart:convert';
import 'dart:typed_data';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:charset/charset.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isUserConnected() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userID = (prefs.getString("UserID") ?? "");
  if (userID != "") {
    return true;
  } else {
    return false;
  }
}

Future<bool> LoginUser(String user, String pass) async {
  final senhaMd5 = md5.convert(utf8.encode((pass))).toString();

  final response = await get(Uri.parse("http://localhost:42069/login"));
  String publickey = json.decode(response.body)["key"];

  int time = DateTime.now().millisecondsSinceEpoch;

  final result = await post(
    Uri.parse('http://localhost:42069/setLogin'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'timestamp': time.toString()
    },
    body: jsonEncode(<String, String>{'email': user, 'password': senhaMd5}),
  );

  if (result.statusCode == 200) {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("UserID", json.decode(result.body)["key"]);
    return true;
  } else {
    return false;
  }
}
