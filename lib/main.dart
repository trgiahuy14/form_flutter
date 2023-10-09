import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String selectedRadio = 'Take out'; // Mặc định chọn "Take out"
  TextEditingController textField1 = TextEditingController();
  TextEditingController textField2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                labelText: 'VAT Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Hãy nhập tên VAT";
                }
                return null;
              },
              controller: textField1,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.location_on),
                labelText: 'VAT Address',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Hãy nhập địa chỉ VAT";
                }
                return null;
              },
              controller: textField2,
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Take out'),
              leading: Radio(
                value: 'Take out',
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Sit down'),
              leading: Radio(
                value: 'Sit down',
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Delivery'),
              leading: Radio(
                value: 'Delivery',
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),


            //BOX
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //  ADD button
                    _showResult();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),

                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi người dùng nhấn "Edit" button
                    _showResult();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi người dùng nhấn "Delete" button
                    _showResult();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Phần hiển thị kết quả
            Text(
              'VAT Name: ${textField1.text}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'VAT Address: ${textField2.text}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Selected Option: $selectedRadio',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  // Phương thức để hiển thị thông tin VAT và tùy chọn đã chọn
  void _showResult() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${textField1.text} ${textField2.text} $selectedRadio'),
        ),
      );
    }
  }
}
