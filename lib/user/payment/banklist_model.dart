class BankListModel {
  
  BankListModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }
  BankListModel({
    required this.id,
    required this.code,
    required this.name,
  });
  late final int id;
  late final String code;
  late final String name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}