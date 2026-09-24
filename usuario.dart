class usuario {
  string nick;
  int idade;
  bool ativo = true;

  usuario({required this.nick, required this.idade})
}

class moderador extends usuario {
  moderador({required super.nick, required super.idade});
}