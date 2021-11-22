import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/api.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/pages/condo/condo_model.dart';
import 'package:mini_project/src/services/network.dart';


class CondoPage extends StatefulWidget {
  @override
  _CondoPageState createState() => _CondoPageState();
}

class _CondoPageState extends State<CondoPage> {

  Future<CondoModel> _future;
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
  void _filterCountries(value) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
          country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('คอนโดมิเนียม')
            : TextField(
          onChanged: (value) {
            _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                filteredCountries = countries;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // showSearch(context: context, delegate: Search());

              setState(() {
                this.isSearching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<CondoModel>(
          future: NetworkService().getAllCondoDio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.condos.length,
                itemBuilder: (context, index) {
                  var condo = snapshot.data.condos[index];

                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoute.condodetailRoutr,
                            arguments: condo);
                      },
                      title: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                API.CONDO_IMAGE + condo.condoimage,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    condo.condoName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.assignment_outlined),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 150),
                        Center(child: Text('Leaderboard')),
                        SizedBox(height: 150),
                        // Checkbox(
                        //     value: monVal,
                        //     onChanged: (bool value) {
                        //       setState(() {
                        //         monVal = value;
                        //       });
                        //     })
                      ],
                    ),
                  ),
                );
              });
          // // Navigator.pushNamed(context, AppRoute.videoRoute,
          //     arguments: _movieModel.id);
        },
      ),
    );
  }
}
