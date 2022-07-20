import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:calendar_try/scaffold_pattern.dart';
import 'package:calendar_try/toggle_buttons_schedule.dart';

import 'container_pending.dart';
import 'top_container_pattern.dart';
import 'utils.dart';

void main() {
  initializeDateFormatting().then(
    (_) => runApp(
      const MaterialApp(
        title: 'Calendar',
        home: CalendarPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int indexSelected = 0;
  changeIndexSelected(int index) {
    indexSelected = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(
        () {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          day = DateFormat.MEd('pt_BR').format(selectedDay);
        },
      );
    }
    day = DateFormat.MEd('pt_BR').format(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      home: ScaffoldPattern(
        bodyPage: SingleChildScrollView(
          child: Column(
            children: [
              const TopContainerPattern(
                  title: 'Agendar Horário',
                  name: 'Barbeiro',
                  profile: 'barberPhoto'),
              TableCalendar(
                locale: 'pt_BR',
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    if (day.weekday == DateTime.sunday) {
                      final text = DateFormat.E('pt_BR').format(day);
                      return Center(
                        child: Text(
                          text,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return null;
                  },
                ),
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  isTodayHighlighted: false,
                  markersMaxCount: 0,
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey[300],
                  ),
                ),
                onDaySelected: _onDaySelected,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 30,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Text(
                    'Serviços:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // Wrap(
              //   spacing: 10,
              //   children: [
              //     SizedBox(
              //       width: 120,
              //       child: MyButton(
              //           text: 'Corte Máquina', index: ),
              //     ),
              //     SizedBox(
              //       width: 120,
              //       child: MyButton(text: 'Barba', index: ),
              //     ),
              //     SizedBox(
              //       width: 120,
              //       child: MyButton(text: '-', index: ),
              //     ),
              //     SizedBox(
              //       width: 120,
              //       child: MyButton(
              //           text: 'Corte Tesoura', index: ),
              //     ),
              //     SizedBox(
              //       width: 120,
              //       child:
              //           MyButton(text: 'Hidratação', index: ),
              //     ),
              //     SizedBox(
              //       width: 120,
              //       child: MyButton(text: '-', index: ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Text(
                    'Horários:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  MyButton(
                    text: '08:30',
                    index: 2,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '08:30';

                      changeIndexSelected(2);
                    },
                  ),
                  MyButton(
                    text: '09:00',
                    index: 3,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '09:00';

                      changeIndexSelected(3);
                    },
                  ),
                  MyButton(
                    text: '09:30',
                    index: 4,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '09:30';
                      changeIndexSelected(4);
                    },
                  ),
                  MyButton(
                    text: '10:00',
                    index: 5,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '10:00';
                      changeIndexSelected(5);
                    },
                  ),
                  MyButton(
                    text: '10:30',
                    index: 6,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '10:30';
                      changeIndexSelected(6);
                    },
                  ),
                  MyButton(
                    text: '11:00',
                    index: 7,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '11:00';
                      changeIndexSelected(7);
                    },
                  ),
                  MyButton(
                    text: '11:30',
                    index: 8,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '11:30';
                      changeIndexSelected(8);
                    },
                  ),
                  MyButton(
                    text: '12:00',
                    index: 9,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '12:00';
                      changeIndexSelected(9);
                    },
                  ),
                  MyButton(
                    text: '12:30',
                    index: 10,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '12:30';
                      changeIndexSelected(10);
                    },
                  ),
                  MyButton(
                    text: '13:00',
                    index: 11,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '13:00';
                      changeIndexSelected(11);
                    },
                  ),
                  MyButton(
                    text: '13:30',
                    index: 12,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '13:30';
                      changeIndexSelected(12);
                    },
                  ),
                  MyButton(
                    text: '14:00',
                    index: 13,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '14:00';
                      changeIndexSelected(13);
                    },
                  ),
                  MyButton(
                    text: '14:30',
                    index: 14,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '14:30';
                      changeIndexSelected(14);
                    },
                  ),
                  MyButton(
                    text: '15:00',
                    index: 15,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '15:00';
                      changeIndexSelected(15);
                    },
                  ),
                  MyButton(
                    text: '15:30',
                    index: 16,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '15:30';
                      changeIndexSelected(16);
                    },
                  ),
                  MyButton(
                    text: '16:00',
                    index: 17,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '16:00';
                      changeIndexSelected(17);
                    },
                  ),
                  MyButton(
                    text: '16:30',
                    index: 18,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '16:30';
                      changeIndexSelected(18);
                    },
                  ),
                  MyButton(
                    text: '17:00',
                    index: 19,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '17:00';
                      changeIndexSelected(19);
                    },
                  ),
                  MyButton(
                    text: '17:30',
                    index: 20,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '17:30';
                      changeIndexSelected(20);
                    },
                  ),
                  MyButton(
                    text: '18:00',
                    index: 21,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '18:00';
                      changeIndexSelected(21);
                    },
                  ),
                  MyButton(
                    text: '18:30',
                    index: 22,
                    indexSelected: indexSelected,
                    onPressed: () {
                      hour = '18:30';
                      changeIndexSelected(22);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ScheduleButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    required this.index,
    required this.indexSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();

  final int index;
  final int indexSelected;
  final String text;
  final void Function() onPressed;
}

class _MyButtonState extends State<MyButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // key: UniqueKey(),
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

class ScheduleButton extends StatefulWidget {
  const ScheduleButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleButton> createState() => __ScheduleButtonState();
}

class __ScheduleButtonState extends State<ScheduleButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          ExtractArgumentsScreen.routeName,
          arguments: ScreenArguments(hour, day),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            'Agendar',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class ScreenArguments {
  final text;
  final _selectedDay;

  ScreenArguments(this.text, this._selectedDay);
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return ContainerPending(
      berbercutPrice: 12,
      haircutPrice: 25,
      barberShopName: 'Packers Barbearia',
      dayOfService: args._selectedDay.toString(),
      hourOfService: args.text,
    );
  }
}
