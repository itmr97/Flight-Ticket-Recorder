import 'package:flutter/material.dart';
import 'package:passngers_recoder/ticket.dart';
import 'package:passngers_recoder/tickets_list.dart';
import 'package:passngers_recoder/new_tickets.dart';

class Recoder extends StatefulWidget {
  const Recoder({super.key});

  

  @override
  State<Recoder> createState() {
    return _RecoderState();
  }
}


class _RecoderState extends State<Recoder> {
  final List<Ticket> _registredtikets = [];

  void removetickets(Ticket ticket)
  {
    final elementindex=_registredtikets.indexOf(ticket);

    setState(() {
      _registredtikets.remove(ticket);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(label: 
        'Undo', onPressed: (){
          setState(() {
            _registredtikets.insert(elementindex, ticket);
          });
        }),)

    );
  }

  void addticket(Ticket ticket)
  { 
    setState(() {
      _registredtikets.add(ticket);
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Flight Tickets Recoder'),
      ),
      body: Column(
          children: [
            Expanded(
              child: TicketList(tickets: _registredtikets,removeticket: removetickets,)
            ),
             Padding(padding: const EdgeInsets.fromLTRB(300, 10, 10, 90) ,
            child:  IconButton(onPressed: (){ 
                showModalBottomSheet(
                context: context, 
                isScrollControlled: true,
                builder: (ctx)=> NewTickets(addticket: addticket),

                );
                }, 
                icon: const Icon(Icons.add),
                color: Colors.black,
                iconSize:40,
                ),
            
            )
           
      
          ],

      ),
     
    );
    
  }
}
