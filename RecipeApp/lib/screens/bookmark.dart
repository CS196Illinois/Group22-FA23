//Note: commented out unused imports
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodrecipe/color.dart';
//import 'package:foodrecipe/utiles/bookmarkcart.dart';
import 'package:foodrecipe/utiles/dialogbox.dart';
import 'package:foodrecipe/utiles/ingredienttile.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final _controller = TextEditingController();

  //When called, opens dialog box that gives user ability to input ingredient
  //When the "Save" button is pressed (onSave), runs saveIngredient function
  //When the "Cancel" button is pressed (onCancel), closes the dialog window
  void addNewIngredient() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveIngredient,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //removes ingredient from ingredientList
  void deleteIngredient(int index) {
    setState(() {
      ingredientList.removeAt(index);
    });
  }

  //saves ingredient to ingredientList
  //closes dialog box
  void saveIngredient() {
    setState(() {
      ingredientList.add(_controller.text);
    });
    Navigator.of(context).pop();
  }

  //initial list of ingredients, will change later
  List ingredientList = ["Apple", "Orange", "Sugar"];

  @override
  Widget build(BuildContext context) {
    //TabController has 2 tabs disabled because they are not implemented yet/may not be able to implement w/ time constraint
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            bottom: TabBar(tabs: [
              Tab(child: Text("Ingredients Available")),
              //Tab(child: Text("Saved")),
              //Tab(child: Text("Eaten")),
            ]),
            title: Text("My Fridge"),
          ),
          body: TabBarView(children: [
            //Ingredients Page
            Scaffold(
              //add button, calls addNewIngredient function above
              floatingActionButton: FloatingActionButton(
                backgroundColor: primary,
                onPressed: addNewIngredient,
                child: Icon(Icons.add),
              ),
              //creates a scrollable list of tiles with ingredients in ingredientList
              body: ListView.builder(
                itemCount: ingredientList.length,
                itemBuilder: (context, index) {
                  return IngredientTile(
                    ingredientName: ingredientList[index],
                    deleteFunction: (p0) => deleteIngredient(index),
                  );
                },
              ),
            ),

            /*
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
/*
                    Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: appBgColor,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 230, 227, 227),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/bin.svg",
                              color: Colors.red,
                              height: 26,
                              width: 26,
                            ),
                          )),
                          */
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.search,
                                    color: inActiveColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: inActiveColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Bookmarkcart(
                      image:
                          "https://images.unsplash.com/photo-1512058564366-18510be2db19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
                      name: "Rice pot",
                      subname: "Hot-pot",
                      userimage:
                          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                      username: "Noona",
                    ),
                    const Bookmarkcart(
                        image:
                            "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG1peCUyMHNhbGFkfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                        name: "Mix Sald",
                        subname: "Salad",
                        userimage:
                            "https://images.unsplash.com/photo-1604004555489-723a93d6ce74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                        username: "Liya"),
                    const Bookmarkcart(
                      image:
                          "https://images.unsplash.com/photo-1623595119708-26b1f7300075?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=383&q=80",
                      name: "Ice Cream",
                      subname: "Sweet",
                      userimage:
                          "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                      username: "Yunish",
                    ),
                    const Bookmarkcart(
                      image:
                          "https://images.unsplash.com/photo-1581512798638-ebd32054b3b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWl4JTIwc2FsYWR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                      name: "4-season salad",
                      subname: "Salad",
                      userimage:
                          "https://images.unsplash.com/photo-1581599129568-e33151627628?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                      username: "Keto",
                    )
                  ],
                ),
              ),
            ),
            */
          ])),
    );
  }
}
