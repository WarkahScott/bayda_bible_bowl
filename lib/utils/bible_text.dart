import 'package:http/http.dart' as http;

Future<String> getReference(String verse) async {

  final response = await http.get("https://getbible.net/json?passage=$verse");
  
  if(response.statusCode == 200)
    return _extractReference(response.body);
  else
    return "nope";
}

String _extractReference(String data){
  int left = data.indexOf("verse\":") + 8;
  int right = data.indexOf("\\r");
  return "${data.substring(left, right)}\"";
}
