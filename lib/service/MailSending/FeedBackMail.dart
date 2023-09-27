import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class FeedBackMail {
  static void sendEmail() async {
    var emailAddress = FirebaseAuth.instance.currentUser?.email;
    String customTemplate = """
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Submission Thank You</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            color: #333;
        }

        /* Header styles */
        header {
            background-color: #007BFF;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        /* Container styles */
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
        }

        /* Thank You message styles */
        h1 {
            font-size: 24px;
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
        }
    </style>
</head>
<body>
    <header>
        <h1>Thank You for Your Feedback!</h1>
    </header>

    <div class="container">
        <p>Your feedback has been received and is important to us. We appreciate you taking the time to help us improve our services.</p>
        <p>If you have any more feedback to share or need assistance, please don't hesitate to contact us.</p>
    </div>

    <footer>
        &copy; 2023 Your Tech App. All rights reserved.
    </footer>
</body>
</html>
""";

    final smtpServer = gmail('raganrocktoar@gmail.com', 'qtnwhjtjnduhoyog');

    final message = Message()
      ..from = Address('raganrocktoar@gmail.com', 'Tech App')
      ..recipients.add(emailAddress)
      ..subject = 'Thank You For Sending Feedback to Us.'
      ..html = customTemplate;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
