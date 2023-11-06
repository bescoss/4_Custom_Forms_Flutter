import 'package:flutter/material.dart';

class Stepperpage extends StatelessWidget {
  const Stepperpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StepperPage(),
    );
  }
}

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  late List<Step> _steps;

  _StepperPageState() {
    _steps = [
      Step(
        title: const Text('Personal info'),
        content: Column(
          children: [
            TextFieldWithIcon(
              icon: Icons.mail,
              label: 'Email',
              controller: emailController,
            ),
            TextFieldWithIcon(
              icon: Icons.home,
              label: 'Address',
              controller: addressController,
            ),
            TextFieldWithIcon(
              icon: Icons.phone,
              label: 'Mobile Number',
              controller: mobileController,
            ),
          ],
        ),
        isActive: true,
      ),
      Step(
        title: const Text('Contact'),
        content: Column(
          children: [
            const Text('Contenido del Paso 2'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: 'Campo de ejemplo'),
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: const Text('Checkbox de ejemplo'),
              value: false,
              onChanged: (bool? value) {
                // Manejar el cambio del checkbox aquí
              },
            ),
            const SizedBox(height: 10),
            RadioListTile<int>(
              title: const Text('Radio de ejemplo'),
              value: 1,
              groupValue:
                  0, // Cambia el grupo a un valor diferente para seleccionar este radio
              onChanged: (int? value) {
                // Manejar el cambio del radio aquí
              },
            ),
          ],
        ),
        isActive: true,
      ),
      Step(
        title: const Text('Upload'),
        content: Column(
          children: [
            const Text('Contenido del Paso 3'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: 'Otro campo de ejemplo'),
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: const Text('Otro checkbox de ejemplo'),
              value: false,
              onChanged: (bool? value) {
                // Manejar el cambio del checkbox aquí
              },
            ),
            const SizedBox(height: 10),
            RadioListTile<int>(
              title: const Text('Otro radio de ejemplo'),
              value: 2,
              groupValue:
                  0, // Cambia el grupo a un valor diferente para seleccionar este radio
              onChanged: (int? value) {
                // Manejar el cambio del radio aquí
              },
            ),
          ],
        ),
        isActive: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Pablo Bescós'),
        automaticallyImplyLeading: false, // Centra el título
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < _steps.length - 1) {
              _currentStep += 1;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        steps: _steps,
        type: StepperType.horizontal,
      ),
    );
  }
}

class TextFieldWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;

  const TextFieldWithIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                ),
              ),
            ),
          ],
        ));
  }
}
