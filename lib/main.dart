import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 2.0; // Slow animation for clarity
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Hero Animation',
      debugShowCheckedModeBanner: false,
      home: const ContactListPage(),
    );
  }
}

class Contact {
  final String id;
  final String name;
  final String imageAsset;
  final String phone;
  final String email;

  Contact({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.phone,
    required this.email,
  });
}

final List<Contact> contacts = [
  Contact(
    id: 'c1',
    name: 'Alice Johnson',
    imageAsset: 'assets/alice.jpg',
    phone: '123-456-789',
    email: 'alice@example.com',
  ),
  Contact(
    id: 'c2',
    name: 'Bob Smith',
    imageAsset: 'assets/bob.jpg',
    phone: '566-654-342',
    email: 'bob@example.com',
  ),
  Contact(
    id: 'c3',
    name: 'Charlie Brown',
    imageAsset: 'assets/charlie.jpg',
    phone: '789-543-234',
    email: 'charlie@example.com',
  ),
  Contact(
    id: 'c4',
    name: 'Diana Prince',
    imageAsset: 'assets/diana.jpg',
    phone: '654-765-234',
    email: 'diana@example.com',
  ),
  Contact(
    id: 'c5',
    name: 'Emma Wilson',
    imageAsset: 'assets/emma.jpg',
    phone: '555-456-434',
    email: 'emma@example.com',
  ),
  Contact(
    id: 'c6',
    name: 'Frank Castle',
    imageAsset: 'assets/frank.jpg',
    phone: '345-765-344',
    email: 'frank@example.com',
  ),
  Contact(
    id: 'c7',
    name: 'Grace Lee',
    imageAsset: 'assets/grace.jpg',
    phone: '654-203-454',
    email: 'grace@example.com',
  ),
  Contact(
    id: 'c8',
    name: 'Harry Potter',
    imageAsset: 'assets/harry.jpg',
    phone: '789-543-123',
    email: 'harry@example.com',
  ),
];

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Hero(
              tag: contact.id,
              child: ClipOval(
                child: Image.asset(
                  contact.imageAsset,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(contact.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ContactDetailPage(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailPage extends StatelessWidget {
  final Contact contact;
  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Column(
        children: [
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Hero(
              tag: contact.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24), // Square-ish look
                child: Image.asset(
                  contact.imageAsset,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Phone: ${contact.phone}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Email: ${contact.email}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
