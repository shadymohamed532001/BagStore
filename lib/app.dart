import 'package:bagstore/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class BgaStore extends StatelessWidget {
  const BgaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
