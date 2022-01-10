class CardModel {
  CardModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.cvv,
    required this.expired,
    required this.title,
  });
  late final String cardNumber;
  late final String cardHolder;
  late final String cvv;
  late final String expired;
  late final String title;

  CardModel.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    cardHolder = json['cardHolder'];
    cvv = json['cvv'];
    expired = json['expired'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardNumber'] = cardNumber;
    _data['cardHolder'] = cardHolder;
    _data['cvv'] = cvv;
    _data['expired'] = expired;
    _data['title'] = title;
    return _data;
  }
}
