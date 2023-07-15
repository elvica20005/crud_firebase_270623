import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendario extends StatefulWidget {
  Function? createTodoDialog;
  Calendario({Key? key, required this.createTodoDialog}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  
  _createTodoDialog() {
    showDialog(context: context, builder: (context) => _SaveDialogo());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario Escolar'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _createTodoDialog();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blueGrey,
                child: SfDateRangePicker(
                  selectionColor: Colors.amber,
                  startRangeSelectionColor: Colors.purple,
                  endRangeSelectionColor: Colors.purple,
                  rangeSelectionColor: Colors.blue,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 3)),
                    DateTime.now().subtract(const Duration(days: 3)),
                  ),
                  showActionButtons: true,
                  //confirmText: "Listo",
                  onSubmit: (dateRange) {
                    print(dateRange);
                  },
                  cancelText: "Cancelar",
                ),
              )),
          Expanded(
              flex: 2,
              child: false
                  ? _PageEmpty()
                  : ListView.builder(
                  itemCount: 50,
                  itemBuilder: ((context, index) => DelayedDisplay(
                    delay: const Duration(milliseconds: 5),
                    slidingBeginOffset: const Offset(-1, 0),
                    fadeIn: true,
                    child: Card(
                      child: ListTile(
                        title: Text("To do $index"),
                        leading: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.greenAccent,
                        ),
                        trailing: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        subtitle: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Text(
                                "date ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Contenido del to do")
                            ],
                          ),
                        ),
                      ),
                    ),
                  )))),
        ],
      ),
    );
  }
}

class _PageEmpty extends StatelessWidget {
  const _PageEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.purple.shade100,
            shape: BoxShape.circle),
        child: const Center(
            child: Text(
              "No hay tareas",
              style: TextStyle(
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w100),
            )),
      ),
    );
  }
}

class _SaveDialogo extends StatelessWidget {
  _SaveDialogo({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _key,
        child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Name",
          border: OutlineInputBorder()),
          controller: _nameController,
        ),
      ],),),
    );
  }
}
