import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo2/date/firebase_utiles.dart';

class AddToddBottomSheet extends StatefulWidget {
  @override
  State<AddToddBottomSheet> createState() => _AddToddBottomSheetState();
}

class _AddToddBottomSheetState extends State<AddToddBottomSheet> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  var title = '';
  var description = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Todo',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter todo title';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      title = text;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    minLines: 3,
                    maxLines: 3,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter description';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      description = text;
                    },
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Text('Date'),
          InkWell(
            onTap: () {
              showDateDialge();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addTodo();
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  void addTodo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    addTodoFireStore(title, description, selectedDate).then((value) {
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      print('Error adding');
    }).timeout(Duration(seconds: 10), onTimeout: () {});
  }

  void showDateDialge() async {
    var newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      setState(() {});
    }
  }
}
