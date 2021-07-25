import 'package:armazenamento/providers/databse_provider.dart';

class Contact {
  late int? id;
  late String name;
  late String email;
  late String phone;

  Contact();

  // Construtor que converte os dados de mapa (JSON) para objeto do contato
  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
  }

  // Método que transforma o objeto do contato em Mapa (JSON) para armazenar no banco de dados
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();
    map[nameColumn] = name;
    map[emailColumn] = email;
    map[phoneColumn] = phone;

    // O id pode ser nulo caso o registro esteja sendo criado já que é o banco de dados que
    // atribui o ID ao registro no ato de salvar
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}
