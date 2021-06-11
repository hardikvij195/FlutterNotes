import 'package:cleanwheel/Classes/Classes.dart';
import 'package:cleanwheel/UserScreens/CarPage.dart';
import 'package:flutter/material.dart';


class Car_Card extends StatelessWidget {

  final Car car;
  final Us user;

  Car_Card({this.car , this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: GestureDetector(
        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarPage(user: user , car: car,)),
          );


        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                  child: Row(
                    children: [
                      Text(
                        car.BrandName+" ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Spacer(),
                      Text(
                        car.Type,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  car.RcNumber,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  car.CarName,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}