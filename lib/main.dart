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
  String selectedRadio = 'Option 1';

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
              validator: (value){
                if (value!.isEmpty){
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
              validator: (value){
                if (value!.isEmpty){
                  return "Hãy nhập địa chỉ VAT";
                }
                return null;
              },
              controller: textField2,

            ),

            SizedBox(height: 16.0),
    ListTile(
    title: Text('Take out'),
    leading: Radio( //leading xac dinh phan dau va duoi cua radio
    value: 0, //value=0 va groupValue=0 => hien thi nut cham tron
    groupValue: 1, //value=0 va groupValue=1 => hien thi nut tron
    onChanged: (value){

    }
    ),
    ),
            ListTile(
              title: Text('Sit down'),
              leading: Radio( //leading xac dinh phan dau va duoi cua radio
                  value: 0, //value=0 va groupValue=0 => hien thi nut cham tron
                  groupValue: 1, //value=0 va groupValue=1 => hien thi nut tron
                  onChanged: (value){

                  }
              ),
            ),
            ListTile(
              title: Text('Delivery'),
              leading: Radio( //leading xac dinh phan dau va duoi cua radio
                  value: 0, //value=0 va groupValue=0 => hien thi nut cham tron
                  groupValue: 1, //value=0 va groupValue=1 => hien thi nut tron
                  onChanged: (value){

                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Đổi màu nền của nút thành màu xanh
                    onPrimary: Colors.white, // Đổi màu văn bản của nút thành màu trắng
                  ),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {

                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Đổi màu nền của nút thành màu xanh
                    onPrimary: Colors.white, // Đổi màu văn bản của nút thành màu trắng
                  ),
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle event when user presses "Delete" button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Đổi màu nền của nút thành màu xanh
                    onPrimary: Colors.white, // Đổi màu văn bản của nút thành màu trắng
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
