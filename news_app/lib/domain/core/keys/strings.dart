class PersonalKeys {
  static const key = "cd2203707947413b8288ef6e7431c3fd";
  static const baseUrl = "https://newsapi.org/v2";
  static const topHeadlines = "/top-headlines?";
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
  static final topHeadline = (country) =>
      "${PersonalKeys.baseUrl}${PersonalKeys.topHeadlines}country=${country}&apiKey=${PersonalKeys.key}";
}
