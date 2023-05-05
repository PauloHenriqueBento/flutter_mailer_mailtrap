import 'package:flutter/material.dart';
import 'package:flutter_mailer_mailhog/email.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String _text = '';
    var email = Email();

    void _sendEmail() async {
      bool result = await email.sendMessage(
          'Mensagem teste', 'phbento@outlook.com.br', 'Assunto do meu e-mail');
      setState(() {
        _text = result ? 'Enviado.' : 'Não enviado.';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Configurando um SMTP Server: $_text'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendEmail,
        tooltip: 'Send email',
        child: const Icon(Icons.email),
      ),
    );
  }
}
