import 'package:ciclo_helper/model/manual.dart';
import 'package:ciclo_helper/screens/infos_manual.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatefulWidget{
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);

  }

_selecionaManual(int index){
return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ManualScreen(manual: manuals[index]),
            ),
          );
        },

  child: Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
        child: Stack(children: <Widget>[
          Center(
            child:Hero(
              tag: manuals[index].imageUrl,
              child: Image(
                height: 200.0,
                width: 200.0,
                image: AssetImage(
                  manuals[index].imageUrl,
                  ),
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned (top: 30.0, 
          right: 30.0,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              manuals[index].titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize:22.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BackButton(
                  color: Colors.greenAccent,
                ),
              ],
            ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Manuais e Dicas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index){
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: manuals.length,
                itemBuilder: (BuildContext context, int index){
                  return _selecionaManual(index);
                },
              ),
            ),

          ],
        ),
      ),
      
    );
  }
  
}
  
