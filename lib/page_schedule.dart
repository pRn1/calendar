import 'package:calendar_try/container_finished.dart';
import 'package:calendar_try/container_pending.dart';
import 'package:calendar_try/scaffold_pattern.dart';
import 'package:flutter/material.dart';

import 'top_container_pattern.dart';

class PageSchedule extends StatelessWidget {
  const PageSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      bodyPage: Column(
        children: [
          const TopContainerPattern(
              title: 'Minha Agenda', name: 'Vinícius', profile: 'barberPhoto'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RefreshIndicator(
                displacement: 25,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                color: Colors.white,
                onRefresh: () => _reloadListItem(),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                      child: ContainerPending(
                        berbercutPrice: 12,
                        haircutPrice: 25,
                        barberShopName: 'Packers Barbearia',
                        dayOfService: 'Dia 27/09',
                        hourOfService: '08:30',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                      child: ContainerFinished(
                        berbercutPrice: 12,
                        haircutPrice: 25,
                        barberShopName: "Beto's Barbearia",
                        dayOfService: 'Dia 25/08',
                        hourOfService: '13:00',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                      child: ContainerFinished(
                        berbercutPrice: 12,
                        haircutPrice: 25,
                        barberShopName: 'Outsider Barbearia',
                        dayOfService: 'Dia 17/06',
                        hourOfService: '16:30',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {});
  }
}
