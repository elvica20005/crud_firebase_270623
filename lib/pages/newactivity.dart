import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Nueva extends StatefulWidget {
  const Nueva({Key? key}) : super(key: key);

  @override
  State<Nueva> createState() => _NuevaState();
}

class _NuevaState extends State<Nueva> {
  TextEditingController evento = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController selTime = TextEditingController();

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
                    //DateTime parsedTime = DateFormat.jm().parse(pickedTime.format.toString());
                    //print(parsedTime);
                    //String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                    //print(formattedTime);
                    setState(() {
                     selTime.text = hora;
                    });
                  } else {
                    print('No se seleccionó hora');
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
