import 'package:appwrite/appwrite.dart';
import 'package:event_management_app/services/database.dart';
import 'package:event_management_app/services/shared_preferences.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('656ec9f0db4b39d87ad0')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

// Register user
Account account = Account(client);

Future<String> createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    saveUserData(name, email, user.$id);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login user

Future loginUser(String email, String password) async {
  try {
    final user = await account.createEmailSession(
      email: email,
      password: password,
    );
    getUserData();
    SaveSharedPreferences.saveUserId(user.userId);
    return true;
  } on AppwriteException catch (e) {
    return false;
  }
}

// Logout User
Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
}

// check the user active session or not
Future checkSessions() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}

// get user data from the database
Future getUserData() async {
  final id = SaveSharedPreferences.getUserId();

  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "657185a068cff6c51dbe",
        queries: [Query.equal("userId", id)]);

    SaveSharedPreferences.saveUserName(data.documents[0].data['name']);
    SaveSharedPreferences.saveUserEmail(data.documents[0].data['email']);
    print(data);
  } catch (e) {
    print(e);
  }
}
