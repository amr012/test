import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(

          body: MyHomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int x = 0;
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      x--;
                    });
                  },
                  child: Icon(Icons.minimize),
                ),
              ),
              SizedBox(width: 40,),
              CircleAvatar(radius: 35,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      x++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),

          Text("The Number Of Cars $x",style: TextStyle(fontSize: 25),),
          SizedBox(height: 20,),


          RaisedButton(
            child: Text("Choose Date",style: TextStyle(fontSize: 25),),
            onPressed: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime(1994),
                firstDate: DateTime(1960),
                lastDate: DateTime(2021),
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: true,
              );

              final snackBar =
              SnackBar(content: Text("Date Picked $datePicked"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
          SizedBox(height: 20,),


        ],
      ),
    );
  }
}

