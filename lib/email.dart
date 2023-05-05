import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email {
  final smtpServer = SmtpServer(
    'sandbox.smtp.mailtrap.io',
    port: 2525,
    username: '16611c6457575a',
    password: '43305a3a314f7c',
  );

  Future<bool> sendMessage(
      String mensagem, String destinatario, String assunto) async {
    // Mensagem
    final message = Message()
      ..from = Address('from@example.com', 'MailHog')
      ..recipients.add(destinatario)
      ..subject = assunto
      ..text = mensagem;

    try {
      final SendReport = await send(message, smtpServer);
      print('Message sent: ' + SendReport.toString());
      return true;
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
  }
}
