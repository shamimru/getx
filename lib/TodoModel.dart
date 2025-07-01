class TodoModel {
  TodoModel({
     this.name,
     this.email,
     this.id,
  });

  final String? name;
  final String? email;
  final String? id;

  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel(
      name: json["name"],
      email: json["email"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "id": id,
  };

}
