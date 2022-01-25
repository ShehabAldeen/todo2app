import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/date/firebase_utiles.dart';
import 'package:todo2/date/todo.dart';

import '../../date/todo.dart';
import '../app_config_provider.dart';

class EditingScreen extends StatefulWidget {
  static const routeName = 'editingScreen';

  const EditingScreen({Key? key}) : super(key: key);

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  var title = '';
  var description = '';
  late Todo item;
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context)!.settings.arguments as Todo;
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * .04),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Editing Task',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: item.title,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter todo title';
                              }
                              return null;
                            },
                            onChanged: (text) {
                              item.title = text;
                            },
                          ),
                          TextFormField(
                            initialValue: item.description,
                            decoration: InputDecoration(
                              labelText: 'description',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: 20,
                                  ),
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
                              item.description = text;
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Select Time',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      showDateDialge();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ))),
                    onPressed: () {
                      editTask();
                    },
                    child: const Text('Save Changes'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDateDialge() async {
    var newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (newSelectedDate != null) {
      item.dateTime = newSelectedDate;
      setState(() {});
    }
  }

  void editTask() {
    editTaskDetails(item).then((value) {
      Navigator.pop(context);
    });
  }
}
