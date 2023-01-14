import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:profile_feature/core/di/di.dart';
import 'package:profile_feature/profile_feature.dart';
import 'package:profile_feature/src/presentation/controllers/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = getIt<ProfileController>();
  final router = getIt<AppRouter>().router;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile screen"),
          actions: [
            IconButton(
                onPressed: () {
                  UIManager.of(context).toggleThemeMode();
                },
                icon: const Icon(
                  Icons.add,
                )),
          ],
        ),
        body: Obx(() {
          final state = controller.rxState.value;
          switch (state) {
            case ProfileUIState.idle:
            case ProfileUIState.fetching:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProfileUIState.fetchError:
              return const Center(
                child: Text("Fetch error"),
              );
            case ProfileUIState.fetchSuccess:
              final addresses = controller.rxShippingAddresses;
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return GestureDetector(
                    child: Text(address.address),
                    onTap: () {
                      router
                          .pushNamed('/shipping_address/${address.id}/detail');
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 0.5,
                    color: Colors.grey.shade300,
                  );
                },
              );

            default:
              return const Text("Error");
          }
        }),
      ),
    );
  }
}
