import 'package:flutter/material.dart';

class AlphabetScreen extends StatefulWidget {
  final int m, n;
  final String alphabet;
  const AlphabetScreen(
      {super.key, required this.m, required this.n, required this.alphabet});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                onChanged: (text) {},
                controller: search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff9A9A9A)),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),

                  //label
                  floatingLabelStyle: const TextStyle(
                      color: Color(0xcc000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  label: const Text(
                    "Search Text",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xcc000000),
                    ),
                  ),
                  //hint text
                  hintText: 'Search Text',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffdddddd)),
                  //suffix
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.m == 0 ? 1 : widget.m,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0)),
                    child: Center(
                      child: Text(
                        widget.alphabet[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
                itemCount: widget.m * widget.n,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
