import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Contactmail {
  static void sendEmail({required emailAddress, required userName}) async {
    String customTemplate = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Contacting Us</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            color: #333;
        }

        /* Container styles */
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Header styles */
        header {
            background-color: #007BFF;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-radius: 10px 10px 0 0;
        }

        h1 {
            font-family: 'Inter', Arial, sans-serif;
            font-size: 28px;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        /* Button styles */
        .button {
            display: inline-block;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Footer styles */
        footer {
            background-color: #007BFF;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Thank You for Contacting Us</h1>
    </header>

    <div class="container">
        <p>Your message has been received, and we appreciate you reaching out to us. Our team will get back to you as soon as possible.</p>
        <p>If you have any more questions or need further assistance, please don't hesitate to contact us again.</p>
    </div>

    <footer>
        &copy; 2023 Tech App. All rights reserved.
    </footer>
</body>
</html>
""";

    final smtpServer = gmail('raganrocktoar@gmail.com', 'qtnwhjtjnduhoyog');

    final message = Message()
      ..from = Address('raganrocktoar@gmail.com', 'Tech App')
      ..recipients.add(emailAddress)
      ..subject = 'Thank You For Contacting Us.'
      ..html = customTemplate;
    // ..text = 'This is a test email sent from TechApp.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
