import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LittersView extends StatelessWidget {
  const LittersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LittersPage();
  }
}

class LittersPage extends StatefulWidget {
  const LittersPage({super.key});

  @override
  State<LittersPage> createState() => _LittersPageState();
}

class _LittersPageState extends State<LittersPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}