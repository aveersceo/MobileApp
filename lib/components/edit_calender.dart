import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
class edit_calender extends StatefulWidget {
  const edit_calender({super.key});

  @override
  State<edit_calender> createState() => _edit_calenderState();
}

class _edit_calenderState extends State<edit_calender> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    _tabController=new TabController(length: 6, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TabBar(controller:_tabController,indicatorColor: Colors.black54,tabs: [
        Tab(child: Text('MON',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
        Tab(child: Text('TUES',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
          Tab(child: Text('WED',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
            Tab(child: Text('THURS',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
              Tab(child: Text('FRI',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
                Tab(child: Text('SAT',style: TextStyle(color: Colors.black,fontFamily: 'Poppins Bold'),)),
        ]),
        Expanded(
          child: TabBarView(controller: _tabController,children: [
            SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('COM'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
             SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('IT LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('COM'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('GAMES'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('GAMES'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
             SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text(' TEST LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('GAMES'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('Ds'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
             SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('IT LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('TEST'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('GAMES'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
             SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('SE'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
             SingleChildScrollView(
              child: Column(children: [
               Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('IT LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('COM'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('IT LAB'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('DS'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('AI'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
                 Card(child: Container(height: 45.0,child: Padding(padding: EdgeInsets.all(10.0),child: Row(
                children: [
                  Text('GAMES'),
                  Spacer(),
                  Icon(PhosphorIcons.pencilLight),
                  SizedBox(width: 10.0),
                  Icon(PhosphorIcons.xCircle)
                ],
               ),)
               ),),
            
              ],),
            ),
            
          ]),
        )
      ]),
    );
  }
}