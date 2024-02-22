import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


const uuid = Uuid();
final formatter = DateFormat.yMd();
enum Destnation { istanbul, syira, beirut, iran }
enum Section { economy, business }

class Ticket {
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Destnation destnation;
  final Section section;

  Ticket(
    {
      required this.name, 
      required this.price, 
      required this.date, 
      required this.destnation, 
      required this.section})
      :id=uuid.v4();
        
    String getformattedDate() {
    return formatter.format(date);
  }
}
