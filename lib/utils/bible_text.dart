import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> getReference(String verse) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      final response = await http.get("https://getbible.net/json?passage=$verse");

      if(response.statusCode == 200)
        return _extractReference(response.body);
    }
  } on SocketException catch (_) {
    return "No Connection";
  }

  return "Network error";
}

String _extractReference(String data){
  int left = data.indexOf("verse\":") + 8;
  int right = data.indexOf("\\r");
  return "${data.substring(left, right)}\"";
}
