import 'package:dev_fale_mais/controllers/app_controller.dart';
import 'package:dev_fale_mais/widgets/modals/show_result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = AppController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Plano Fale Mais'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Vamo fazer uma simulação?',
                  style: TextStyle(fontSize: size.width * 0.06),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Text(
                    'Selecione seu DDD de origem:  ',
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.04),
                  child: SizedBox(
                    width: size.width * 0.4,
                    child: DropdownButtonFormField<String>(
                      focusColor: Colors.transparent,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.09),
                          ),
                        ),
                        filled: false,
                      ),
                      iconSize: size.width * 0.04,
                      alignment: Alignment.center,
                      value: controller.dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          controller.dropdownValue = newValue!;
                        });
                      },
                      items: <String>['011', '016', '017', '018']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Text(
                    'Selecione o DDD de destino:  ',
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: DropdownButtonFormField<String>(
                    focusColor: Colors.transparent,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(size.width * 0.09),
                        ),
                      ),
                      filled: false,
                    ),
                    alignment: Alignment.center,
                    value: controller.dropdownValue2,
                    onChanged: (String? newValue) {
                      setState(() {
                        controller.dropdownValue2 = newValue!;
                      });
                    },
                    items: <String>['011', '016', '017', '018']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Text(
                    'Selecione o plano:  ',
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: DropdownButtonFormField<String>(
                    focusColor: Colors.transparent,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(size.width * 0.09),
                        ),
                      ),
                      filled: false,
                    ),
                    value: controller.dropdownValue3,
                    onChanged: (String? newValue) {
                      setState(() {
                        controller.dropdownValue3 = newValue!;
                      });
                    },
                    items: <String>[
                      'FaleMais 30',
                      'FaleMais 60',
                      'FaleMais 120'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Text(
                    'Informe os minutos da sua ligação:',
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.minutesController,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      hintText: 'Informe',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(size.width * 0.05),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                      ),
                    ),
                    onPressed: () => {
                      if (controller.dropdownValue == controller.dropdownValue2)
                        {
                          Fluttertoast.showToast(
                              msg: 'Locais devem ser diferentes '),
                        }
                      else if (controller.minutesController.text == '')
                        {
                          Fluttertoast.showToast(msg: 'Favor informar minutos'),
                        }
                      else if (controller.noCombination == -1)
                        {
                          Fluttertoast.showToast(
                              msg: 'Essa opção não existe no momento'),
                        }
                      else
                        {
                          controller.calculate(
                            int.parse(controller.dropdownValue),
                            int.parse(controller.dropdownValue2),
                            int.parse(controller.minutesController.text),
                          ),
                          ModalTextResult.showModal(
                            context,
                            'Valor sem o plano será de ${controller.withoutPlan} reais',
                            'Valor com o plano será de ${controller.finalPrice} reais',
                          )
                        }
                    },
                    child: Text(
                      'Simular',
                      style: TextStyle(fontSize: size.width * 0.06),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
