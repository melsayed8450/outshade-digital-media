
class UserEntity{
  final String id;
  final String name;
  final String atype;

  UserEntity({required this.atype,required this.id, required this.name});

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        name: json['name'],
        id: json['id'],
        atype: json['atype'],
      );

}
