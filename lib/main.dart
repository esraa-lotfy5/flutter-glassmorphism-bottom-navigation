import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  // final ValueChanged<int> onTap;

  static const items = [
    (Icons.home_rounded, 'Home'),
    (Icons.search_rounded, 'Search'),
    (Icons.favorite_rounded, 'Favorites'),
    (Icons.person_rounded, 'Profile'),
  ];
  static const itemsBgColor = [Colors.pink, Colors.green, Colors.red, Colors.brown];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: itemsBgColor[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white.withValues(alpha: 0.22), Colors.white.withValues(alpha: 0.08)],
                ),

                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 30, offset: const Offset(0, 10)),
                ],
              ),
              child: Row(
                children: List.generate(items.length, (index) {
                  final selected = currentIndex == index;
                  return Expanded(
                    child: _GlassNavItem(
                      icon: items[index].$1,
                      label: items[index].$2,
                      selected: selected,
                      onTap: () => setState(() => currentIndex = index),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassNavItem extends StatelessWidget {
  const _GlassNavItem({required this.icon, required this.label, required this.selected, required this.onTap});

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? Colors.white.withValues(alpha: 0.22) : Colors.transparent,
          boxShadow: selected
              ? [BoxShadow(color: Colors.white.withValues(alpha: 0.08), blurRadius: 12, spreadRadius: 1)]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: Colors.white.withValues(alpha: selected ? 1 : 0.6)),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: Colors.white.withValues(alpha: selected ? 1 : 0.6),
                fontSize: 14,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
