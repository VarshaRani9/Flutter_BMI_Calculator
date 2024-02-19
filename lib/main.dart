import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var res = "";
  var bgColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  SizedBox(height: 21,),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text("Enter Weight in Kg"),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text("Enter Height in ft."),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text("Enter "),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){

                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if(wt!="" && ft!="" && inch!="") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var inchh = int.parse(inch);

                      var tot_inch = (ift * 12) + inchh;
                      var tot_meter = (tot_inch * 2.54) / 100;

                      var bmi = iwt / (tot_meter * tot_meter);
                      var msg = "";

                      if(bmi>25){
                        msg = "You are Overweight";
                        bgColor = Colors.pink.shade200;
                      }
                      else if(bmi<18){
                        msg = "You are underWeight";
                        bgColor = Colors.yellow.shade100;
                      }
                      else{
                        msg = "You are healthy";
                        bgColor = Colors.green.shade300;
                      }
                      setState(() {
                        res = "${msg}, Your BMI is : ${bmi.toStringAsFixed(2)}";
                      });
                    }
                    else {
                      setState(() {
                        res = "Please fill all the inputs";
                      });
                    }

                  }, child: Text("Calculate BMI", style: TextStyle(fontSize: 22),)),
                  SizedBox(height: 11,),
                  Text(res,style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          )
      ),
    );
  }
}
