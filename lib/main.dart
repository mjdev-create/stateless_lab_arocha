import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());


class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Juan Dela Cruz',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'juan.delacruz@school.edu',
  ),
  Student(
    name: 'Maria Santos',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'maria.santos@school.edu',
  ),
  Student(
    name: 'Carlo Mendoza',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'carlo.mendoza@school.edu',
  ),
  Student(
    name: 'Bea Villanueva',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'bea.villanueva@school.edu',
  ),
  Student(
    name: 'Rico Navarro',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'rico.navarro@school.edu',
  ),
];


class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary, 
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6), 
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis, 
          ),
        ),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, 
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primary, 
              child: Text(
                student.name[0],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5, 
                    ),
                  ),
                  Text(student.course),
                  const SizedBox(height: 8),
                  InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                  const SizedBox(height: 4),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Directory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16), 
        children: [
          const SectionHeader(title: 'Students'),
          for (final student in students) StudentCard(student: student),
        ],
      ),
    );
  }
}


class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, 
      ),
      home: const DirectoryScreen(),
    );
  }
}