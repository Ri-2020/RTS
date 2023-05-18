import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rts/ui/home/home_vm.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.find<HomeVM>();
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeVM>(builder: (vm) {
      return SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 243, 243, 243),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Dashboard",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.red, Colors.blue],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // color: Colors.black,
                          margin: const EdgeInsets.only(top: 70),
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // color: Colors.black,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 15,
                            // top: 15,
                            bottom: 15,
                          ),
                          child: const Text(
                            "username@email.com | 2007360130047",
                            style: TextStyle(
                              // fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 600,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Text(
                                        "John Doe is a software developer with over 10 years of experience. He is currently a senior software engineer at Google, where he works on the development of the company's search engine. John is a highly skilled developer with a strong understanding of computer science. He is also a talented problem solver and is able to quickly come up with creative solutions to complex problems. John is a valuable asset to any team and is always willing to help others. He is also a great communicator and is able to clearly explain complex technical concepts to both technical and non-technical audiences. John is a passionate developer who is always looking for new ways to improve his skills and knowledge. He is also a strong advocate for diversity and inclusion in the tech industry. John is a role model for aspiring developers and is an inspiration to his colleagues.",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          // color:
                                          // Color.fromRGBO(101, 101, 101, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width: 600,
                                      margin: EdgeInsets.only(top: 20),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Text(
                                        "Some thing here",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          // color:
                                          // Color.fromRGBO(101, 101, 101, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 400,
                              child: const Text(
                                  "John Doe is a software developer with over 10 years of experience. He is currently a senior software engineer at Google, where he works on the development of the company's search engine. John is a highly skilled developer with a strong understanding of computer science. He is also a talented problem solver and is able to quickly come up with creative solutions to complex problems. John is a valuable asset to any team and is always willing to help others. He is also a great communicator and is able to clearly explain complex technical concepts to both technical and non-technical audiences. John is a passionate developer who is always looking for new ways to improve his skills and knowledge. He is also a strong advocate for diversity and inclusion in the tech industry. John is a role model for aspiring developers and is an inspiration to his colleagues."),
                            ),
                            const Divider(),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 150,
                      left: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            "https://www.alexisdental.ca/files/alexis-dental-belle-river-fillings-1.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      );
    });
  }
}
