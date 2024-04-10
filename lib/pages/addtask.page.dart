import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TambahTugas extends StatefulWidget {
  const TambahTugas({super.key});

  @override
  State<TambahTugas> createState() => _TambahTugasState();
}

class _TambahTugasState extends State<TambahTugas> {
  List <String> list = ["PBO", "ELEKTRONIKA", "BASIS DATA "];
  late String  dropDownValue = list.first; //BARU SAMPE SINI
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Tugas Kamu", style: GoogleFonts.montserrat(),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Deskripsi"
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                'Category',
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            ), 

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: DropdownButton<String> (
                value: dropDownValue,
                isExpanded: true,
                icon: Icon(Icons.format_line_spacing_outlined),
                items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value, 
                  child: Text(value),
                  );
              }).toList(),
              onChanged: (String? value){}),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  labelText: "Masukan Tanggal"
                ),
                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                     initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                       lastDate: DateTime(2099));
              
              
                  if (pickedDate != null){
                    String formattedDate = 
                    DateFormat('yyyy-MM-dd').format(pickedDate);
              
                    dateController.text = formattedDate;
                  }
                },
              ),
              
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(onPressed: (){}, 
              child: (Text("Save"))
              ),
            )
        ],)),
      ),
    );
  }
}