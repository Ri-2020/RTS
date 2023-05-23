abstract class ProfileRepo {
  Future<bool> updateProfile(Map<String, dynamic> data);
  Future<Map<String, dynamic>> addSkillAndSocialMedia(
      Map<String, dynamic> data);
  Future<bool> removeSkillAndSocialMedia(Map<String, dynamic> data);
}
