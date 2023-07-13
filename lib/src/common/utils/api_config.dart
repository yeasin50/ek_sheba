class APIInfo {
  static const String baseUrl = "https://gwtraining.plandiv.gov.bd/";

  static get ekShebaLogin => "${baseUrl}api/sso";
  static get systemLogin => "${baseUrl}oauth/token";
}
