import 'package:core_router/core_router.dart';
import 'package:home_feature/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/src/presentation/controllers/banner/banner_controller.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({
    super.key,
  });

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final controller = getIt<BannerController>();
  final router = getIt<AppRouter>().router;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner screen"),
      ),
      body: const Center(
        child: Text("Banner screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.pushNamed('/shipping_address/123/detail');
        },
      ),
    );
  }
}
