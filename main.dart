import 'dart:io';

import 'usuario.dart';
import 'canal.dart';

final usuarios = <Usuario>[];
final canais = <Canal>[];

String ler(String pergunta) {
  print(pergunta);
  return stdin.readLineSync() ?? '';
}

void criarUsuario({bool moderador = false}) {
  final nick = ler('Digite o nick do usuário:');
  final idade = int.tryParse(ler('Digite a idade do usuário:')) ?? -1;

  usuarios.add(
    moderador
        ? Moderador(nick: nick, idade: idade)
        : Usuario(nick: nick, idade: idade),
  );
  print('Criado com sucesso!');
}

void criarCanal() {
  canais.add(Canal(ler('Digite o nome do canal:')));
  print('Criado com sucesso!');
}

void enviarMensagem() {
  final nick = ler('Digite o nick do autor:');
  final nomeCanal = ler('Digite o nome do canal:');
  final u = usuarios.where((u) => u.nick == nick).firstOrNull;
  final c = canais.where((c) => c.nome == nomeCanal).firstOrNull;

  if (u == null || c == null) {
    print('Usuário não encontrado!');
    return;
  }
  c.adicionarMensagem(Mensagem(u, ler('Mensagem:')));
}

void exibirCanal() {
  final nome = ler('Digite o nome do canal:');
  final c = canais.where((c) => c.nome == nome).firstOrNull;

  if (c == null) {
    print('Canal não encontrado!');
    return;
  }
  c.exibirMensagens();
}

void relatorio() {
  final nome = ler('Digite o nome do canal para exibir no relatório:');
  final canal = canais.where((c) => c.nome == nome).firstOrNull;

  print('\nDARTCORD');
  print('Servidor: Programação Mobile');

  print('\nUsuários online:');
  for (final u in usuarios.where((u) => u.ativo)) {
    print(u.nick);
  }

  print('\nCanais:');
  for (final c in canais) {
    print('#${c.nome}');
  }

  print('\nExibindo mensagens do canal:');
  if (canal == null) {
    print('Canal não encontrado!');
  } else {
    canal.exibirMensagens();
  }
}

void menu() {
  while (true) {
    print('\nVocê entrou no DARTCORD');
    print('1 - Criar usuário\n2 - Criar moderador\n 3 - Criar canal');
    print('4 - Enviar mensagem\n 5 - Exibir canal\n6 - Relatório\n0 - Sair');

    switch (int.tryParse(stdin.readLineSync() ?? '') ?? -1) {
      case 1:
        criarUsuario();
        break;
      case 2:
        criarUsuario(moderador: true);
        break;
      case 3:
        criarCanal();
        break;
      case 4:
        enviarMensagem();
        break;
      case 5:
        exibirCanal();
        break;
      case 6:
        relatorio();
        break;
      case 0:
        return;
      default:
        print('Opção inválida!');
    }
  }
}

void main() {
  menu();
}
