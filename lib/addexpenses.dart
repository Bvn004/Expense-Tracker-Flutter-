import 'package:flutter/material.dart';
import 'package:expense_tracker/variblesreq.dart';

class Newexpenses extends StatefulWidget {
  Newexpenses({super.key, required this.onaddexpense});

  final void Function(expensevar expense) onaddexpense;

  @override
  State<Newexpenses> createState() => _NewexpensesState();
}

class _NewexpensesState extends State<Newexpenses> {
  var enteredval = '';
  var enteredamt = '';

  DateTime? selecteddate;

  Category selectedcategory = Category.leisure;

  void saveddatas() {
    final entamt = double.tryParse(enteredamt);
    final invalidamt = entamt == null || entamt <= 0;

    if (enteredval.trim().isEmpty || invalidamt || selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('invalid input'),
                content: const Text('please enter a valid input '),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('okay'))
                ],
              ));
      return;
    }
    widget.onaddexpense(expensevar(
        amount: entamt,
        date: selecteddate!,
        title: enteredval,
        category: selectedcategory));

    Navigator.pop(context);
  }

  void enteredamtt(String inputnum) {
    enteredamt = inputnum;
  }

  void enterrdval(String inputval) {
    enteredval = inputval;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: enterrdval,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: enteredamtt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amt(₹)"),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(selecteddate == null
                      ? 'no date selected'
                      : dateform.format(selecteddate!)),
                  IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final fdate =
                            DateTime(now.year - 1, now.month, now.day);

                        final pickeddate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: fdate,
                            lastDate: now);

                        setState(() {
                          selecteddate = pickeddate;
                        });
                      },
                      icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedcategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedcategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel")),
              ElevatedButton(onPressed: saveddatas, child: Text("submit")),
            ],
          )
        ],
      ),
    );
  }
}
