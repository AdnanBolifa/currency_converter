import 'package:flutter/material.dart';

class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
  TextEditingController userInput = TextEditingController();
  String updatedText = 'Currency in LYD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Add your logic for the first icon action here
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // Add your logic for the second icon action here
            },
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {
              // Add your logic for the third icon action here
            },
            icon: const Icon(Icons.camera),
          ),
        ],
        centerTitle: false,
        title: const Text("Currency Converter"),
        backgroundColor: const Color.fromARGB(255, 61, 95, 112),
      ),
      backgroundColor: const Color.fromARGB(255, 61, 95, 112),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              updatedText,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            textField(),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 55, right: 45),
              child: convertButton(),
            ),
          ],
        ),
      ),
    );
  }

  Padding textField() {
    return Padding(
      padding: const EdgeInsets.only(right: 45, left: 15, top: 50),
      child: SizedBox(
        width: 370,
        child: TextField(
          controller: userInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            filled: true,
            fillColor: Colors.grey,
            hintText: "Please enter the amount in USD: ",
            hintStyle: TextStyle(color: Colors.white60),
            icon: Icon(
              Icons.monetization_on_outlined,
              color: Color.fromARGB(255, 81, 194, 85),
            ),
          ),
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  ElevatedButton convertButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          double? x = double.parse(userInput.text);
          x *= 5;
          x == 0
              ? updatedText = x.toString()
              : updatedText = x.toStringAsFixed(3);
        });
      },
      style: ElevatedButton.styleFrom(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 143, 172),
      ),
      child: const Icon(Icons.currency_exchange),
    );
  }
}
