import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/constant/routes.dart';

class ProductDetailssm extends StatefulWidget {
  const ProductDetailssm({Key? key}) : super(key: key);

  @override
  State<ProductDetailssm> createState() => _ProductDetailssmState();
}

class _ProductDetailssmState extends State<ProductDetailssm> {
  int _quantity = 0;
  final List<String> _images =
      List.generate(8, (index) => "assets/images/sho.jfif");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Center(
                child: Text(
              "Details Product",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.offNamed(AppRoute.product);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite, color: Colors.redAccent),
              )
            ]),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/sho.jfif",
                    width: 300,
                    height: 280,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "magdy ahmed Siaf Al-Ariki MAgdy.com",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    "\$19.99",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Sign Up With Your Email And Password OR Continue With Social Media"
                              "please Enter Your Email Address To Recive A verification code",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int index = 0;
                                    index < min(4, _images.length);
                                    index++)
                                  Container(
                                      padding: const EdgeInsets.all(3.5),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(_images[index],
                                          width: 54)),
                                if (_images.length > 3)
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                            _images[0],
                                            width: 53,
                                            height: 55,
                                          )),
                                      Container(
                                        width: 65,
                                        height: 60,
                                        padding: const EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(
                                          "+${_images.length - 3}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Row(
                children: [
                  Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(999)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              if (_quantity > 0) {
                                _quantity--;
                              }
                            }),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey.shade900,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            "$_quantity",
                            style: const TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              _quantity++;
                            }),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey.shade900,
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade900),
                          fixedSize: MaterialStateProperty.all(
                              const Size(double.infinity, 65)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child:
                          const Text("Add to Cart", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
