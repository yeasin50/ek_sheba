class APIInfo {
  static const String baseUrl = "https://gwtraining.plandiv.gov.bd/";

  static get ekShebaLogin => "${baseUrl}api/sso";
  static get systemLogin => "${baseUrl}oauth/token";

  static get getDashboard => "${baseUrl}external/mobile-apps/get-dashboard-projects";

  static String getProjectDetails({required String uuid}){
    // https://gwtraining.plandiv.gov.bd/external/mobile-apps/get-project-details-by-uuid/67c26fb6-d4a0-48e0-a2d6-a6b490371df1
    return  "${baseUrl}external/mobile-apps/get-project-details-by-uuid/$uuid";
  }

  static String getPDF({required String uuid}){
    // https://gwtraining.plandiv.gov.bd/external/mobile-apps/attachment/get-pdf-file-by-fs-uuid/ea9e0583-cd22-494d-8c34-8ee42aa63ae9
    return  "${baseUrl}external/mobile-apps/attachment/get-pdf-file-by-fs-uuid/$uuid";
  }
}
