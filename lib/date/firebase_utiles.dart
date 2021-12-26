import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo2/date/todo.dart';

CollectionReference<Todo> getTodoCollectionWithConverter() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionName)
      .withConverter<Todo>(
        fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}

Future<void> addTodoFireStore(
    String title, String description, DateTime dateTime) {
  CollectionReference<Todo> collectionReference =
      getTodoCollectionWithConverter();
  DocumentReference<Todo> decRef = collectionReference.doc();
  Todo item = Todo(
    id: decRef.id,
    title: title,
    description: description,
    dateTime: dateTime,
  );

  return decRef.set(item);
}
