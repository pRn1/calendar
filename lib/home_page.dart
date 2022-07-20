import 'package:flutter/material.dart';
import 'body_home.dart';

import 'scaffold_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPattern(bodyPage: BodyHome());
  }
}