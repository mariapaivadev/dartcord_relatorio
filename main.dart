import 'dart:io';

import 'usuario.dart';
import 'canal.dart';

final usuarios = <usuario>[];
final canais = <canal>[];

string ler(String pergunta) {
  print(pergunta);
  return stdin.readLineSync() ?? '';
}

void criarUsuario({bool moderador = false}) {
  final nick = ler('Digite o nick do usuário:');
  final idade = int.tryParse(ler('Digite a idade do usuário:')) ?? -1;

  usuarios.add(
    moderador
        ? moderador(nick: nick, idade: idade)
        : usuario(nick: nick, idade: idade),
  );
  print('Criado com sucesso!');
}

void criarCanal() {
  canais.add(canal(ler('Digite o nome do canal:')));
  print('Criado com sucesso!');
}

void enviarMensagem() {
  final nick = ler('Digite o nick do autor:');
  final nomeCanal = ler('Digite o nome do canal:');
  final u = usuarios.where((u) => u.nick == nick).firstOrNull;
  final c = canais.where((c) => c.nome == nomeCanal).firstorNull;

  if (u == null || c == null) {
    print('Usuário não encontrado!');
    return;
  }
  c.adicionarMensagem(mensagem(u, ler('Mensagem:')));
}
