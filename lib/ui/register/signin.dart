import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: Container(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 115,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("RTS",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              )),
                          const SizedBox(height: 5),
                          const Divider(thickness: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Fultter Bootcamp",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Icon(Icons.arrow_forward, size: 15),
                            ],
                          ),
                        ]),
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text("Sign up",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                            )))
                  ])
                ]),
          ),
          Center(
              child: Container(
                  width: 400,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Text("Student Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w900,
                        )),
                    SizedBox(height: 10),
                    Text(
                        "Welocome again, Enter your details to get sign in to your account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 35,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Email/Phone No",
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1),
                            )),
                      ),
                    ),
                  ])))
        ])));
  }
}
