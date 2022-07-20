// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'barber_list_item.dart';

import 'container_filter.dart';
import 'image_container.dart';
import 'top_bar_widget.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TopBarWidget(userName: 'Vinícius'),
        const ImageContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Icon(Icons.filter_alt_rounded, color: Colors.white, size: 14),
                SizedBox(width: 5),
                Text('Filtros',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: ContainerFilterIcon(filterName: 'Preço'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ContainerFilterIcon(filterName: 'Avaliação'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ContainerFilterIcon(filterName: 'Distância'),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
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
                    child: BarberListItem(
                        star: 2,
                        distance: 25.6,
                        barberShopName: 'Outsider barber',
                        berbercutPrice: 25,
                        haircutPrice: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                    child: BarberListItem(
                        star: 2,
                        distance: 25.6,
                        barberShopName: 'Packers Barbearia',
                        berbercutPrice: 25,
                        haircutPrice: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                    child: BarberListItem(
                        star: 2,
                        distance: 25.6,
                        barberShopName: 'Outsider barber',
                        berbercutPrice: 25,
                        haircutPrice: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                    child: BarberListItem(
                        star: 7,
                        distance: 25.6,
                        barberShopName: 'Outsider barber',
                        berbercutPrice: 25,
                        haircutPrice: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _reloadListItem() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      
    });
  }
}
