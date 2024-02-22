import 'package:flutter/material.dart';
import 'package:passngers_recoder/ticket.dart';
import 'package:passngers_recoder/passnger_card.dart';

class TicketList extends StatelessWidget
{
  const TicketList({super.key, required this.tickets, required this.removeticket});

  final List<Ticket> tickets;
  final void Function(Ticket ticket) removeticket;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: tickets.length,
    itemBuilder: (ctx,index)=> Dismissible(key: ValueKey(tickets[index]), 
    onDismissed: (dircation )
    {
      removeticket(tickets[index]);
    },
    background:  Container(
        color: Theme.of(context).colorScheme.error.withOpacity(0.75 ),
        margin: Theme.of(context).cardTheme.margin,
        
        ),
        
        child: PassCard(passticket: tickets[index]),
        
   
    )
    )
    ;
    
}
}