class PersonalKeys {
  static const key = "2aa50ca3b01140268e49b80c3e1bb6ce";
  static const baseUrl = "https://newsapi.org/v2";
  static const topHeadlines = "/top-headlines?";
  static const everything = "/everything?";
  static const eg =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cd2203707947413b8288ef6e7431c3fd";
  static const th =
      "https://newsapi.org/v2/top-headlines&apiKey=cd2203707947413b8288ef6e7431c3fd";
}

class ApiCountry {
  static const ae = "ae";
  static const us = "us";
  static const india = "in";
  static const ua = "ua";
  static const ru = "ru";
  static const ca = "ca";
}

class ApiCategory {
  static const business = "business";
  static const entertainment = "entertainment";
  static const general = "general";
  static const health = "health";
  static const science = "science";
  static const sports = "sports";
  static const technology = "technology";
}

class ApiEndPoints {
  final date = DateTime.now();

  static final topHeadline = (country) =>
      "${PersonalKeys.baseUrl}${PersonalKeys.topHeadlines}country=${country}&apiKey=${PersonalKeys.key}";
  static final categories = ({required String cat, required String country}) =>
      "${PersonalKeys.baseUrl}${PersonalKeys.topHeadlines}country=${country}&category=${cat}&apiKey=${PersonalKeys.key}";
  static final everything = () =>
      "${PersonalKeys.baseUrl}${PersonalKeys.everything}q='a'&from=${DateTime.now().toIso8601String().split("T").first}&apiKey=${PersonalKeys.key}";
}
