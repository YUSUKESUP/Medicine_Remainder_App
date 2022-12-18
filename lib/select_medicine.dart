import 'package:flutter/material.dart';

class SelectCard extends StatefulWidget {

   SelectCard({
    super.key,

});

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {

  int selectedIndex = 0;

  final List<CardItem> items = [
    CardItem('assets/12361.png'),
    CardItem('assets/medical_syrup_kusuri.png'),
    CardItem('assets/medicine-2.png'),
    CardItem('assets/medicine_konagusuri.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => const SizedBox(width: 3),
        itemBuilder: (context, index) {

          return GestureDetector(
            onTap: () {

              setState(() {
                selectedIndex = index;


              });
            },
            child: Card(
              color:  selectedIndex == index
                  ? Colors.cyan
                  : Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),

              ),
              child: Container(
                padding: EdgeInsets.all(7),
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                      items[index].image,
                      width: 7.5,
                      height: 9,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardItem {
  final String  image;

  CardItem(this.image,);
}
