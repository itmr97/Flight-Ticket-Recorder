import 'package:flutter/material.dart';
import 'package:passngers_recoder/ticket.dart';

class PassCard extends StatelessWidget
{
  const PassCard({super.key, required this.passticket});

  final Ticket passticket;
  
  @override
  Widget build(BuildContext context) {
    
    return  Card(child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(passticket.name),
              const Spacer(),
              Text(passticket.section.name)
            ],
          ),
          const SizedBox(height: 4),
          Text('\$${passticket.price.toStringAsFixed(2)}'),
           Row(
            children: [
                Text(passticket.destnation.name),
                const Spacer(),
                Text(passticket.getformattedDate())
            ],
          )
      
        ],
      ),
    ),
    );
  }
  
}