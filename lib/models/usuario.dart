class Usuario {
  final int id;
  final String name;
  final String email;
  final String password;

  Usuario(
    this.id,
    this.name,
    this.email,
    this.password,
  );

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $name, email: $email, senha: $password}';
  }
}
