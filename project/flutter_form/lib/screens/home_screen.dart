import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/checkbox_form_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  // stateful ต้องตรงกับ value
  var gender = 'male';
  var newsletter = false;
  var driver = false;
  var marry = false;
  var child = false;
  var age = 0.0;

  final channels = ['Facebook', 'Twitter', 'Instagram', 'Line']
      .map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          ))
      .toList();
  var channel = 'Facebook';

  var email = '';
  final key = GlobalKey<FormState>();

  var agreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ลงทะเบียน')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              buildTextField(),
              buildRadio(),
              buildSwitch(),
              buildCheckbox(),
              buildSlider(),
              buildDropdown(),
              buildForm(),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (!(key.currentState?.validate() ?? false)) return;

                  key.currentState?.save();
                  // ถ้ามี . ต้องมี {}
                  print('Name: ${nameController.text} ${surnameController.text}');
                  print('Gender: $gender');
                  print('Newsletteer: $newsletter');
                  print('Driver: $driver');
                  print('Marry: $marry');
                  print('Child: $child');
                  print('Age: $age');
                  print('Channel: $channel');
                  print('Email: $email');
                  print('Agreement: $agreement');
                },
                child: Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() => Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'อีเมล'),
              maxLength: 50,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value ?? '',
              validator: (value) {
                value ??= '';
                if (value.isEmpty) return 'กรุณากรอกอีเมล';
                // r จะทำการยกเลิก $ ที่ปกติใช้แทนตัวแปร
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return ' อีเมลไม่ถูกต้อง';

                return null;
              },
            ),
            CheckboxFormField(
              title: Text('ยอมรับข้อตกลงการใช้งาน'),
              initialValue: agreement,
              onSaved: (value) => agreement = value ?? false,
              validator: (value) {
                value ??= false;
                if (!value) return 'กรุณายอมรับข้อตกลงการใช้งาน';

                return null;
              },
            )
          ],
        ),
      );

  Widget buildDropdown() => DropdownButton(
        // default value ที่ display
        value: channel,
        items: channels,
        onChanged: (value) => setState(() => channel = value.toString()),
      );

  Widget buildSlider() => Slider(
        value: age,
        min: 0.0,
        max: 100.0,
        divisions: 100,
        label: age.round().toString(),
        onChanged: (value) => setState(() => age = value),
      );

  Widget buildSwitch() => Column(
        children: [
          SwitchListTile(
            title: Text('แต่งงาน'),
            value: marry,
            onChanged: (value) => setState(() => marry = value),
          ),
          SwitchListTile(
            title: Text('มีบุตร'),
            value: child,
            onChanged: (value) => setState(() => child = value),
          ),
        ],
      );

  Widget buildCheckbox() => Column(
        children: [
          CheckboxListTile(
            title: Text('สมัครรับจดหมายข่าว'),
            value: newsletter,
            // ค่าอะไรที่เป็น null ได้ต้องดัก ??
            // onChanged: (value) {
            //   setState(() {
            //     newsletter = value ?? false;
            //   });
            // },
            onChanged: (value) => setState(() => newsletter = value ?? false),
          ),
          CheckboxListTile(
            title: Text('ใบขับขี่รถยนต์'),
            value: driver,
            onChanged: (value) => setState(() => driver = value ?? false),
          ),
        ],
      );

  Widget buildRadio() => Column(
        children: [
          // title คือ ชื่อ | value คือ id | groupValue คือ defaultที่เลือกไว้
          RadioListTile(
            title: Text('ชาย'),
            value: 'male',
            groupValue: gender,
            // setState จะใช้ตอนที่มีผลต่อ ui จะเปลี่ยน
            onChanged: (value) => setState(() => gender = value.toString()),
          ),
          RadioListTile(
            title: Text('หญิง'),
            value: 'female',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value.toString()),
          ),
        ],
      );

  Widget buildTextField() => Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'ชื่อ'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'นามสกุล'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: surnameController,
          ),
        ],
      );
}
