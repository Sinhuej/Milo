import 'package:flutter/material.dart';

void main() {
  runApp(const MiloApp());
}

class MiloApp extends StatelessWidget {
  const MiloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MiloHomePage(),
    );
  }
}

class MiloHomePage extends StatelessWidget {
  const MiloHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Milo – Kid AI Companion'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Milo avatar + intro text
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Text('M'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Hi, I\'m Milo! I can help with homework, games, and talking about feelings.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Big buttons for main features
            _MiloActionButton(
              icon: Icons.school,
              label: 'Homework Help',
              description:
                  'Ask questions and I will guide you without just giving the answer.',
            ),
            const SizedBox(height: 12),
            _MiloActionButton(
              icon: Icons.videogame_asset,
              label: 'Play Learning Games',
              description: 'Chess, card games, color match and brain puzzles.',
            ),
            const SizedBox(height: 12),
            _MiloActionButton(
              icon: Icons.favorite,
              label: 'Feelings & Bullying',
              description:
                  'Practice how to talk to parents and friends if you are worried or being bullied.',
            ),

            const Spacer(),

            // Footer
            Center(
              child: Text(
                'Milo • Learning • Kindness • Confidence',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiloActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;

  const _MiloActionButton({
    required this.icon,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label screen coming soon…')),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
