import 'dart:convert';
import 'package:http/http.dart' as http;

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJjOWIzZmU0MS1mNzVlLTQ2YTgtYWFkNS1jOGRhNzNjOTU5MDEiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY3MzE2NzMzMCwiZXhwIjoxODMwOTU1MzMwfQ.lnd4qR4fpfejmHA4m8GltyreDWY1bXQe_wavhFstlms";

Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

  return json.decode(httpResponse.body)['roomId'];
}