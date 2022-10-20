import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personality_gather/data/datadiri.dart';

enum FormMode{tambah, ubah}

class TampilanBuatUbah extends StatefulWidget {
  const TampilanBuatUbah({super.key, required this.mode, this.dataDiri});

  final FormMode mode;
  final DataDiri? dataDiri;

  @override
  State<TampilanBuatUbah> createState() => _TampilanBuatUbahState();
}

class _TampilanBuatUbahState extends State<TampilanBuatUbah> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _zodiakController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _enneagramController = TextEditingController();
  TextEditingController _tritypeController = TextEditingController();

  @override
  initState(){
    super.initState();
    if (widget.mode == FormMode.ubah){
      _namaController.text = widget.dataDiri!.nama;
      _zodiakController.text = widget.dataDiri!.zodiak;
      _mbtiController.text = widget.dataDiri!.mbti;
      _enneagramController.text = widget.dataDiri!.enneagram;
      _tritypeController.text = widget.dataDiri!.tritype;
    }
  }

  getDataDiri(){
    return DataDiri(
      nama: _namaController.text,
      zodiak: _zodiakController.text,
      mbti: _mbtiController.text,
      enneagram: _enneagramController.text,
      tritype: _tritypeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
      backgroundColor: Color.fromARGB(255, 40, 35, 50),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 130, 110, 135),
        middle: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text ('Data Personality',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 40, 35, 50),
              ),)
            ],
          )),
        trailing: GestureDetector (
          onTap: () {
            Navigator.pop(context, getDataDiri());
          },
          child: Card(
            color: Color.fromARGB(255, 40, 35, 50),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Text(widget.mode == FormMode.tambah ? 'Tambah' : 'Ubah',
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 215, 185, 225),
              ),),
            ),
          ),
        ),
    ),
      child: SafeArea (
        child: CupertinoFormSection(
          backgroundColor: Color.fromARGB(255, 40, 35, 50),
          header: Text(widget.mode == FormMode.tambah ? 'Tambah Data Personality' : 'Ubah Data Personality',
          style: TextStyle(
            color: Color.fromARGB(255, 215, 185, 225),
          ),),
          children: [
            CupertinoFormRow(
              prefix: Text('Nama         '),
              child: CupertinoTextFormFieldRow(
                controller: _namaController,
                placeholder: 'Tulis Nama',
              ),
            ),

            CupertinoFormRow(
              prefix: Text('Zodiak        '),
              child: CupertinoTextFormFieldRow(
                controller: _zodiakController,
                placeholder: 'Tulis Zodiak',
              ),
            ),

            CupertinoFormRow(
              prefix: Text('MBTI           '),
              child: CupertinoTextFormFieldRow(
                controller: _mbtiController,
                placeholder: 'Tulis MBTI',
              ),
            ),

            CupertinoFormRow(
              prefix: Text('Enneagram'),
              child: CupertinoTextFormFieldRow(
                controller: _enneagramController,
                placeholder: 'Tulis Enneagram',
              ),
            ),

            CupertinoFormRow(
              prefix: Text('Tritype        '),
              child: CupertinoTextFormFieldRow(
                controller: _tritypeController,
                placeholder: 'Tulis Tritype',
              ),
            ),
          ],
          ),
      ),
    );
  }
}