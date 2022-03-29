import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_final_bases/app/widgets/snackbars.dart';


class SendGridService {
  Future sendGridEmail(String message, String subject) async {
    final header = {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer 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",
    };
    final body = {
      "personalizations": [
        {
          "to": [
            {"email": "riossanval@gmail.com", "name": "John Doe"}
          ],
          "subject": "Hello, World!"
        }
      ],
      "content": [
        {"type": "text/plain", "value": "Heya!"}
      ],
      "from": {"email": "noreplyemailforliz@gmail.com", "name": "Sam Smith"},
      "reply_to": {"email": "noreplyemailforliz@gmail.com", "name": "Sam Smith"}
    };
    print(body);

    var response = await http.post(
        Uri.parse("https://api.sendgrid.com/v3/mail/send"),
        headers: header,
        body: json.encode(body));

    if (response.statusCode == 202) {
      print(response.body);

      ModuleSnackBars.showSuccessSnackBar(
          'Tu solicitud fue enviada con éxito.');
      // Get.offAllNamed(Routes.HOME);
    } else {
      ModuleSnackBars.showErrorSnackBar('Error en la solicitud');

      throw response.body;
    }
  }

  Future sendEmail({
    required String collection,
    required String message,
    required String subject,
  }) async {
    await sendGridEmail(message, subject);
  }
}

SendGridService sendGridService = SendGridService();

// class SendGridUtil {
//    sendRegistrationNotification(String email) async {
//     Map<String, String> headers = {};
//     headers["Authorization"] =
//         "Bearer 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";
//     headers["Content-Type"] = "application/json";

//     var response = await http.post(
//         Uri.parse("https://api.sendgrid.com/v3/mail/send"),
//         headers: headers,
//         body:
//             "{\n          \"personalizations\": [\n            {\n              \"to\": [\n                {\n                  \"email\": \"riossanval@gmail.com\"\n                },\n                {\n                  \"email\": \"noreplyemailforliz@gmail.com\"\n                }\n              ]\n            }\n          ],\n          \"from\": {\n            \"email\": \"noreplyemailforliz@gmail.com\"\n          },\n          \"subject\": \"New user registration\",\n          \"content\": [\n            {\n              \"type\": \"text\/plain\",\n              \"value\": \"New user register: $email\"\n            }\n          ]\n        }");
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//   }
// }

// SendGridUtil sendGridUtil = SendGridUtil();
