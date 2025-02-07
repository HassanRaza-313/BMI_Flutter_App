import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.redAccent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}): super(key : key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result ="";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI APP',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),)),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

             //color: Colors.blue.shade300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Text('BMI',style : TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700),),
            SizedBox(height: 12,),
            TextField(
              controller: wtController,
              decoration: InputDecoration(
                label: Text('Enter your weight (in Kg)',style: TextStyle(fontWeight: FontWeight.w500),),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12,),
            TextField(
              controller: ftController,
              decoration: InputDecoration(
                label: Text('Enter your height in feet ',style: TextStyle(fontWeight: FontWeight.w500),),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),

                  SizedBox(height: 12,),

                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in inches ',style: TextStyle(fontWeight: FontWeight.w500),),
                      prefixIcon: Icon(Icons.line_weight ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16,),

                  ElevatedButton(

                    onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = ftController.text.toString();
                    if(wt!='' && ft!='' && inch!=''){

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch ;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;
                      var bmi = iWt/(tM*tM);

                      var msg = "";

                      if(bmi>25){
                        msg = "you are Overweight!!";
                        bgColor = Colors.orange.shade200;
                      }else if(bmi<18){
                        msg = "you are UnderWeight!!";
                        bgColor = Colors.red.shade200;
                      }else{
                        msg = "You are Healthy!!";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(2)}";
                      });

                    } else{
                      setState(() {
                        result = 'Please fill all the required blanks! ';
                      });
                    }
                  }, child: Text('Calculate'),),

                  SizedBox(
                    height: 15,
                  ),

                  Text(result,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.black),),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

