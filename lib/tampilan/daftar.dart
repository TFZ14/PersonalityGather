import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personality_gather/data/datadiri.dart';
import 'package:personality_gather/tampilan/buat.dart';

class LayarDaftar extends StatefulWidget {
  const LayarDaftar({super.key});

  @override
  State<LayarDaftar> createState() => _LayarDaftarState();
}

class _LayarDaftarState extends State<LayarDaftar> {
  final List<DataDiri> _DaftarDataDiri = [
    DataDiri(
      nama      : 'Leia Lily',
      zodiak    : 'Capricorn',
      mbti      : 'INTP',
      enneagram : '9w8',
      tritype   : '954'),

    DataDiri(
      nama      : 'Allen Walker',
      zodiak    : 'Sagittarius',
      mbti      : 'INFP',
      enneagram : '1w9',
      tritype   : '162'),

    DataDiri(
      nama      : 'Sharon Reinsworth',
      zodiak    : 'Aries',
      mbti      : 'ESFJ',
      enneagram : '2w3',
      tritype   : '217'),
  ];

  _menampilkanPopUp (BuildContext context, int index) {
    final pencetDataDiri = _DaftarDataDiri[index];

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Terpilih ${pencetDataDiri.nama}'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              Navigator.pop(context);
              final result = await Navigator.push(
              context,
              CupertinoPageRoute (
                builder:(context) => TampilanBuatUbah(
                  mode: FormMode.ubah,
                  dataDiri: pencetDataDiri,
                  ),
              ),
            );
            if (result is DataDiri){
              setState(() {
                _DaftarDataDiri[index] = result;
              });
            }
            },
              child: const Text('Ubah'),
              ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text ('Perhatian!'),
                    content: Text ('Data Personality ${pencetDataDiri.nama} akan dihapus seluruhnya'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed:(){
                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _DaftarDataDiri.removeAt(index);
                          });
                        },
                        child: const Text ('Hapus'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Hapus'),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromARGB(255, 40, 35, 50),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 130, 110, 135),
        middle: Container (
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text ('Data Personality',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 40, 35, 50),
              ),),
            ]
          )),
        trailing: GestureDetector (
          onTap: () async {
            final result = await Navigator.push(
              context,
              CupertinoPageRoute (
                builder:(context) => const TampilanBuatUbah(mode: FormMode.tambah),
              ),
            );
            if (result is DataDiri) {
              setState(() {
                _DaftarDataDiri.add(result);
              });
            }
          },
          child: Icon (
          CupertinoIcons.add_circled,
          size: 24,
          color: Color.fromARGB(255, 40, 35, 50),
          ),
        ),
      ),
      child: SafeArea(
        child: ListView.builder (
          itemBuilder: ((context, index) {
            final item = _DaftarDataDiri[index];
            return Container (
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              child: Card(
                color: Color.fromARGB(255, 130, 110, 135),
                elevation: 6,
                child: Padding (
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () => _menampilkanPopUp(context, index),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text ('${item.nama}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 40, 35, 50),
                        ),),
                        Row(
                          children: [
                            Card(
                              color: Color.fromARGB(255, 215, 185, 225),
                              elevation: 4,
                              child: Padding (
                                padding: EdgeInsets.all(4),
                                child: Text ('${item.zodiak}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 130, 110, 135),
                                ),),
                              ),
                            ),

                            Card(
                              color: Color.fromARGB(255, 215, 185, 225),
                              elevation: 4,
                              child: Padding (
                                padding: EdgeInsets.all(4),
                                child: Text ('${item.mbti}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 130, 110, 135),
                                ),),
                              ),
                            ),

                            Card(
                              color: Color.fromARGB(255, 215, 185, 225),
                              elevation: 4,
                              child: Padding (
                                padding: EdgeInsets.all(4),
                                child: Text ('${item.enneagram}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 130, 110, 135),
                                ),),
                              ),
                            ),

                            Card(
                              color: Color.fromARGB(255, 215, 185, 225),
                              elevation: 4,
                              child: Padding (
                                padding: EdgeInsets.all(4),
                                child: Text ('${item.tritype}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 130, 110, 135),
                                ),),
                              ),
                            ),
                          ],
                        )
                      ]
                    ),
                  ),
                ),
              )
            );
          }),
          itemCount: _DaftarDataDiri.length,)
      ),
    );
  }
}