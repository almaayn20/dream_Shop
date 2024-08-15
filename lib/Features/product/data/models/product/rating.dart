class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json['rate'] as num?,
        count: json['count'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
