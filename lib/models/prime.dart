
class Prime {
  String? status;
  String? message;
  String? prime;

  Prime({this.status, this.message, this.prime});

  factory Prime.fromJson(Map<String, dynamic> json) {
    return Prime(
      status: json['status'],
      message: json['message'],
      prime: json['prime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['prime'] = prime;
    return data;
  }

  @override
  String toString() {
    return 'PrimeModel{status: $status, message: $message, prime: $prime}';
  }
}