class ContatoModel {
  String nomeCompleto;
  String email;
  String telefone;
  String youtube;

  ContatoModel({
    this.nomeCompleto,
    this.email,
    this.telefone,
  });

  static ContatoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContatoModel(
      nomeCompleto: map['nome_completo'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }
}
