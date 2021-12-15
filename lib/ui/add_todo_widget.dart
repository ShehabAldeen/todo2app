import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToddBottomSheet extends StatefulWidget {
  @override
  State<AddToddBottomSheet> createState() => _AddToddBottomSheetState();
}

class _AddToddBottomSheetState extends State<AddToddBottomSheet> {
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
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            minLines: 4,
            maxLines: 4,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Date'),
          InkWell(
            onTap: () {
              showDateDialge();
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '13/12/2021',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  void showDateDialge() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
