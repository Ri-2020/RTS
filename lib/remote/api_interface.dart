abstract class DoubtApiInterface {
  Future<Map<String, dynamic>>? getDoubts();
  Future<Map<String, dynamic>>? createDoubt(String message);
  Future<Map<String, dynamic>>? getAllChatUsers();
  Future<Map<String, dynamic>>? deleteChat(
      String senderReceiverId, List<String> idsForDelete);
  Future<Map<String, dynamic>>? functionality(
      String senderReceiverId, String chatId, Map body);
  Future<Map<String, dynamic>>? getSearchedUsers(String query);
  Future<Map<String, dynamic>>? setIsSend(String chatId);
}

abstract class HomeRepo {
  Future<Map<String, dynamic>> getLoggedInUser();
}
