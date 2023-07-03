class APIInfo {
  static const String BASE_URL = "https://gwtraining.plandiv.gov.bd/";

  static get ekShebaLogin => BASE_URL + "api/sso";
  static get systemLogin => BASE_URL + "oauth/token";
}
