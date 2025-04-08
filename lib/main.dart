import 'package:flutter/material.dart';

void main() {
  runApp(WeddingApp());
}

class WeddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Invitation',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text('Wedding Invitation')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/test.jpg'),  // ใส่รูปภาพคู่บ่าวสาว
            SizedBox(height: 20),
            Text(
              'We are getting married!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Join us in celebrating our special day.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            // กำหนดการงานแต่งงาน
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Event Schedule', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  EventCard(title: 'Wedding Ceremony', time: '10:00 AM', description: 'Join us for our wedding ceremony.'),
                  EventCard(title: 'Reception', time: '12:00 PM', description: 'Celebrate with us at the reception!'),
                  EventCard(title: 'After Party', time: '2:00 PM', description: 'Let’s party and have fun!'),
                ],
              ),
            ),
            SizedBox(height: 40),
            // ปุ่มเชื่อมไปหน้า RSVP
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RsvpPage()),
                  );
                },
                child: Text('RSVP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String time;
  final String description;

  EventCard({required this.title, required this.time, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Time: $time', style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text(description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class RsvpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RSVP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Please confirm your attendance', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            TextField(
              controller: guestsController,
              decoration: InputDecoration(labelText: 'Number of Guests'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle RSVP submission logic here
                String name = nameController.text;
                String guests = guestsController.text;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Thank You!'),
                      content: Text('RSVP received from $name with $guests guests.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit RSVP'),
            ),
          ],
        ),
      ),
    );
  }
}
