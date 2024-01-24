import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_mobigic/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController mcontroller = TextEditingController();
  TextEditingController ncontroller = TextEditingController();
  TextEditingController alpabet = TextEditingController();
  int m = 0;
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Column(
            children: [
              Text('Mobigic Test',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              Text('step 1 to 4',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ],
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter No Of Row & No Column ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    //border
                    onChanged: (text) {
                      if (text == "") {
                        setState(() {
                          m = int.parse("1");
                        });
                      } else {
                        setState(() {
                          m = int.parse(text);
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: mcontroller,
                    decoration: const InputDecoration(
                      //label

                      label: Text(
                        "No Of M ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xcc000000),
                        ),
                      ),
                      //hint text
                      hintText: 'No of M',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffdddddd)),
                      //suffix
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    onChanged: (text) {
                      if (text == "") {
                        setState(() {
                          n = int.parse("1");
                        });
                      } else {
                        setState(() {
                          n = int.parse(text);
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: ncontroller,
                    decoration: const InputDecoration(
                      label: Text(
                        "No Of N ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xcc000000),
                        ),
                      ),
                      //hint text
                      hintText: 'No of N',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffdddddd)),
                      //suffix
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                onFieldSubmitted: (text) {
                  if (text.length != m * n) {
                    Fluttertoast.showToast(
                        msg: "Alpabet Should be ${m * n}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                },
                controller: alpabet,
                decoration: const InputDecoration(
                  label: Text(
                    "Enter Text",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xcc000000),
                    ),
                  ),
                  //hint text
                  hintText: 'Enter Text',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffdddddd)),
                  //suffix
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Enter No Of Row & No Column ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1 / 4,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: m == 0 ? 1 : m,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0)),
                    child: Center(
                      child: Text(
                        alpabet.text.length != m * n ? "" : alpabet.text[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
                itemCount: m * n,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
            onPressed: () {
              alpabet.text.isEmpty
                  ? Fluttertoast.showToast(
                      msg: "Alpabet Requried",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      textColor: Colors.black,
                      fontSize: 16.0)
                  : Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AlphabetScreen(
                            m: m,
                            n: n,
                            alphabet: alpabet.text,
                          )));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            child: const Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            )),
      ),
    );
  }
}
