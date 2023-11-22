import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: Column(children: [
        const SizedBox(height: 27),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    maxRadius: 25,
                    minRadius: 25,
                    backgroundImage: AssetImage("assets/images/two.PNG"),
                  ),
                  SizedBox(width: 10),
                  Text("Hello, Magdy!"),
                ],
              ),
              const CircleAvatar(
                backgroundColor: Color(0xffF5F5F5),
                maxRadius: 25,
                minRadius: 25,
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 19,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find Your Stay",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(10)),
              width: 330,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Search here...",
                      style: TextStyle(color: Color(0xff595959), fontSize: 15),
                    ),
                    Icon(
                      Icons.search,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Laptop",
                        style: TextStyle(color: Color(0xff595959)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text("camera",
                          style: TextStyle(color: Color(0xff595959))),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text("mobile",
                          style: TextStyle(color: Color(0xff595959))),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text("shoes", style: TextStyle(color: Color(0xff595959))),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text("shoes", style: TextStyle(color: Color(0xff595959))),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage: AssetImage("assets/images/win.jpeg"),
                      ),
                      SizedBox(height: 8),
                      Text("shoes", style: TextStyle(color: Color(0xff595959))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Our Properties",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                  Text("View All", style: TextStyle(color: Color(0xff27AE61)))
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 320,
                      height: 135,
                      child: Image.asset(
                        "assets/images/win.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 20,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Magdy"),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Color(0xff27AE61),
                              ),
                              Text("Wayanad"),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 190),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff27AE61),
                            borderRadius: BorderRadius.circular(10)),
                        width: 30,
                        height: 30,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Popoular",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                  Text("View All", style: TextStyle(color: Color(0xff27AE61)))
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 125,
                      height: 75,
                      child: Image.asset(
                        "assets/images/win.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Magdy"),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Color(0xff27AE61),
                          ),
                          Text("Wayanad"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
