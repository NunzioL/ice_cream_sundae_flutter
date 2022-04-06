import 'package:flutter/material.dart';
import 'order_screen.dart';
import 'about_screen.dart';
import 'order.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Order> _orders = [];
  var _currentsize = "Small";
  var _currentflavor = "Chocolate";
  var fudge_cost = 0.00;
  var total_cost = 0.00;
  var price = 0.00;
  var size = 2.99;
  bool peanuts = false;
  bool almond = false;
  bool strawberry = false;
  bool gummy_bears = false;
  bool m_m = false;
  bool brownies = false;
  bool oreo = false;
  bool marshmallows = false;
  var _sliderval = 0;


  @override
  Widget build(BuildContext context) {
    price = size + total_cost + fudge_cost;

      return Scaffold(
        //
        appBar: AppBar(
          title: Text("Sundae Maker"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (choice){
                if(choice == "About"){
                  gotoAboutScreen();
                }
                else{
                  gotoOrderHistory();
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Order History', 'About'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),

                  );
                }).toList();
              },
            ),
          ],
          centerTitle: true,
        ),



      body: SafeArea(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              alignment: Alignment(0.00, -0.90),
              child: Text("Choose Toppings",
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            ),

            Text("\$$price",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            DropdownButton(
                items: const [
                  DropdownMenuItem(
                      child: Text("Small"),
                      value: "Small"
                  ),
                  DropdownMenuItem(
                      child: Text("Medium"),
                      value: "Medium"
                  ),
                  DropdownMenuItem(
                      child: Text("Large"),
                      value: "Large"
                  ),
                ],
                value: _currentsize,
                onChanged: (String? str){
                  setState(() {
                    _currentsize = str!;
                    if (_currentsize == "Small"){
                      size = 2.99;
                    }
                    if (_currentsize == "Medium"){
                      size = 3.99;
                    }
                    if (_currentsize == "Large"){
                      size = 4.99;
                    }
                  });
                }
            ),
            DropdownButton(
                items: const [
                  DropdownMenuItem(
                      child: Text("Chocolate"),
                      value: "Chocolate"
                  ),
                  DropdownMenuItem(
                      child: Text("Vanilla"),
                      value: "Vanilla"
                  ),
                  DropdownMenuItem(
                      child: Text("Strawstrawberry"),
                      value: "Strawstrawberry"
                  ),
                ],
                value: _currentflavor,
                onChanged: (String? str){
                  setState(() {
                    _currentflavor = str!;
                  });
                }
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CheckboxListTile(
                          value: peanuts,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? val){
                            setState(() {
                              peanuts = val!;
                              if(peanuts == true){
                                total_cost += 0.15;
                              }
                              else{
                                total_cost -= 0.15;
                              }
                            });
                          },
                          title: Text("Peanuts"),
                      ),
                      CheckboxListTile(
                        value: almond,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? val){
                          setState(() {
                            almond = val!;
                            if(almond == true){
                              total_cost += 0.15;
                            }
                            else{
                              total_cost -= 0.15;
                            }
                          });
                        },
                        title: Text("Almond"),
                      ),
                      CheckboxListTile(
                        value: strawberry,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? val){
                          setState(() {
                            strawberry = val!;
                            if(strawberry == true){
                              total_cost += 0.20;
                            }
                            else{
                              total_cost -= 0.20;
                            }
                          }
                          );
                        },
                        title: Text("Strawberry"),
                      ),
                      CheckboxListTile(
                        value: oreo,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? val){
                          setState(() {
                            oreo = val!;
                            if(oreo == true){
                              total_cost += 0.20;
                            }
                            else{
                              total_cost -= 0.20;
                            }
                          });
                        },
                        title: Text("Oreo"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                      children: [
                        CheckboxListTile(
                          value: gummy_bears,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? val){
                            setState(() {
                              gummy_bears = val!;
                              if(gummy_bears == true){
                                total_cost += 0.20;
                              }
                              else{
                                total_cost -= 0.20;
                              }
                            });
                          },
                          title: Text("Gummy Bears"),
                        ),
                        CheckboxListTile(
                          value: m_m,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? val){
                            setState(() {
                              m_m = val!;
                              if(m_m == true){
                                total_cost += 0.25;
                              }
                              else{
                                total_cost -= 0.25;
                              }
                            });
                          },
                          title: Text("M&M"),
                        ),
                        CheckboxListTile(
                          value: brownies,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? val){
                            setState(() {
                              brownies = val!;
                              if(brownies == true){
                                total_cost += 0.20;
                              }
                              else{
                                total_cost -= 0.20;
                              }
                            });
                          },
                          title: Text("Brownies"),
                        ),
                        CheckboxListTile(
                          value: marshmallows,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? val){
                            setState(() {
                              marshmallows = val!;
                              if(marshmallows == true){
                                total_cost += 0.15;
                              }
                              else{
                                total_cost -= 0.15;
                              }
                            });
                          },
                          title: Text("Marshmallows"),
                        ),
                      ],
                    )
                )
              ],
            ),
            Row(
              children: [
                Text("Fudge"),
                Expanded(
                    child: Slider(
                      value: _sliderval.toDouble(),
                      min: 0,
                      max: 3,
                      onChanged: (double val){
                        setState(() {
                          _sliderval = val.toInt();
                          if (_sliderval == 1) {
                            fudge_cost = 0.15;
                          }
                          else if (_sliderval == 2){
                            fudge_cost = 0.25;
                          }
                          else if (_sliderval == 3){
                            fudge_cost = 0.30;
                          }
                          else{
                            fudge_cost = 0;
                          }

                        }
                        );
                      },
                    )
                ),
                Text("${_sliderval}oz"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  var orderMade = Order(_currentsize, price, _currentflavor);
                  _orders.add(orderMade);
                  setState(() {
                    peanuts = true;
                    almond = true;
                    strawberry = true;
                    gummy_bears = true;
                    m_m = true;
                    brownies = true;
                    oreo = true;
                    marshmallows = true;
                    _sliderval = 3;
                    _currentsize = "Large";
                    size = 4.99;
                    total_cost = 1.50;
                    fudge_cost = 0.30;
                  });
                },
                    child: Text("The Works"),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    peanuts = false;
                    almond = false;
                    strawberry = false;
                    gummy_bears = false;
                    m_m = false;
                    brownies = false;
                    oreo = false;
                    marshmallows = false;
                    _sliderval = 0;
                    _currentsize = "Small";
                    size = 2.99;
                    total_cost = 0.00;
                    fudge_cost = 0.00;
                  });
                },
                  child: Text("Reset"),
                ),
                ElevatedButton(onPressed: (){
                  var orderMade = Order(_currentsize, price, _currentflavor);
                  _orders.add(orderMade);
                  setState(() {
                    peanuts = false;
                    almond = false;
                    strawberry = false;
                    gummy_bears = false;
                    m_m = false;
                    brownies = false;
                    oreo = false;
                    marshmallows = false;
                    _sliderval = 0;
                    _currentsize = "Small";
                    size = 2.99;
                    total_cost = 0.00;
                    fudge_cost = 0.00;
                  });
                },
                  child: Text("Order"),
                ),
              ],
            )
          ],
        ),
      ),
      );
  }
  void gotoAboutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),// New File AboutScreen
        ),
      );
    }

    void gotoOrderHistory() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderHistory(
            orders: _orders,
          ), // New file OrderScreen
        ),
      );
    }
  }
