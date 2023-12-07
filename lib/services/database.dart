import 'package:appwrite/appwrite.dart';
import 'package:event_management_app/services/auth.dart';

String databaseId = "6571857f6f2764751200";

final Databases databases = Databases(client);
// save the user data to appwrite database

Future<void> saveUserData(String name, String email, String userId) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "657185a068cff6c51dbe",
          documentId: ID.unique(),
          data: {"name": name, "email": email, "userId": userId})
      .then((value) => print("Document Created..!"))
      .catchError((e) => print(e));
}
