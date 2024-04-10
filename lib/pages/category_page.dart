import 'package:flutter/material.dart';
import 'package:appayoonugas/pages/mainpage.dart';


class CateoryPage extends StatefulWidget {
  const CateoryPage({super.key});

  @override
  State<CateoryPage> createState() => _CateoryPageState();
}

class _CateoryPageState extends State<CateoryPage> {
  
  void _navigateToNextScreen() {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MainPage(),
    ),
  );
}
  List<String> dataList = [];

  void _showInputDialog(BuildContext context) async {
    TextEditingController controller = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Data'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Masukkan Data'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  dataList.add(controller.text);
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

  void _showEditDialog(BuildContext context, String data) async {
    TextEditingController controller = TextEditingController(text: data);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Ubah Data'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Mengupdate data dalam list
                setState(() {
                  int index = dataList.indexOf(data);
                  dataList[index] = controller.text;
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

  void _showDeleteDialog(BuildContext context, String data) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Data'),
          content: Text('Anda yakin ingin menghapus data ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Menghapus data dari list
                setState(() {
                  dataList.remove(data);
                });
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _showInputDialog(context);
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              _showDeleteDialog(context, dataList[index]);
                            },
                          ),
                          SizedBox(width: 20,),
                          IconButton(
                            icon: Icon(Icons.edit_outlined),
                            onPressed: () {
                              _showEditDialog(context, dataList[index]);
                            },
                          ),
                        ],
                      ),
                      leading: Icon(Icons.tag_sharp, color: Colors.white,),
                      title: Text(dataList[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
