import 'usuario.dart';

class mensagem {
  final usuario autor;
  final String texto;

  mensagem({this.autor, this.texto});
}

class canal {
  final String nome;
  final List<mensagem> _mensagens = [];

  canal(this.nome);

  void adicionarMensagem(mensagem msg) => _mensagens.add(msg);

  void exibirMensagens() {
    print('#$nome');
    for (final msg in _mensagens) {
      print('${msg.autor.nick}: ${msg.texto}');
    }
  }
}
