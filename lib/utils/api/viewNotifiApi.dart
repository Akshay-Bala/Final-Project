import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potholedetect/utils/api/loginapi.dart';



Future<List<Map<String, dynamic>>?> getNotificationsApi(String lid) async {
  // var client = http.Client();
  final url = Uri.parse("$baseurl/user_notifications_view?lid=$lid");
  try {
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> body = jsonDecode(response.body);
      // Check if the decoded data is a list
      if (body is List) {
        // Convert List<dynamic> to List<Map<String, dynamic>>
        final List<Map<String, dynamic>> mappedList = body.cast<Map<String, dynamic>>();
        return mappedList;
      } else {
        print("Response body is not a list");
        return null;
      }
    } else {
      print("API call error");
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  } 
}
