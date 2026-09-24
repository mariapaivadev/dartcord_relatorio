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
  final idade = int.tryParse(ler('Digite a idade do usuário:'));

  usuarios.add(
    moderador
        ? moderador(nick: nick, idade: idade)
        : usuario(nick: nick, idade: idade),
  );
  print('Criado com sucesso!');
}
