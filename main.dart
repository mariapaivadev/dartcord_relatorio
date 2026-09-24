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

void exibirCanal() {
  final nome = ler('Digite o nome do canal:');
  final c = canais.where((c) => c.nome == ).firstOrNull;

  if (c == null) {
    print('Canal não encontrado!');
    return;
  }
  c.exibirMensagens();
}


void relatorio() {
    print('DARTCORD');
    print('Servidor: Programação Mobile');
    print('Usuários online:');
    for (final u in usuarios.where((u) => u.ativo)) {
        print(u.nick);
    }

    print('Canais:');
    for (final c in canais) {
        print('#${c.nome}');
    }
    print('Exibindo mensagens do canal:');
    exibirCanal();
}

void menu(){
    while (true){
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