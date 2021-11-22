import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/api.dart';

import 'package:mini_project/src/pages/dormitory/dormitory_model.dart';
import 'package:mini_project/src/services/network.dart';


class DormitoryPage extends StatefulWidget {
  @override
  _DormitoryPageState createState() => _DormitoryPageState();
}

class _DormitoryPageState extends State<DormitoryPage> {

  Future<DormitoryModel> _future;
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
            ? Text('หอพัก')
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
        child: FutureBuilder<DormitoryModel>(
          future: NetworkService().getAllDormitoryDio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.Dormitorys.length,
                itemBuilder: (context, index) {
                  var dormitory = snapshot.data.Dormitorys[index];

                  return Container(
                    child: ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                API.DORMITORY_IMAGE + dormitory.dmimage,
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
                                    dormitory.dmName,
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
                        SizedBox(height: 200),
                        Center(child: Text('Leaderboard')),
                        SizedBox(height: 200),
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
