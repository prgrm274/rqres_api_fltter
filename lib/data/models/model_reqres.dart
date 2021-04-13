/*
https://reqres.in/

Request: https://reqres.in/api/users?page=2
Response: 200
*/

class Model {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;

  Model(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: List<Data>.from(
          json['data'].map(
                  (elemen) => Data.fromJson(elemen)
          )
      )
    );
  }
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar']
    );
  }
}