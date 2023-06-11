/* import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectFunctions {
  Future<void> createPost( content) async {
    CollectionReference posts =
        FirebaseFirestore.instance.collection('project');
    await posts.add(content);

    FirebaseFirestore.instance.collection('users').  doc('37mF8FZnsfPIB2fMRcjfLqOj7ki1').collection('Projects').add(content);
  }
}
 */