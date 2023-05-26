import 'package:canchitas/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  GridDashboard({super.key});

  Items item1 = Items(
      title: "Futbol",
      subtitle: "Canchas de Futbol 11",
      img: "assets/images/Soccer.png",
      // route: "/sportFields"
  );

  Items item2 = Items(
      title: "VoleyBall",
      subtitle: "Canchas de VoleyBall",
      img: "assets/images/volleyball.png",
      // route: "/sportFields"
  );

  Items item3 = Items(
      title: "BasketBall",
      subtitle: "Canchas de BasketBall",
      img: "assets/images/Basketball.png",
      // route: "/sportFields"
  );

  Items item4 = Items(
      title: "Futsal",
      subtitle: "Canchas de Futsal",
      img: "assets/images/Futsal.png",
      // route: "/sportFields"
  );

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<Items> listMenu = [item1, item2, item3, item4];
    return Flexible(
        child: GridView.count(
            childAspectRatio: 0.7,
            padding: const EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: listMenu.map((data) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 10),
                    )
                  ],
                  color: Color.fromARGB(139, 3, 126, 44),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "SportsBar",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, data.route);
                      },
                      child: Image.asset(data.img, width: 300),
                    ),
                    // Image.asset(data.img, width: 300),
                    const SizedBox(height: 30),
                    Text(
                      data.subtitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "SportsBar",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              );
            }).toList()));
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  String route;
  Items({required this.title, required this.subtitle, required this.img, this.route = ""});
}