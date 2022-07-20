import 'package:calendar_try/wrap_services_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'container_pending.dart';
import 'scaffold_pattern.dart';
import 'top_container_pattern.dart';
import 'utils.dart';
import 'wrap_hour_buttons.dart';

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

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(
        () {
          daySelected = DateFormat.MEd('pt_BR').format(selectedDay);
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        },
      );
    }
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
              const WrapServicesButtons(),
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
              const WrapHourButtons(),
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
          arguments: ScreenArguments(hourSelected, daySelected),
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
