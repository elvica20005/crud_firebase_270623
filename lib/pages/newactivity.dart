import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Nueva extends StatefulWidget {
  const Nueva({Key? key}) : super(key: key);

  @override
  State<Nueva> createState() => _NuevaState();
}

class _NuevaState extends State<Nueva> {
  String dropdownValue = 'Uniforme de Gala';
  TextEditingController evento = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController selTime = TextEditingController();

  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('evento');

  var options = [
    'Uniforme de Gala',
    'Uniforme Deportivo',
    'Vestimenta de calle',
  ];
  var _currentItemSelected = "Uniforme de Gala";
  var vestimenta = "Uniforme de Gala";

  @override
  void initState() {
    super.initState();
    dateController.text = "";
    selTime.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva actividad'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: evento,
              decoration: const InputDecoration(
                hintText: 'Nuevo evento',
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), labelText: "Ingrese fecha"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030));
                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    dateController.text = formattedDate;
                  });
                } else {
                  print("Fecha no seleccionada");
                }
              },
            ),
            TextField(
              controller: selTime,
              decoration: const InputDecoration(
                  icon: Icon(Icons.timer), labelText: "Selecciona Hora"),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                  if(pickedTime != null) {
                    print(pickedTime.toString());
                    var hora = '${pickedTime.hour.toString().padLeft(1,'0')} : ${pickedTime.minute.toString().padLeft(2,'0')}';
                    print('La hora es: ' +hora);
                    setState(() {
                     selTime.text = hora;
                    });
                  } else {
                    print('No se seleccionó hora');
                  }
              },
            ),

            DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              isDense: true,
              isExpanded: false,
              iconEnabledColor: Colors.white,
              focusColor: Colors.white,
              items: options.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValueSelected) {
                setState(() {
                  _currentItemSelected = newValueSelected!;
                  vestimenta = newValueSelected;
                });
              },
              value: _currentItemSelected,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 2, 11, 128),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                ref.add({
                  'Evento': evento.text,
                  'Fecha': dateController.text,
                  'Hora': selTime.text,
                  'Vestimenta': vestimenta,
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Añadir',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
