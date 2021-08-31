import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rinex_shoes/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(0, 0.7),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Constants.textColor,
                        style: GoogleFonts.openSans(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Constants.textColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                          focusColor: Constants.textColor,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    decoration: BoxDecoration(
                      color: Constants.textColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/filter.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 60,
                child: ChipSet(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Rinex Shoes',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Constants.textColor,
          ),
        ),
        leading: Container(
          padding: EdgeInsets.all(14),
          child: Image.asset(
            'assets/icons/menu.png',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.card_travel,
              color: Constants.textColor,
            ),
          ),
        ]);
  }
}

enum Chips {
  Sneakers,
  Sports,
  Casuals,
  Sandles,
}

class ChipSet extends StatefulWidget {
  @override
  _ChipSetState createState() => _ChipSetState();
}

class _ChipSetState extends State<ChipSet> {
  Chips openedChip = Chips.Sneakers;
  bool animationOver = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        chip(Chips.Sneakers, Colors.amber),
        chip(Chips.Sports, Colors.orange),
        chip(Chips.Sandles, Colors.green),
        chip(Chips.Casuals, Colors.red),
      ],
    );
  }

  GestureDetector chip(Chips chip, Color color) {
    double height = openedChip == chip ? 55 : 50;
    double width =
        openedChip == chip ? MediaQuery.of(context).size.width * 0.40 : 50;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (openedChip != chip) {
            openedChip = chip;
            animationOver = false;
          }
        });
      },
      child: AnimatedContainer(
        onEnd: () {
          setState(() {
            animationOver = true;
          });
        },
        duration: Duration(milliseconds: 100),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: openedChip == chip ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            openedChip == chip
                ? BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  )
                : BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
          ],
        ),
        child: animationOver == true && openedChip == chip
            ? Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    margin: EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.person),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        chip.toString().split('.')[1],
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Icon(Icons.person),
      ),
    );
  }
}
