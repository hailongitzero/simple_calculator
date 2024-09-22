class ReceiptResponse {
  List<Receipt>? results;
  int? offset;
  int? number;
  int? totalResults;

  ReceiptResponse({this.results, this.offset, this.number, this.totalResults});

  ReceiptResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Receipt>[];
      json['results'].forEach((v) {
        results!.add(Receipt.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['offset'] = offset;
    data['number'] = number;
    data['totalResults'] = totalResults;
    return data;
  }
}

class Receipt {
  int? id;
  String? title;
  String? image;
  String? imageType;
  Nutrition? nutrition;

  Receipt({this.id, this.title, this.image, this.imageType, this.nutrition});

  Receipt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    nutrition = json['nutrition'] != null
        ? Nutrition.fromJson(json['nutrition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['imageType'] = imageType;
    if (nutrition != null) {
      data['nutrition'] = nutrition!.toJson();
    }
    return data;
  }
}

class Nutrition {
  List<Nutrients>? nutrients;

  Nutrition({this.nutrients});

  Nutrition.fromJson(Map<String, dynamic> json) {
    if (json['nutrients'] != null) {
      nutrients = <Nutrients>[];
      json['nutrients'].forEach((v) {
        nutrients!.add(Nutrients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (nutrients != null) {
      data['nutrients'] = nutrients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nutrients {
  String? name;
  double? amount;
  String? unit;

  Nutrients({this.name, this.amount, this.unit});

  Nutrients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['amount'] = amount;
    data['unit'] = unit;
    return data;
  }
}
