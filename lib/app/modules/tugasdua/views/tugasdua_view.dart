import 'package:flutter/material.dart';

class TugasduaView extends StatelessWidget {
  const TugasduaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TugasduaView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan nama Anda',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tanggal Lahir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan tanggal lahir Anda',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nomor Telepon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan nomor telepon Anda',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lakukan sesuatu ketika tombol ditekan
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TugasduaView(),
  ));
}
