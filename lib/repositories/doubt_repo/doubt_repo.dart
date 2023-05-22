import 'package:rts/models/chat_model.dart';

abstract class DoubtRepo {
  Future<List<Doubt>>? getDoubts();
  Future<Map<String, dynamic>>? createDoubt(String message);
  // Future<List<ChatUsers>> getAllChatUsers();
  Future<Map<String, dynamic>> deleteChat(
      String senderReceiverId, List<String> idsForDelete);
  Future<Map<String, dynamic>> functionality(
      String senderReceiverId, String chatId, Map body);
  // Future<List<UserData>> getSearchedUsers(String query);
  Future<bool> setIsSend(String chatId);
}
