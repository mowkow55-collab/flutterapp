import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';
import '../../../profile/presentation/cubits/order_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the current theme mode to update the switch state
    final currentThemeMode = context.watch<ThemeCubit>().state;
    // Determine if it is dark. If system, check platform brightness, but for simplicity let's rely on the explicit mode or platform.
    // Simplifying: if mode is dark, switch is on.
    final isDark = currentThemeMode == ThemeMode.dark || 
        (currentThemeMode == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About App'),
            subtitle: const Text('Book Store v1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDark,
              onChanged: (val) {
                context.read<ThemeCubit>().toggleTheme(val);
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history_outlined),
            title: const Text('Order History'),
            onTap: () => context.push('/orders'),
          ),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state.orders.isEmpty) return const SizedBox.shrink();
              final latestOrder = state.orders.first;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Recent Order', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                        GestureDetector(
                          onTap: () => context.push('/orders'),
                          child: Text(
                            'View History',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined, color: Colors.blue),
                    title: Text('Order #${latestOrder.id.substring(0, 8).toUpperCase()}'),
                    subtitle: Text('${latestOrder.date.day}/${latestOrder.date.month}/${latestOrder.date.year} • ${latestOrder.items.length} ${latestOrder.items.length == 1 ? 'item' : 'items'} • \$${latestOrder.totalAmount.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/order-details', extra: latestOrder),
                  ),
                ],
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
