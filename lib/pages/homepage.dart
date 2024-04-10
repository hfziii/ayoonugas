import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int jumlahTugasSelesai = 0;
  List<Task> daftarTugas = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Icon(Icons.assignment_turned_in_outlined, size: 30,),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tugas Selesai', style: GoogleFonts.montserrat(
                                color: Colors.white
                            ),),
                            SizedBox(height: 10,),
                            Text(jumlahTugasSelesai.toString()),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 120,),
                    Row(
                      children: [
                        Container(
                          child: Icon(Icons.assignment_late_outlined, size: 30,),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Belum Selesai', style: GoogleFonts.montserrat(
                                color: Colors.white
                            ),),
                            SizedBox(height: 10,),
                            Text((daftarTugas.length - jumlahTugasSelesai).toString()),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Data Tugas',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold
                ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  _tampilkanDialogTambahTugas(context);
                },
                child: Text('Tambah Tugas'),
              ),
            ),
            SizedBox(height: 16),
            _buatDaftarTugas(),
          ],
        ),
      ),
    );
  }

  Widget _buatDaftarTugas() {
    return Column(
      children: daftarTugas.asMap().entries.map((entry) {
        final index = entry.key;
        final tugas = entry.value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            elevation: 20,
            child: ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: tugas.sudahSelesai,
                    onChanged: (value) {
                      _toggleStatusTugas(index, value);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _tampilkanDialogEditTugas(context, index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _hapusTugas(index);
                    },
                  ),
                ],
              ),
              title: Text(tugas.mataPelajaran),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tanggal: ${tugas.tanggal}'),
                  Text('Deskripsi: ${tugas.deskripsi}'),
                  Text('Prioritas: ${tugas.prioritas}'),
                ],
              ),
              leading: Container(
                child: Icon(Icons.assignment_outlined, size: 30,),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _tampilkanDialogTambahTugas(BuildContext context) async {
    TextEditingController controllerMataPelajaran = TextEditingController();
    TextEditingController controllerTanggal = TextEditingController();
    TextEditingController controllerDeskripsi = TextEditingController();
    String prioritas = 'Urgent';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Tugas'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controllerMataPelajaran,
                  decoration: InputDecoration(labelText: 'Mata Pelajaran'),
                ),
                TextField(
                  controller: controllerTanggal,
                  decoration: InputDecoration(labelText: 'Hari/Tanggal'),
                ),
                TextField(
                  controller: controllerDeskripsi,
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                ),
                DropdownButtonFormField<String>(
                  value: prioritas,
                  onChanged: (value) {
                    setState(() {
                      prioritas = value!;
                    });
                  },
                  items: ['Urgent','Medium','Santai'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Prioritas'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  daftarTugas.add(Task(
                    mataPelajaran: controllerMataPelajaran.text,
                    tanggal: controllerTanggal.text,
                    deskripsi: controllerDeskripsi.text,
                    prioritas: prioritas,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _toggleStatusTugas(int index, bool? value) {
    setState(() {
      daftarTugas[index].sudahSelesai = value!;
      if (daftarTugas[index].sudahSelesai) {
        jumlahTugasSelesai++;
      } else {
        jumlahTugasSelesai--;
      }
    });
  }

  void _tampilkanDialogEditTugas(BuildContext context, int index) async {
    TextEditingController controllerMataPelajaran = TextEditingController();
    TextEditingController controllerTanggal = TextEditingController();
    TextEditingController controllerDeskripsi = TextEditingController();
    String prioritas = daftarTugas[index].prioritas;

    controllerMataPelajaran.text = daftarTugas[index].mataPelajaran;
    controllerTanggal.text = daftarTugas[index].tanggal;
    controllerDeskripsi.text = daftarTugas[index].deskripsi;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Tugas'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controllerMataPelajaran,
                  decoration: InputDecoration(labelText: 'Mata Pelajaran'),
                ),
                TextField(
                  controller: controllerTanggal,
                  decoration: InputDecoration(labelText: 'Tanggal'),
                ),
                TextField(
                  controller: controllerDeskripsi,
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                ),
                DropdownButtonFormField<String>(
                  value: prioritas,
                  onChanged: (value) {
                    setState(() {
                      prioritas = value!;
                    });
                  },
                  items: ['Urgent','Medium', 'Easy'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Prioritas'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (daftarTugas[index].sudahSelesai) {
                    jumlahTugasSelesai--;
                  }
                  daftarTugas[index] = Task(
                    mataPelajaran: controllerMataPelajaran.text,
                    tanggal: controllerTanggal.text,
                    deskripsi: controllerDeskripsi.text,
                    prioritas: prioritas,
                    sudahSelesai: daftarTugas[index].sudahSelesai,
                  );
                  if (daftarTugas[index].sudahSelesai) {
                    jumlahTugasSelesai++;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _hapusTugas(int index) {
    setState(() {
      if (daftarTugas[index].sudahSelesai) {
        jumlahTugasSelesai--;
      }
      daftarTugas.removeAt(index);
    });
  }
}

class Task {
  final String mataPelajaran;
  final String tanggal;
  final String deskripsi;
  final String prioritas;
  bool sudahSelesai;

  Task({
    required this.mataPelajaran,
    required this.tanggal,
    required this.deskripsi,
    required this.prioritas,
    this.sudahSelesai = false,
  });
}