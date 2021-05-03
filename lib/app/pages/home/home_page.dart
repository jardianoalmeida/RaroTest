import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:raro_test/app/constants/routers.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';
import 'package:raro_test/app/widgets/button_app/button_app_widget.dart';
import 'package:raro_test/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:raro_test/app/widgets/list_home/list_home_widget.dart';
import 'package:raro_test/app/widgets/logo_app/logo_app_widget.dart';
import 'package:raro_test/app/widgets/top_bar_expandable/top_bar_expandable_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                TopBarExpandableWidget(
                  decoration: BoxDecoration(
                    color: AppColorScheme.primarySwatch,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: LogoAppWidget(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Caminhões",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('vehicle')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return InkWell(
                                  onTap: (){
                                      Modular.to.pushNamed(AppRoutes.addVehicle, arguments: snapshot.data!.docs[index]);
                                  },
                                  child: ListHomeWidget(
                                    name: snapshot.data!.docs[index]['model'] ?? "",
                                    linkImage: snapshot.data!.docs[index]['img'] ?? "",
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete_outline, color: Colors.red,),
                                        onPressed: (){
                                          CustomAlertDialog.confirmDialog(
                                            context,
                                            title: "Deseja remover essse registro?",
                                            onOption1: (){
                                              Navigator.pop(context);
                                            },
                                            onOption2: (){
                                              FirebaseFirestore.instance.collection("vehicle").doc(snapshot.data!.docs[index].id).delete();
                                            },
                                            content: Container(
                                              height: 50,
                                            ),
                                            option1: 'Não',
                                            option2: 'Sim',
                                            option1Style: TextStyle(color: Colors.black),
                                            option2Style: TextStyle(color: Colors.red),
                                          );
                                        },
                                      )
                                  ),
                                );
                              });
                      }
                    }),
              ],
            ),
            Positioned(
                top: 50,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20),),),
                  child: IconButton(icon: Icon(Icons.settings), onPressed: (){
                    Modular.to.pushNamed(AppRoutes.settings);
                  },),)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed(AppRoutes.addVehicle);
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar',
      ),
    );
  }
}
