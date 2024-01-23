import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_mobigic/logic/convertstringtomatrix.dart';
import 'package:test_mobigic/logic/hightdireaction.dart';

class AlphabetScreen extends ConsumerStatefulWidget {
  final int m, n;
  final String alphabet;
  const AlphabetScreen(
      {super.key, required this.m, required this.n, required this.alphabet});

  @override
  ConsumerState<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends ConsumerState<AlphabetScreen> {
  List<List<String>> resultMatrix = [];
  List<List<String>> data = [];

  List availablealphabet = [];
  TextEditingController search = TextEditingController();
  // @override
  // void initState() {
  //   log('come');
  //   resultMatrix = convertintolist(widget.alphabet, widget.m, widget.n);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    resultMatrix = convertintolist(widget.alphabet, widget.m, widget.n);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                onFieldSubmitted: (text) {
                  availablealphabet.clear();

                  setState(() {
                    for (int i = 0; i < text.length; i++) {
                      availablealphabet.add(text[i]);
                    }
                  });
                  setState(() {
                    data = highlightTextInGrid(grid: resultMatrix, text: text);
                  });
                  // searchInMatrix("abcd", 4, 3, resultMatrix);
                },
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
            data.isEmpty
                ? const SizedBox.shrink()
                : AspectRatio(
                    aspectRatio: 1 / 4,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.m == 0
                            ? 1
                            : widget.m, // Spacing between rows
                      ),
                      itemCount: data.length * data[0].length,
                      itemBuilder: (BuildContext context, int index) {
                        int rowIndex = index ~/ data[0].length;
                        int colIndex = index % data[0].length;

                        return GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                                color: data[rowIndex][colIndex].contains("*")
                                    ? Colors.blueAccent
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            // color: data[rowIndex][colIndex] == "*"
                            //     ? Colors.blueAccent
                            //     : Colors.black,
                            child: Center(
                              child: Text(
                                data[rowIndex][colIndex],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
