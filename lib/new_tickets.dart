import 'dart:io';

import 'package:flutter/material.dart';
import 'package:passngers_recoder/ticket.dart';
import 'package:flutter/cupertino.dart';

class NewTickets extends StatefulWidget {
  const NewTickets({super.key, required this.addticket});

  final void Function (Ticket ticket) addticket;

  @override
  State<NewTickets> createState() {
    return NewTicketState();
  }
}

class NewTicketState extends State<NewTickets> {
  DateTime? _selecteddate;
  Destnation _destnationcity = Destnation.istanbul;
  Section _sectionclass = Section.economy;

  final _namecontrolier=TextEditingController();
  final _pricecontroller=TextEditingController();

  void showdialog()
  {
    if(Platform.isIOS)
    {
      showCupertinoDialog(context: context, builder: (ctx)=>CupertinoAlertDialog(
        title: const Text('Invalid Input'),
      content: const Text('please make sure a valid name , price, date, class and destantion was entered'),
      actions: [TextButton(onPressed: (){ Navigator.pop(context);}, child: const Text('okay'))],
     )  );
    }
    else
    {
       showDialog(context: context, builder: (ctx) =>AlertDialog(
      title: const Text('Invalid Input'),
      content: const Text('please make sure a valid name , price, date, class and destantion was entered'),
      actions: [TextButton(onPressed: (){ Navigator.pop(context);}, child: const Text('okay'))],
     )

     );

    }

    
  }

  void _confirm()
  {
    final enteredamount=double.tryParse(_pricecontroller.text);
    final amountinvaild=enteredamount==null || enteredamount<=0;

    if(_namecontrolier.text.trim().isEmpty || amountinvaild ||
     _selecteddate==null)
    {
      showdialog();
     return;
    }
    widget.addticket(Ticket(name: _namecontrolier.text, price: enteredamount, date: _selecteddate!, destnation: _destnationcity, section: _sectionclass));
    Navigator.pop(context);

  }

  void _showdatepicker() async {
    final first = DateTime.now();
    final last = DateTime(first.year, first.month + 1, first.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: first, lastDate: last);
    setState(() {
      _selecteddate = pickedDate;
    });
  }

  
 /* @override
  void dispose() {
    _namecontrolier.dispose();
    _pricecontroller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    
    final keyboardspace=MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(16, 16, 16, 16+keyboardspace),
          child: Column(children: [
             TextField(
              controller: _namecontrolier,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                  child: DropdownButton(
                value: _destnationcity,
                items: Destnation.values
                    .map((destnation) => DropdownMenuItem(
                        value: destnation, child: Text(destnation.name.toString())))
                    .toList(),
                onChanged: (value) {
                  if(value==null)
                  {
                    return;
                  }
                  setState(() {
                    _destnationcity=value;
                  });
                },
              )),
              const Spacer(),
              Row(
                children: [
                  Text(_selecteddate == null
                      ? 'select date'
                      : formatter.format(_selecteddate!)),
                  IconButton(
                      onPressed: _showdatepicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ]),
            Row(
              children: [
                 Expanded(
                    child: TextField(
                      controller: _pricecontroller,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration:
                     const  InputDecoration(label: Text('price'), prefixText: '\$ '),
                )),
                const Spacer(),
                Expanded(
                    child: Row(
                  children: [
                    DropdownButton(
                      value: _sectionclass,
                      items: Section.values
                          .map((sectionclass) => DropdownMenuItem(
                              value: sectionclass,
                              child: Text(sectionclass.name.toString())))
                          .toList(),
                      onChanged: (value) {
                        if(value==null)
                        {
                          return;
                        }
                        setState(() {
                          _sectionclass=value;
                        });
                      },
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 40),
             Row( 
              mainAxisAlignment: MainAxisAlignment.end,        
              children: [
                  TextButton(onPressed: (){Navigator.pop(context);},
                   child: const Text('cancel')),
                   ElevatedButton(onPressed: _confirm, child: const Text('confirm'))
        
              ],
            )
          ]),
        ),
      ),
    );
  }
}
