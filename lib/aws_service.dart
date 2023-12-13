import 'package:http/http.dart' as http;
import 'dart:convert';

class AWSService {
  Future<List<String>> fetchPDFList(String subject) async {
    // Example: Directly fetching from a public S3 bucket (adjust as necessary)
    var url = Uri.parse('https://s3.amazonaws.com/your-bucket-name/$subject');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the response body to extract file names or URLs
      var data = json.decode(response.body);
      // ... process and return the list of file names or URLs
    } else {
      throw Exception('Failed to fetch data from AWS S3');
    }
  }
}
