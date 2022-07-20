import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.day);
final kLastDay = DateTime(2022, 12, 31);
String? hourSelected;
String daySelected = DateFormat.MEd('pt_BR').format(kToday);
bool isFavorite = false;

class HoursButtons extends StatefulWidget {
  const HoursButtons({
    Key? key,
    required this.index,
    required this.indexSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<HoursButtons> createState() => _HoursButtonsState();

  final int index;
  final int indexSelected;
  final String text;
  final void Function() onPressed;
}

class _HoursButtonsState extends State<HoursButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: widget.indexSelected == widget.index
          ? Colors.black
          : const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: isFavorite ? Colors.grey : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class ServicesButtons extends StatefulWidget {
  const ServicesButtons({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ServicesButtons> createState() => _ServicesButtonsState();

  final String text;
}

class _ServicesButtonsState extends State<ServicesButtons> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // key: UniqueKey(),
      color: isFavorite ? Colors.black : const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Text(
        widget.text,
        style: TextStyle(
          color: isFavorite ? Colors.grey : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
